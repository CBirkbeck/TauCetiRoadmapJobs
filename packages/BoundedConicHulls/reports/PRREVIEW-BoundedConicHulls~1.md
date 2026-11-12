# Review of BoundedConicHulls (pull request #2215 at 4afba09)

**Verdict:** needs changes

## R01 (P2) — Only the boxed lift is stated; the sources' conic-union hull theorem is excluded

- **Location:** `TauCetiRoadmap/BoundedConicHulls/README.md` lines 17–18, "Unbounded unions, common-recession theorems, general extended-valued perspectives … are outside this roadmap"; line 121 `P = convexHull ℝ U`; `Suggested.lean` line 84 `hull_exact`.
- **Claim:** The roadmap's only hull theorem is for the box-scaled lift. The theorem the sources prove, for `Pᵢ = {x | Aᵢ x − bᵢ ∈ Kᵢ}` with no box, is excluded. So the library stops below the generality of its own sources, and the boxed case is just one instance of that theorem.
- **Witness:** BG21 (v3) lines 349–385 and LTV19 lines 391–409 prove `conv ⋃Pᵢ ⊆ proj P` for proper cones, then the closure sandwich and the common-summand equality. `L` here is that lift for the rows `x ↦ (Aᵢx−bᵢ, x−l, u−x)` into `Kᵢ × ℝ₊ⁿ × ℝ₊ⁿ`.
- **Repair:** In Layer 2, take pointed cones `Kᵢ` and the unboxed lift `P̂ = {∑ vᵢ | λ ∈ simplex, Aᵢ vᵢ − λᵢ bᵢ ∈ Kᵢ}`, and state four results:
  - (a) `convexHull ℝ (⋃ Pᵢ) ⊆ P̂`.
  - (b) `P̂ ⊆ closure (convexHull ℝ (⋃ Pᵢ))` when every `Pᵢ` is nonempty (BG21 Theorem 1(1)).
  - (c) `P̂ = convexHull ℝ (⋃ Pᵢ)` when `{w | Aᵢ w ∈ Kᵢ} = {0}` for every `i`. Empty `Pᵢ` are allowed.
  - (d) The common-summand equality (BG21 Theorem 1(2); BTN01 Proposition 3.3.5(ii)).

  `hull_exact` is then (c) for the box-augmented rows, whose zero slice `{w | Aᵢw ∈ Kᵢ, w ≥ 0, −w ≥ 0}` is `{0}`. Remove "common-recession theorems" from the exclusions.

## R02 (P3) — Layer headings and title not in house form (gate `layer-ids`)

- **Location:** `README.md` lines 84, 115 and 138, e.g. "## Layer 1. Scaled boxes and branch interfaces"; line 1, "# Roadmap: Finite boxed conic-union hulls".
- **Claim:** A layer id must read `Layer N:`, and the title must be lower case.
- **Witness:** The gate's `layer-ids` check fails at lines 84, 115 and 138 ("write `Layer N: title`").
- **Repair:** Use these headings:
  - `# Roadmap: finite boxed conic-union hulls`
  - `## Layer 1: scaled boxes and branch interfaces`
  - `## Layer 2: exact finite-union hull`
  - `## Layer 3: compact lift and closed hull`

## R03 (P3) — No targets: undivided layers, and the definitions sit in Conventions (gate `target-ids`)

- **Location:** `README.md` lines 34–53: the definitions of `B`, `U`, `L`, `P` and `F`, followed by one prose `**Checks.**` paragraph. Lines 84–161: the layer bodies.
- **Claim:** No layer has a `### k.n` target. No definition has an API bullet list. The Checks are a single paragraph covering four objects, and `U` and `sumBlocks` have none.
- **Witness:** The gate's `target-ids` check fails at line 84: "layered README states no targets".
- **Repair:**
  - Move the definitions into `### 1.1 Branches and their union` (`branch`, `boundedUnion`) and `### 1.2 The scaled-box lift and its projections` (`lift`, `sumBlocks`, `projection`, `fullLift`).
  - Give each definition API bullets (the membership equivalences and image identities) and a bulleted `**Checks.**` list of at least three.
  - Split the theorems into `### 1.3 Weight and block bounds`, `### 1.4 Normalization and one-hot lifts`, `### 2.1 Exact hull`, `### 3.1 Compactness` and `### 3.2 Closed hull`, each with its own `*Needs:*` line.

