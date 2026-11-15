# Review of FukayaTheory (pull request #1045 at 31de88a)

**Verdict:** accepted

Incremental re-review of 0 changed lines since 31de88a. The folder is unchanged; this round read the pull request's title and description, rewritten since the previous review, against the head. No finding.

## Previous findings

- R01 — repaired: the description now reads "The suppliers are MorseNovikov N1, DGAInfinity Layers 1–6, … all on main, and ImplicitAtlases, still open … nothing of DGFloer is consumed"; HamiltonianSystems is no longer named.
- R02 — repaired: "This pull request adds the roadmap folder `TauCetiRoadmap/FukayaTheory/`, which is not on main"; "The file elaborates … with only the two `sorry` warnings"; "nothing of it is proved in Lean". No toolchain or overlay claim remains.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| Description, supplier sentence, against `TauCetiRoadmap/FukayaTheory/README.md` lines 23–30 and 60–90 | every roadmap name occurring in the README, matched against main and the open heads | 13 supplier names in the README, the same 13 in the description; 12 folders on main (1a19c9f), ImplicitAtlases open only; DGFloer, HamiltonianFloerOperations, GromovWittenTheory, AnalyticStableMaps, SymplecticFieldTheory appear as non-suppliers only | agrees | none |
| Description: "ImplicitAtlases … §§0.2–0.4 adapters serve FK5 … engine is consumed only by the implicit-atlas comparison target of FK9.2" | README lines 80, 678, 700, 969 | line 80: §0.2–§0.4 "are the shared adapters of FK5"; Layers 1–5 "consumed only by the comparison target of FK9.2 … no FK5 construction depends on them" | agrees | none |
| Description, third paragraph, and README FK8.1 (line 866): "four generators and differential d b=T^A(a−c), with A=1/(4π)−1/16" | `β(t)=(t,2t+½sin 2πt)` at `t=0,¼,½,¾` | values `0,1,1,1`, all integers: four points; `[t²−t−cos(2πt)/(4π)]` from ¼ to ½ `= (−¼+1/(4π))−(−3/16) = 0.0170775`; `Λ₀³/(T^A(a−c))≅Λ₀²⊕Λ₀/(T^A)` by the basis `(z,a−c,c)` | agrees | none |
| Description, fourth paragraph, against `TauCetiRoadmap/FukayaTheory/Suggested.lean` | declarations and module docstring | 2 definitions (`IsWeaklyExact`, `hamiltonianTimeOne`), 2 theorems; docstring lists FK7, FK9.2, FK8.0, FK8.1 and FK9.0 over a general field as not stated; elaboration output: `sorry` warnings at lines 118 and 151 only | agrees | none |
| Summary block: "Floer's bound … for exact and weakly exact branes", against `liouvilleExact_intersection_bound` and `weaklyExact_intersection_bound` | zero section of `T*S¹`, `H=εβ(\|p\|)cos q`; circle `(1,0)` in `ℝ²/ℤ²`; small circle in `S²` | `T*S¹`: 2 intersections, `1+1=2`, `2≥2`; torus circle: `π₂(T²,L)=0`, at least 2 points, `2≥2`; small circle: displaceable, count 0<2, but the cap disc has positive area, so `IsWeaklyExact` fails | agrees; the control is excluded by the hypothesis | none |
| Summary block: "Rational virtual chains over a characteristic-zero field treat closed targets in general, while integral signed counts treat weakly exact, exact Liouville and monotone branes" | README line 7 | "general virtual branch treats closed targets … over a characteristic-zero ground field"; "Integral orientation-line counts belong to the classical branches" (weakly exact, exact Liouville, monotone) | agrees | none |
| Summary block: ownership of `m₂` and the polygon operations; "its strip complex is matched with HeegaardFloer's exact strip theory" | main at 1a19c9f | DGFloer README line 68 leaves general Lagrangian/polygon operations to a separate Fukaya-category construction; HamiltonianFloerOperations README line 22 names FukayaTheory as owner of the Lagrangian `m₂`; HeegaardFloer README line 3546 states the arity-one overlap with FK4.2 | agrees | none |

The rows of the previous reviews for the statements of the folder stand as in the previous review, of 31de88a: no statement changed.

- Folder change since the previous review: 0 lines; `git diff --stat origin/main...HEAD` outside the folder is empty.
- Gate, rerun with `--base origin/main`: every counter 0, result OK; the worker's gate at this head has `build=0`.
- Dependency check: `depcheck: 244 roadmaps, 2229 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. ImplicitAtlases is line 220 of the merge order, CalibratedGeometry 229, FukayaTheory 230.
- Elaboration: `lake env lean` on `TauCetiRoadmap/FukayaTheory/Suggested.lean`: the only output is `declaration uses sorry` at lines 118 and 151.
- Title and description read sentence by sentence against README lines 3, 7, 13–34, 58–90, 856–886, 963–969 and 995–1001 and against the module docstring of `Suggested.lean`: no sentence contradicted; added roadmap, not on main, stated; suppliers and the one open supplier stated; no section, headline or declaration is removed by this pull request. The generated "Depends on" and "Merge order" blocks are outside this check.
- Cross-roadmap facts resolved for the description: 12 supplier folders, DGFloer and HamiltonianFloerOperations on main; ImplicitAtlases at its open head.
- Overlap check: read HeegaardFloer, DGFloer, HamiltonianFloerOperations (main); nothing shared: HeegaardFloer line 3546 and DGFloer line 68 leave the polygon and categorical theory here, HamiltonianFloerOperations keeps the closed quantum product. No open pull request changes this roadmap and no cited id is dropped (`overlaps.md`).
- Source independence: changed passages only; 0 passages compared with 0 sources, since the folder did not change; arrangement not compared again (no layer added, removed or reordered).

## Not verifiable

- "AI assistance: Codex (GPT-6) wrote the specification; Claude revised it" (description): nothing in the head records authorship.
- Floer 1988 Theorem 1 and McDuff–Salamon Proposition 2.5.1, §3.2: uncertified, cited by locator, as in the previous reviews; no locator changed.

## Source issues

- none

## For the human reviewers

- none
