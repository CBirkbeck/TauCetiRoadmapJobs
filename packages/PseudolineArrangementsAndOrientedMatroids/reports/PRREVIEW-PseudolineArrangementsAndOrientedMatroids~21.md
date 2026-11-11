# Review of PseudolineArrangementsAndOrientedMatroids (pull request #1523 at d37350b)

**Verdict:** accepted

This is an incremental re-review of 0 changed lines since 8b1e5c0. The head merges main, which brings only progress reports of other roadmaps. The roadmap folder and `lake-manifest.json` are byte-identical to 8b1e5c0. The description now carries both repairs.

## Previous findings

- R01 — repaired: "`Suggested.lean` elaborates under `lake env lean` with only `sorry` warnings (51), and the Mathlib names it adds were checked at the pinned Mathlib."
- R02 — repaired: "the hemi-icosahedron as the quotient of `H₃` by its centre, with the icosahedral map `icosahedronGMap` (built by 9.4's `coxeterGMap`) as its orientation double cover, and the toroidal maps `{3,6}`; the orders and cell numbers of the five Platonic maps (9.4) stay in the README."

## Verified sound

| Statement | Instances | Values on each side | Result | Change |
|---|---|---|---|---|
| Description, `sorry` count (R01) | elaboration of this head | 51 warnings of "declaration uses `sorry`", no other diagnostic, exit 0; 56 theorems; 52 `sorry` tokens, one of them in docstring line 12 | description right | none |
| 9.5 `nonempty_iso_orientationDoubleCover_hemiIcosahedronGMap`, cited by the repaired R02 sentence | `H₃`, order 120; centre `{1, (s₀s₁s₂)⁵}`, since the Coxeter number is 10 | hemi-icosahedron: 60 flags, `(6, 15, 10)`, χ = 1, non-orientable. Its double cover: 120 flags, `(12, 30, 20)`, χ = 2, which equals `icosahedronGMap` on `H₃` | true; consistent with 0.4's connectedness criterion and with the cell doubling | none |
| 9.4 `coxeterGMap`, cited by the repaired R02 sentence | types `{3,3}`, `{3,4}`, `{3,5}` | vertex stabilizer of order `2q`: `24/6 = 4`, `48/8 = 6`, `120/10 = 12` vertices, matching README lines 1574–1575; `Suggested.lean` states no 9.4 theorem | description right | none |

The rows for the untouched statements stand as in the previous review, of 8b1e5c0.

- **Gate.** The worker's gate on d37350b gives 0 on every counter, including `build=0`.
  - My run of the brief's command matches, except for `depcheck=1`, "NOT IN ORDER: PseudolineArrangementsAndOrientedMatroids (insert it after its last supplier)". That counter uses the gate's default order. The candidate order lists the roadmap at line 408, so this is not a defect.
- **Dependency check** against the candidate order: `depcheck: 206 roadmaps, 1897 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- **Elaboration.** `lake env lean` on `TauCetiRoadmap/PseudolineArrangementsAndOrientedMatroids/Suggested.lean` exits 0 with 51 `sorry` warnings and nothing else. The file and the pins are unchanged, so the signature comparison, the axiom check and the one-tactic probe of 8b1e5c0 still hold.
- **Outside the folder.** `git diff --stat origin/main...HEAD` outside the folder is empty. The folder holds `README.md`, `Suggested.lean` and `metadata.toml`.
- **Citations on main 2c2bcf5.**
  - RootSystems §1.3 is at `RepresentationTheory/RootSystems/README.md` line 515, and `geometric_faithfulness` is at its `Suggested.lean` line 73.
  - GraphConnectivityAndFlows Target 1.1 is at README line 224. The merge changed only that roadmap's PROGRESS.md and STATUS.md.
  - BelyiMaps exports `PermutationTriple` and `BipartiteRibbonGraph` (README lines 276–279).
  - The overlap tool lists no id of this README that an open pull request drops.
- **Description, rest.** It was re-read against this head. The supplier list, the out-of-scope list and the claim that the gate gives 0 on every check all still hold.
- **Sources.** No seeded target lies in changed text, because nothing in the folder changed. No locator was rechecked this round.
- Overlap check: read SurfaceTopology (open), RootSystems (main) and BelyiMaps (main).
  - SurfaceTopology still sketches `GMap`, `GMap2` and `GMap.Cell` (its README lines 289–297). This roadmap is the owner: SurfaceTopology may not be cited as a supplier and is outside the merge order.
  - `geometric_faithfulness` is owned by RootSystems §1.3, which this roadmap cites.
  - Ribbon graphs and dessins are owned by BelyiMaps.
  - In the open heads and on main, "chirotope", "pseudoline", "signotope", "oriented matroid" and "allowable sequence" occur only in this roadmap.

## Not verifiable

- These are carried over unchanged and lie in untouched text: BLSWZ *Oriented Matroids*, Levi 1926, Ringel 1956, Roudneff–Sturmfels 1988, Björner–Edelman–Ziegler 1990, Goodman–Pollack 1984, the *Esquisse* and Coxeter–Moser (paywalled or not found).

## Source issues

- none