## R04 (P3) — No Check is a negative control for a hypothesis

- **Location:** `README.md` lines 48–53, 130–132 and 153–156 (the Checks and Examples).
- **Claim:** No Check shows any of these failures:
  - hull exactness failing without `0 ∈ Kᵢ`;
  - "`P = ∅` for an all-empty family" failing for rows that are not cones;
  - compactness and the closed-hull equality failing for a cone that is not closed.
- **Witness:** Controls (i)–(iii) in the table give `P = ∅ ≠ [0,1]`; `0 ∈ P` while `U = ∅`; and `P = (0,1]`, which is not closed.
- **Repair:** Add three Checks:
  - (i) `n = 1`, box `[0,1]`. Branch 1: `A = 0`, `b = 0`, `K = {0}`. Branch 2: `A = 0`, `b = 0`, `K = (0,∞)`, which is not pointed. Then `L = ∅`, so `P = ∅ ≠ [0,1] = convexHull U`.
  - (ii) `ι = Fin 2`, `Aᵢ = 0`, `bᵢ = −2`, `Kᵢ = {1}`, box `[0,1]`. Both branches are empty, yet `λ = (½,½)`, `v = 0` lies in `L`, so `P = {0}`.
  - (iii) `n = 1`, `Y = ℝ²`, `A x = (x,0)`, `b = (0,−1)`, `K = {(a,c) | a > 0} ∪ {0}`, box `[0,1]`. Then `B = P = (0,1]`, which is not closed, and `closure (convexHull U) = [0,1] ≠ P`.

## R05 (P3) — No theorem carries a locator

- **Location:** `README.md` line 121 "`P = convexHull ℝ U`." and line 149 "`closure (convexHull ℝ U) = P`.". Lines 84–161 contain no source citation at all.
- **Claim:** Sources appear only under References. No target cites a theorem and page at the claim.
- **Witness:** Grepping lines 84–161 for "Theorem", "Proposition", "p." or a year finds only "zero-block theorem" (line 125).
- **Repair:**
  - After the hull equality, add: "(the bounded case of Bernal Neira–Grossmann, Theorem 1(2) with `W = {0}`, arXiv v3 pp. 7–8; Ben-Tal–Nemirovski, Proposition 3.3.5(i), printed p. 100; the empty-branch and non-closed-cone cases are this roadmap's variant)".
  - Do the same for the closed hull (Proposition 3.3.5, printed pp. 100–102) and for the lift (HR-Cone, arXiv v3 p. 8).

## R06 (P3) — 18 of the 19 Lean names never appear in the README

- **Location:** `Suggested.lean` lines 19–103. The README names only `sumBlocks` (line 40).
- **Claim:** README and Lean disagree. `Data`, `branch`, `boundedUnion`, `lift`, `projection`, `fullLift` and all ten theorems are unnamed in the README.
- **Witness:** Grepping the README for each backticked declaration name gives 1 hit (`sumBlocks`) and 0 for the other 18.
- **Repair:** Name each declaration at its target, e.g. "Define `lift D K` as `L` …" and "Prove `hull_exact`: `projection D K = convexHull ℝ (boundedUnion D K)` for carriers of `PointedCone ℝ (Y i)`".

## R07 (P3) — Padding in Suggested.lean

- **Location:** `Suggested.lean` lines 55–82: `zero_block`, `normalized_block`, `empty_branch_weight_block`, `convex_lift`, `convex_projection`.
- **Claim:** These are boundary cases, a mirrored README Check, or proof steps of `hull_exact`. None is a headline theorem.
- **Witness:**
  - `convex_projection` elaborates as `(hull_exact D K) ▸ convex_convexHull ℝ _`.
  - `zero_block` mirrors the Check "forced zero block at zero weight" (line 51).
  - `empty_branch_weight_block` is the empty-branch case.
- **Repair:** Delete them from `Suggested.lean`. The README keeps the statements as Layer 1–2 targets.

