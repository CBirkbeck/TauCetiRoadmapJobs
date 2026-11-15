# Review of TeichmullerGeometry (pull request #1169 at 417bd27)

**Verdict:** accepted

Incremental re-review of 0 changed lines since `417bd27`; this round read the pull request's title and description, rewritten since the previous review, against the head. No finding.

## Previous findings

- R01 — repaired: "Validation: `Suggested.lean` elaborates against the pinned Tau Ceti (`2fd255d9`) and Mathlib (`1b1ccf4b`), importing `Mathlib` and thirteen `TauCeti.*` modules; its 21 theorems are stated with `sorry`, and it has no axiom and no `set_option`."
- R02 — repaired: the sentences on a failed main-only CI run, the `ComplexKahlerGeometry.Suggested` import, the joint importer and the two compilation contexts are gone from the description.
- R03 — repaired: "- [ ] depends on: #2026"; "ArithmeticFuchsianGroups (#2026, open) supplies §§1.1, 1.4 and 3.1 and is the only supplier not yet on main"; "Companion proposal" is gone.
- R04 — repaired: "Layer 0 also owns the topology of compact surfaces … `Suggested.lean` states 21 theorems … Teichmüller space and the theorems about it … are named in its docstring as not statable at the pins."

## Verified sound

| # | Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|---|
| D1 | Description: "`Suggested.lean` states 21 theorems: the fourteen of Layer 0, …" | count of `theorem` by layer section; elaboration | Layer 0: 14 (lines 91–522); Layer 5: 2 (sphere, torus) + 2 (Dehn–Nielsen–Baer, realization half) + 1 (Baer–Epstein); Layer 7: 1; Layer 8: 1; `14+2+2+1+1+1 = 21`; 21 `sorry` warnings | true | none |
| D2 | Description: pins, imports, no axiom, no `set_option` | `lake-manifest.json`; lines 1–14; grep | TauCeti `2fd255d9`, Mathlib `1b1ccf4b`; 1 `import Mathlib` + 13 `TauCeti.*`; `^axiom` 0 hits, `set_option` 0 hits | true | none |
| D3 | Description: ArithmeticFuchsianGroups is the only supplier not on main | the 11 `### From TauCetiRoadmap.*` headings against main `1a19c9f` | 10 folders present on main; ArithmeticFuchsianGroups absent on main, present at open head `a0992d0` with §1.1 (line 386), §1.4 (767), §3.1 (1211) | true | none |
| D4 | `nielsen_realization`, "in its lifting form" (description; `Suggested.lean` line 700) | `F = 1`; torus, `F = ⟨−I⟩ ≤ GL₂(ℤ)`; sphere, `F = Mod±(S²)` | `F = 1`: `H = 1`, 1 ↦ 1; torus: `H = {±id}` linear, 2 elements onto 2 classes; sphere: `H = {1, reflection}` onto `ℤ/2` | true | none |
| D5 | Description: FuchsianOrbifolds supplies "the orbifold area formula" (README line 98, Layer 4 item 5, Layer 4a) | signature `(0; 2, 3, 7)`; genus 2 surface group | `2π(−2 + 1/2 + 2/3 + 6/7) = 2π/42 = π/21`, the Layer 4a minimum; `(2; )`: `2π·2 = 4π = −2πχ` | true | none |
| D6 | Summary block: "For g ≥ 3 … common open dense locus"; "genus-two hyperelliptic exception explicit" (§8.5, §11.1) | `g = 2`, `g = 3` | hyperelliptic locus dimension `2g − 1`: `3 = 3g − 3` at `g = 2` (locus of §8.5 empty, §11.1 second Check); `5 < 6` at `g = 3` | true | none |

The rows for the folder's statements stand as in the previous review, of `417bd27`.

- Gate, run with the brief's command at `417bd27`: exit 0, every counter 0, `OK`; the worker's run adds `build=0`.
- Dependency check: `depcheck: 244 roadmaps, 2229 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. The merge order lists ArithmeticFuchsianGroups (line 291) directly before TeichmullerGeometry (line 292).
- Elaboration: `lake env lean` on `TauCetiRoadmap/TeichmullerGeometry/Suggested.lean` gives 21 "declaration uses `sorry`" warnings and nothing else; the file is unchanged since the binder check of the previous reviews (`signatures.md`: 0 lost binders).
- Folder: `README.md`, `Suggested.lean`, `metadata.toml`; diff outside the folder against `origin/main`: empty.
- Description read against the head, sentence by sentence, and found to agree: the title; the summary block (Layers 2, 3, 5, 7, 8, 10, 11; Downstream consumers, `README.md` lines 993–995); "adds the roadmap" (the folder is not on main; 1735 insertions, 0 deletions); the Layer 0 paragraph (§§0.0a–0.0h; module docstring lines 22–82); the marked-cover and atlas sentences (§2.1, §§10.2–10.3); the supplier list (all eleven `### From TauCetiRoadmap.*` headings, lines 68–108, each named); "None of them consumes anything from this roadmap" (`README.md` line 41; FuchsianOrbifolds, GeometricTopology and ArithmeticFuchsianGroups name TeichmullerGeometry only as a consumer).
- Cross-roadmap citations resolved again: ArithmeticFuchsianGroups §§1.1, 1.4, 3.1 at `a0992d0`; FuchsianOrbifolds Layers 0, 1, 2, 4, 4a on main (lines 296, 368, 405, 604, 816); GeometricTopology §§1.7.2, 3.4, 11.2.1, 11.3 on main (lines 1212, 1551, 7817, 7887). `citations.md` lists 15 Lean names found nowhere in the pins: all are this roadmap's own declarations in `Suggested.lean` (gate `readme-ids-missing=0`).
- Seeded sample: no sampled target lies in a changed passage (the folder did not change); the earlier checks stand.
- Overlap check: read FuchsianOrbifolds, GeometricTopology and ComplexCurveModuli on main and, at their open heads, ArithmeticFuchsianGroups, GroupActionsOnRiemannSurfaces, PlanarTopology and SurfaceTopology (`overlaps.md`: no other pull request changes this roadmap, no dropped id, no id only an open revision defines). Shared objects: Epstein's theorem, PL approximation and the classification of compact surfaces are also stated by the open PlanarTopology and SurfaceTopology, which this roadmap may not cite, so it states them itself under its own namespace (remark on untouched text; see the human reviewers' section). Everything else shared is cited from its owner (FuchsianOrbifolds, GeometricTopology, ComplexCurveModuli, ArithmeticFuchsianGroups); GroupActionsOnRiemannSurfaces consumes this roadmap.

Source independence: changed passages only; the folder changed by 0 lines since `417bd27`, so 0 passages were compared with 0 sources and the arrangement was not compared again (no layer added, removed or reordered); the earlier comparisons stand.

## Not verifiable

- The description's "AI assistance" paragraph (which tools and agents were used, what was read before publication): nothing in the repository records it.
- The source locators listed as not verifiable in the earlier reviews (Farb–Margalit, Imayoshi–Taniguchi, Hubbard, Douady–Earle, Ahlfors–Bers, Wolpert, Moise, Massey, Munkres; Hirsch uncertified; Kerckhoff waived) stay so; none is in a changed passage.

## Source issues

- none

## For the human reviewers

- **Scope.** The description says "The user selected the broad course-note scope" and does not name the course notes; `README.md` cites refereed articles and monographs only (References, lines 1003–1023).
- **Scope.** The open pull request #271 (PlanarTopology, SurfaceTopology) also states Epstein's theorem, PL approximation and the classification of compact surfaces, which `README.md` §§0.0a–0.0h own here; neither roadmap cites the other.
