# Review of PseudolineArrangementsAndOrientedMatroids (pull request #1523 at 8b1e5c0)

**Verdict:** needs changes

Incremental re-review of 0 changed lines since 0661565: the head merges main and leaves the roadmap folder byte-identical. The two findings are in the pull request's description, which the head contradicts.

## R01 (P3) — The description's count of `sorry` warnings is wrong

**Location:** description, "Checks run locally on the head": "`Suggested.lean` elaborates under `lake env lean` with only `sorry` warnings (52), and the Mathlib names it adds were checked at the pinned Mathlib."
**Claim:** The head has 51 sorry'd theorems, and elaboration gives 51 warnings. The 52nd `sorry` token is the word "sorry" in the module docstring.
**Witness:** `lake env lean` on `TauCetiRoadmap/PseudolineArrangementsAndOrientedMatroids/Suggested.lean` exits 0 with 51 "declaration uses `sorry`" warnings and nothing else. `grep -c sorry` gives 52, and one of them is docstring line 12.
**Repair:** "… with only `sorry` warnings (51), …".

## R02 (P3) — The description lists the Platonic maps among the stated headlines

**Location:** description: "The headlines stated include: … the Platonic maps, the hemi-icosahedron as the quotient of `H₃` by its centre with the icosahedron as its orientation double cover, and the toroidal maps `{3,6}`."
**Claim:** `Suggested.lean` states no theorem about the Platonic maps of 9.4. From 9.4 it has only the definitions `coxeterGMap` (line 855) and `icosahedronGMap` (line 862), and the second appears only in 9.5's double-cover theorem.
**Witness:** The docstring's list of stated headlines (lines 21–78) has entries for 9.5 and 9.6 but none for 9.4. Lines 98–99 classify 9.4's types and skeletons as API kept in the README.
**Repair:** "… the hemi-icosahedron as the quotient of `H₃` by its centre, with the icosahedral map `icosahedronGMap` (built by 9.4's `coxeterGMap`) as its orientation double cover, and the toroidal maps `{3,6}`; the orders and cell numbers of the five Platonic maps (9.4) stay in the README."

## Previous findings

- none: the report of 0661565 raised no finding.

## Verified sound

| Statement | Instances | Values on each side | Result | Change |
|---|---|---|---|---|
| 10.1–10.2 `geometricRepresentationFun_stringCoxeterMatrix_injective` (consumes RootSystems §1.3) | `n = 0`; `n = 1, p = 0`; `n = 1, p = 3` | `n = 0`: group `{1, s}`, `ρ(s) = −1` on ℝ, so injective. `p = 0`: `ρ(s₀s₁) = [[3,−2],[2,−1]]`, which is unipotent and not `1`, so it has infinite order. `p = 3`: 6 elements act on ℝ² | true; `hp : p i ≠ 1` is needed for a Coxeter matrix | none |
| Description, `sorry` count (R01) | the elaboration of the head | 52 `sorry` tokens, 51 warnings, 56 theorems, of which 5 are proved (`stringCoxeterMatrix_of_far`, `isLiftable_adj`, `monodromyGen_mul_self`, `commute_monodromyGen`, `torusInvolution_involutive`) | description wrong | R01 |
| Description, stated headlines (R02) | Layer 9 of `Suggested.lean` | 9.4: 2 definitions and 0 theorems; 9.5: 4 theorems; 9.6: 2 theorems | description wrong | R02 |
| Description, the orientation double cover | `isConnected_orientationDoubleCover_iff`, `natCard_cell_orientationDoubleCover` | `[Nonempty D]` and `∀ i d, G.adj i d ≠ d` match "nonempty, no fixed dart"; `[Finite D]` and `IsClosedSurface` give the factor `2` | description right | none |

The rows of the untouched statements stand as in the previous review, of `0661565`.

- **Gate.** On this head the worker's gate gives 0 on every counter, including `build=0`. My run of the brief's command also gives 0 on every counter except `depcheck=1`, "NOT IN ORDER: … (insert it after its last supplier)". That counter checks the gate's default order. The candidate order lists the roadmap at line 408, so this is not a defect.
- **Dependency check** against the candidate order: `depcheck: 206 roadmaps, 1897 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- **Elaboration and axioms.** `lake env lean` exits 0. `#print axioms` on all 66 non-theorem declarations (57 `def`, 3 `abbrev`, 6 `structure`) finds no `sorryAx`. The file and `lake-manifest.json` are unchanged since 0661565, so the signature comparison and the one-tactic probe stand.
- **Outside the folder.** `git diff --stat origin/main...HEAD` outside the folder is empty. The folder holds `README.md`, `Suggested.lean` and `metadata.toml`.
- **Citations on main b7bdbfd.**
  - RootSystems §1.3 is at README line 515, with the transport to `I → ℝ` at lines 538–539, and `geometric_faithfulness` is at Suggested.lean line 73. At the head of the open RootSystems revision (41120c6) they are at lines 587 and 610–611.
  - GraphConnectivityAndFlows Target 1.1 is at README line 224.
  - BelyiMaps, whose README was rewritten on main, still owns `BipartiteRibbonGraph` and `PermutationTriple` (README lines 1038 and 629; both exist at the Tau Ceti pin).
  - "No roadmap on main cites this one" still holds.
- **Description.** All 58 `### k.n` sections have a *Needs:* line and at least three Checks. The out-of-scope list matches README lines 72–79. The library names were found at the pins: `Graph` (`Mathlib/Combinatorics/Graph/Basic.lean:90`), `CircularOrder` (`Mathlib/Order/Circular.lean:151`) and `CoxeterSystem.geometricRepresentation` (`TauCeti/GroupTheory/Coxeter/Geometric.lean:479`).
- **Sources.** The seeded sample lies in untouched text. The cached text `ahos2013` agrees with the remark in 9.6: line 78 (finite connected simple graphs), line 298 (Theorem 3.1) and lines 305–307 (the hemicube from `K₄`).
- Overlap check: read SurfaceTopology (open), RootSystems (main and its open revision) and BelyiMaps (main).
  - SurfaceTopology also defines `GMap`, `GMap2` and `GMap.Cell` (its README lines 290–298). The owner is this roadmap: SurfaceTopology is outside the merge order and may not be cited as a supplier, so the citation is SurfaceTopology's to add.
  - `geometric_faithfulness` is owned by RootSystems §1.3, which this roadmap cites. The open revision's finite-Coxeter classification (§§3.3–3.5) states no group order and nothing of 9.4–9.5.
  - Ribbon graphs and dessins are owned by BelyiMaps, which this roadmap defers to.
  - Searching the index of 2026-11-11 for chirotopes, pseudolines, oriented matroids and signotopes finds no other owner.

## Not verifiable

- These are carried over unchanged and are untouched here: BLSWZ *Oriented Matroids*, Levi 1926, Ringel 1956, Roudneff–Sturmfels 1988, Björner–Edelman–Ziegler 1990, Goodman–Pollack 1984, the *Esquisse* and Coxeter–Moser (paywalled or not found). The Handbook chapters were read in the editors' preliminary versions.

## Source issues

- none