## R08 (P3) — Declarations without a mathematical docstring

- **Location:** `Suggested.lean` lines 19, 20, 36, 39, 44 and 46, and all ten theorems (lines 55–103). The docstrings at lines 32 and 49 describe usage, not mathematics.
- **Claim:** 16 declarations have no docstring, and the docstrings of `branch` and `fullLift` state no mathematics.
- **Witness:** For example, `theorem hull_exact` (line 84) has no `/-- … -/` above it.
- **Repair:** Add a docstring to each declaration. For example, before `hull_exact`: `/-- For pointed cones Kᵢ, the projection of the scaled-box lift is the convex hull of the union of the boxed conic sets; no branch need be nonempty. -/`

## R09 (P3) — Supplier contracts name a Tau Ceti construction that does not exist, and leave APIs unnamed

- **Location:** `README.md` lines 71–72, "Tau Ceti's scalar perspective monotonicity and closed carrier homogenization are neighboring constructions"; line 19, "Rational polyhedra, cone faces and finite-generator slice theory keep their existing APIs".
- **Claim:** No declaration is named. There is no closed-carrier homogenization in Tau Ceti at `2fd255d`. The contracts also lack `### From Mathlib` and `### From Tau Ceti` headings.
- **Witness:** Grepping for "homogeni" in `TauCeti/Analysis/Convex` and `TauCeti/Geometry/Convex` finds nothing. The perspective result is `ConvexOn.antitoneOn_mul_map_div` (`TauCeti/Analysis/Convex/Perspective.lean:35`).
- **Repair:**
  - Put the table under `### From Mathlib`.
  - Add `### From Tau Ceti`: "Nothing is consumed; `ConvexOn.antitoneOn_mul_map_div` (`TauCeti/Analysis/Convex/Perspective.lean`) is a scalar perspective inequality and is not used."
  - Delete "closed carrier homogenization".
  - In Scope, name the declarations meant (e.g. `IsConvexPolyhedron`, `TauCeti/Analysis/Convex/Polyhedron/Basic.lean:56`) or delete the sentence.

## R10 (P3) — Process and tooling text

- **Location:** `README.md` lines 81–82, "Use the repository's pinned dependencies and documented `lake exe cache get` / `lake build` workflow, and run `python3 .github/scripts/check_roadmap_topics.py` for the metadata."; line 212, "No thesis, publisher PDF or source extract is part of this roadmap."
- **Claim:** Build instructions and statements about the submission are process, not mathematics.
- **Witness:** House rule: the README is timeless, and "How to read the build" is one paragraph on layer order and what each layer delivers.
- **Repair:** Delete both sentences. Keep line 80, which gives the layer order.

## R11 (P3) — Undefined vocabulary

