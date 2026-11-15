# Review of TeichmullerGeometry (pull request #1169 at 417bd27)

**Verdict:** needs changes

Incremental re-review of 0 changed lines since `417bd27`. The folder's files are unchanged and stand as accepted there. The four findings are all in the pull request's description, which no longer describes this head; none asks for a change to `README.md` or `Suggested.lean`.

## R01 (P3) — Validation paragraph describes a different Lean file and different pins

**Location** Pull request description, "Validation": "The exact prototype compiles against TauCeti `a91d3aaf` / Mathlib `6b7abb3c` with one honest dimension-two integrability admission and no other diagnostics … Native/geometric group-convention adapters use ordinary axioms; the integrability target remains unproved."

**Claim** The head contradicts each clause: the pins, the count of admissions, the integrability declaration and the adapters with axioms.

**Witness** `lake-manifest.json`: TauCeti `2fd255d9`, Mathlib `1b1ccf4b`. `TauCetiRoadmap/TeichmullerGeometry/Suggested.lean` elaborates with 21 `sorry` warnings; no declaration on integrability (docstring lines 63–66 name it not statable); `grep '^axiom'` finds nothing.

**Repair** Replace the paragraph's first four sentences by: "Validation: `Suggested.lean` elaborates against the pinned Tau Ceti (`2fd255d9`) and Mathlib (`1b1ccf4b`) with `import Mathlib` and thirteen `TauCeti.*` modules; its 21 theorems carry `sorry` and there is no other diagnostic, no axiom and no `set_option`."

## R02 (P3) — The reported CI failure and its cause do not exist at this head

**Location** Pull request description, "Validation": "Main-only CI … failed at this head because the declared `ComplexKahlerGeometry.Suggested` dependency is absent from main; the failed log reports that bad import. This does not supersede the successful declared-public-provider compilation."

**Claim** At this head the file imports no roadmap module, and ComplexKahlerGeometry is on main.

**Witness** `TauCetiRoadmap/TeichmullerGeometry/Suggested.lean` lines 1–14: `import Mathlib` and thirteen `TauCeti.*` lines only. `TauCetiRoadmap/ComplexKahlerGeometry/` exists on main. The targeted build of `TauCetiRoadmap.TeichmullerGeometry.Suggested` passes (`build=0`).

**Repair** Delete the two sentences, together with "and a joint importer with both Fuchsian leaves passes", "Both the current-local and declared public-provider contexts were checked; the source remains identical" and "(95 roadmaps; …)", which describe the same earlier arrangement.

## R03 (P3) — Task list names merged suppliers as open and omits the open one

**Location** Pull request description: "- [ ] depends on: #903", "- [ ] depends on: #1168", "Companion proposal: #1168."

**Claim** GeometricTopology and FuchsianOrbifolds are on main; the only supplier still open is ArithmeticFuchsianGroups, which the list does not name.

**Witness** `TauCetiRoadmap/GeometricTopology/` and `TauCetiRoadmap/FuchsianOrbifolds/` exist on main. `README.md` line 100, "From TauCetiRoadmap.ArithmeticFuchsianGroups" (§§1.1, 1.4, 3.1), resolves only at the open head of #2026.

**Repair** Replace the two task lines by "- [ ] depends on: #2026", delete "Companion proposal: #1168.", and write the dependency sentence as: "Dependencies: ArithmeticFuchsianGroups (#2026, open) supplies §§1.1, 1.4 and 3.1; FuchsianOrbifolds and GeometricTopology, both on main, supply the Fuchsian quotient theory and the two-dimensional comparison of categories; none of them consumes anything from this roadmap."

## R04 (P3) — The description omits the owned surface topology of Layer 0 and what `Suggested.lean` states

**Location** Pull request description, "What this roadmap builds" and the paragraph "Develop the full marked Teichmüller theory …": neither names §§0.0a–0.0h.

**Claim** The roadmap owns a PL theory and the topological classification of compact surfaces; a reader of the description cannot learn it, nor that the Teichmüller-space headlines are not statable at the pins.

**Witness** `README.md` line 9 (scope) and headings §0.0a–§0.0h; `Suggested.lean` lines 23–37 list `classification_of_surfaces`, `riemannHurwitz`, `isotopic_of_homotopic_closedSurface`, `MappingClassGroupPL.toTop_bijective`; lines 63–66 name `Teich(Σ)` not statable.

**Repair** Add after the "Develop …" paragraph: "Layer 0 also owns the PL theory of compact surfaces (PL approximation, invariance of the boundary, Epstein's isotopy theorems), the topological classification of compact surfaces by polygon schemas, branched covers with the topological Riemann–Hurwitz formula, and the topological and PL mapping class groups, over GeometricTopology's Radó theorem and Hauptvermutung. `Suggested.lean` states 21 theorems: this layer, Dehn–Nielsen–Baer, the smooth Baer–Epstein theorem, the measurable Riemann mapping theorem and Nielsen realization. Teichmüller space and the theorems on it are named in its docstring as not statable at the pins."