- **Location:** `README.md` line 89, "every copied coordinate"; line 98, "one-hot lift"; lines 11 and 144, "physical dimension" and "physical coordinate"; lines 25 and 43, "raw row sets"; lines 97 and 119, "native cone carriers".
- **Claim:** These terms are neither the literature's nor defined in the README.
- **Witness:** GN25 line 194 calls the `vᵢ` "disaggregated variables", copies of the original variables. The README defines none of "copied", "one-hot", "physical" or "native".
- **Repair:** In Conventions, define once: "`x` is the original-space point, `vᵢ` the disaggregated variable of branch `i`, `λᵢ` its weight; the one-hot lift of `x ∈ Bᵢ` is `λ = Pi.single i 1`, `v = Pi.single i x`". Then replace "physical" by "original-space", "raw row sets" by "arbitrary sets `Kᵢ`", and "native cone carriers" by "carriers of `PointedCone ℝ (Y i)`".

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| `zero_block` (arbitrary rows) | `λᵢ = 0`, `l = −1`, `u = 2`; `n = 0` | `−1·0 ≤ vᵢ ≤ 2·0`, so `vᵢ = 0`; for `n = 0`, `vᵢ ∈ {0}` | holds | R07 |
| weight `λᵢ ∈ [0,1]` | `λ = (1,0)`, `(½,½)` | `0 ≤ λᵢ ≤ ∑λ = 1` | holds | none |
| copied bound `min(lⱼ,0) ≤ vᵢⱼ ≤ max(uⱼ,0)` | `l = 1, u = 2, λ = 0`; `l = −1, u = 2, λ = ½` | `v = 0 ∈ [0,2]` (outside `[1,2]`); `v ∈ [−½,1] ⊆ [−1,2]` | holds; the `0` in min/max is needed | none |
| projected point in `Icc l u` | two blocks | `∑vᵢ ∈ [l·∑λ, u·∑λ] = [l,u]` | holds | none |
| product box contains `L` | as the two rows above | `λ ∈ [0,1]^ι`, `vᵢⱼ ∈ [min(lⱼ,0), max(uⱼ,0)]` | holds | none |
| `normalized_block` | `A = 0`, `b = 0`, `K = {0}`, box `[0,1]`, `λ = ½`, `v = ¼` | `2·¼ = ½ ∈ [0,1]`; `A·½ − 0 = 0 ∈ {0}` | holds | R07 |
| one-hot lift | `x = ½ ∈ B₁`; branch 2: `A = 0`, `b = 1`, `K = {0}` | `λ = (1,0)`, `v = (½,0)`; row 2: `0 − 0·1 = 0 ∈ {0}` (needs `0 ∈ K₂`) | holds for pointed cones | R04 (i) |
| `empty_branch_weight_block` | branch 2 above | residual `−λ₂ ∈ {0}`, so `λ₂ = 0`, so `v₂ = 0` | holds | R07 |
| `P = ∅` for empty `ι` | `ι = Empty` | `∑_∅ λ = 0 ≠ 1`, so `L = ∅`; `U = ∅` | holds | none |
| `P = ∅` for an all-empty family | cones vs. `Kᵢ = {1}`, `bᵢ = −2`, `ι = Fin 2` | cones: all `λᵢ = 0`, contradicting `∑λ = 1`; raw rows: `Bᵢ = ∅` but `0 ∈ P` | holds only for cones, as scoped | R04 (ii) |
| image identities for `P` and `F` | by definition | `x ∈ P ⇔ ∃ p ∈ L, x = sumBlocks p` | holds | none |
| `convex_lift` | linear constraints, convex `Kᵢ` | preimage of `Kᵢ` under the linear map `(λ,v) ↦ Aᵢvᵢ − λᵢbᵢ` | holds | R07 |
| `convex_projection` | via `hull_exact` | `hull_exact ▸ convex_convexHull` elaborates | holds | R07 |
| `hull_exact` | `B₁ = [0,1]` (`A = id`, `b = 1`, `K = ℝ₋`), `B₂ = [2,3]` (`b = 2`, `K = ℝ₊`), box `[0,3]` | `λ = (½,½)`, `v = (½,1)` gives `1.5 ∉ U`; `P = [0,3] = convexHull U` | holds | R01 |
| `hull_exact`, `0 ∉ K` control | `K₂ = (0,∞)`, `A₂ = 0`, `b₂ = 0` | `L = ∅`; `P = ∅ ≠ [0,1]` | pointedness needed | R04 (i) |
| `isCompact_lift` | closed `Kᵢ`; empty `ι`; `l > u` | `L` is closed and inside the product box; in both degenerate cases `L = ∅` | holds | none |
| closedness control | `K = {a > 0} ∪ {0}`, `Ax = (x,0)`, `b = (0,−1)` | `B = P = (0,1]`, not closed | closedness needed | R04 (iii) |
| `isCompact_fullLift`, `isCompact_projection` | images of `L` | `p ↦ (sumBlocks p, p)` and `sumBlocks` are continuous | holds | none |
| `closed_hull_exact` | `hull_exact` example; control (iii) | `[0,3]` is closed; control: `closure (0,1] = [0,1] ≠ P` | holds with closed cones | none |
| Layer 1 example | `n = 1`, `A = 0`, `b = 0`, `K = {0}`, box `[0,1]` | `x = ½`: `λ = 1`, `v = ½ ∈ L` | consistent | none |
| Layer 3 example, `n = 0` and `mᵢ = 0` | `X = {0}`, `Yᵢ = {0}`, `Kᵢ = ⊤` | `Bᵢ = {0}`, `P = {0}`; for empty `ι`, `P = ∅` | consistent | none |
| `PointedCone` is not salient | `⊤ ⊆ ℝ²` | `⊤` is a `PointedCone` containing `±e₁` | as stated | none |
| R01 repair (c) | boxed rows `(Ax−b, x−l, u−x)` in `K×ℝ₊ⁿ×ℝ₊ⁿ` | zero slice `= {0}`, so (c) gives `hull_exact` | repair consistent | — |
| R01 (c) needs its hypothesis | unboxed `A = 0`, `b = 1`, `K = {0}` | zero slice `= ℝⁿ`; lift projection `= ℝ ≠ ∅` | hypothesis needed | — |
| BG21 Theorem 1 and HR-Cone | v1 lines 384–418, 441; v3 lines 349–385, 405 | v1 pp. 10–11; v3 pp. 7–8 | locators match | none |
| LTV19 Theorem 4 | line 391 | p. 10; proper cones, nonempty or common summand | matches | none |
| BTN01 Proposition 3.3.5 | line 6636; printed pp. 99–102 | nonempty CQr sets; (i) bounded, (ii) common summand | matches README's qualification | none |
| GN25 Propositions 1 and 2 | line 350; PDF p. 10 | Proposition 1 p. 8, Proposition 2 p. 10, 17 March 2026 | match | none |