## Previous findings

- none: the previous report, of `417bd27`, had no finding (its R01 of the round before was recorded there as repaired, and the passages it names, lines 427, 497 and 839, are unchanged).

## Verified sound

| # | Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|---|
| D1 | `riemannHurwitz` (§0.0g), cited by the description's "Riemann–Hurwitz theory" and "genus-two hyperelliptic exception" | genus-two hyperelliptic quotient; `z ↦ zⁿ` on `S²`; identity | genus 2: fibre sums `1+1 = 2`, `2 = 2`; `−2 = 2·2 − 6·(2−1)`; `zⁿ`: `2 = 2n − 2(n−1)`; identity: `χ = 1·χ − 0` | true | none |
| D2 | Description: dimension `3g − 3`; generic locus for `g ≥ 3`, hyperelliptic exception in genus two (§8.5, Layer 11) | `g = 2`, `g = 3` | hyperelliptic locus has dimension `2g − 1`: `3 = 3g − 3` for `g = 2` (all of `Teich`), `5 < 6` for `g = 3`; matches §8.5 `K_X = ⟨h⟩` resp. `1` | description true | none |
| D3 | Description: pins and diagnostics | manifest; elaboration | description `a91d3aaf`/`6b7abb3c`, 1 admission; head `2fd255d9`/`1b1ccf4b`, 21 `sorry` warnings, 0 axioms | false | R01 |
| D4 | Description: CI failure from a `ComplexKahlerGeometry.Suggested` import | import lines 1–14; main | 0 roadmap imports; ComplexKahlerGeometry folder present on main | false | R02 |

The rows for the folder's statements stand as in the previous review, of `417bd27`.

- Gate, run with the brief's command at `417bd27`: exit 0, every counter 0 (`set_option=0 … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`); the worker's run adds `build=0`.
- Dependency check: `depcheck: 244 roadmaps, 2229 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Elaboration: `lake env lean` on `TauCetiRoadmap/TeichmullerGeometry/Suggested.lean` exits 0; 21 "declaration uses `sorry`" warnings, nothing else. `signatures.md` reports 0 declarations with a lost binder; the file is byte-identical to the one the previous review probed.
- Folder: `README.md`, `Suggested.lean`, `metadata.toml`; diff outside the folder against `origin/main`: empty.
- Description sentences checked against the head and found to agree: the summary block's three paragraphs (Layers 2, 3, 5, 7, 8, 11; `README.md` lines 973–979 for the descent to moduli; lines 994–996 for the two consumers); the marked-cover adapter sentence (§§10.2–10.3, lines 921–933); the atlas sentence (§2.1, line 415); the title.
- Cross-roadmap citations resolved again: ArithmeticFuchsianGroups §§1.1, 1.4, 3.1 at its open head `a0992d0` (lines 386, 767, 1211); FuchsianOrbifolds Layers 0, 1, 2, 4, 4a on main (lines 296, 368, 405, 604, 816); GeometricTopology §§1.7.2, 11.2.1, 11.3 on main (lines 1212, 7817, 7887).
- Seeded sample: no sampled target lies in a changed passage (the folder did not change); the earlier checks stand.
- Overlap check: read FuchsianOrbifolds, GeometricTopology and ComplexCurveModuli on main and, at their open heads, ArithmeticFuchsianGroups, GroupActionsOnRiemannSurfaces, PlanarTopology and SurfaceTopology. Shared objects: Epstein's theorem, PL approximation and the classification of compact surfaces are also stated by the open PlanarTopology and SurfaceTopology, which this roadmap may not cite, so it states them itself under its own namespace (remark on untouched text; see the human reviewers' section). Everything else shared is cited from its owner (FuchsianOrbifolds, GeometricTopology, ComplexCurveModuli, ArithmeticFuchsianGroups); GroupActionsOnRiemannSurfaces consumes this roadmap.

Source independence: changed passages only; the folder changed by 0 lines since `417bd27`, so 0 passages were compared with 0 sources and the arrangement was not compared again (no layer added, removed or reordered); the earlier comparisons stand.

## Not verifiable

- The description's claims about earlier runs ("full mathematical and distinct repair/publication-interface reviews passed", the joint importer, the CI run it links): no record of them is in the repository at this head.
- The source locators listed as not verifiable in the previous review (Farb–Margalit, Imayoshi–Taniguchi, Hubbard, Douady–Earle, Ahlfors–Bers, Wolpert, Moise, Massey, Munkres; Hirsch uncertified; Kerckhoff waived) stay so; none is in a changed passage.

## Source issues

- none

## For the human reviewers

- **Scope.** The description says "The user selected the broad course-note scope" and does not name the course notes; `README.md` cites refereed articles and monographs only (References, lines 1003–1023).
- **Scope.** The open pull request #271 (PlanarTopology, SurfaceTopology) also states Epstein's theorem, PL approximation and the classification of compact surfaces, which `README.md` §§0.0a–0.0h own here; neither roadmap cites the other.