- **Sources:** BG21 = arXiv 2109.09657 (v1 and v3), LTV19 = arXiv 1912.03166v2, BTN01 = the author-hosted 2001/6/18 layout, GN25 = arXiv 2508.16093v2. 8 locators were checked against the text and all match.
- **Library declarations:** 21 Mathlib names from the supplier table were opened at the pin. Examples: `PointedCone.convex` (Pointed.lean:125), `PointedCone.smul_mem_iff` (:131), `Convex.sum_mem` (Combination.lean:217), `IsCompact.of_isClosed_subset` (Compact.lean:105). All exist.
- **Duplication:** neither pin states a lifted hull of a finite union. Mathlib has only `convexHull_union` for two nonempty sets (Join.lean:174); Tau Ceti has nothing.
- **Overlap check:** read FiniteAffineBoundTightening and ExactPenalties; nothing shared. The main-closest and results-closest lists are empty.
- **Dependency check:** `depcheck: 206 roadmaps, 1896 edges, 0 problem(s)`. There are no cross-roadmap citations, and nothing outside the folder changes.
- **Gate:** FAIL, on `layer-ids` (3) and `target-ids` (1). Every other check is 0.
- **Elaboration:** `lake env lean` on `Suggested.lean` gives only the 10 `sorry` warnings. The `#check @` types of all 19 declarations match the README. `branch` and `boundedUnion` drop `[Fintype ι]`, which they do not use.
- **Probes:** `zero_block` is not closed by `simp_all [lift]` or `grind [lift]`; a four-tactic proof works. `closed_hull_exact` follows in two tactics from `hull_exact` and `isCompact_projection`, and is kept as a headline.

## Not verifiable

- BG21 published version (Comput. Optim. Appl. 88, 2024), Theorem 1, equation (2), pp. 259–260, and HR-Cone, p. 260: the DOI resolves only to a paywalled publisher page, so arXiv v1 and v3 were checked instead. Both number the display (3.2).
- SXC+99 (Ceria–Soares, Math. Program. 86, 1999), Theorem 1, pp. 600–601: paywalled (uncertified).
- LTV19 date "4 September 2020": the v2 PDF title page reads September 8, 2020 (LTV19 line 9). The arXiv listing date was not read.

## Source issues

- **Gap** in BG21 at Theorem 1, arXiv v3 pp. 7–8: the source states the hull characterisation for arbitrary proper cones but proves it only by citing Ben-Tal–Nemirovski, whose proposition covers products of Lorentz cones; it should give the argument or a reference for general closed cones; affects the proof.
- **Gap** in LTV19 at Theorem 4, p. 10: the source states the hull characterisation for arbitrary proper cones and cites only Ben-Tal–Nemirovski, whose proposition covers products of Lorentz cones; it should give the argument or a reference for general closed cones; affects the proof.
