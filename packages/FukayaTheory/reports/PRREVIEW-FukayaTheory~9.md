# Review of FukayaTheory (pull request #1045 at 31de88a)

**Verdict:** needs changes

Incremental re-review of 0 changed lines since 31de88a: the folder is as the previous review accepted it. This round reads the pull request's title and description against the head; two passages of the description are contradicted by it. Nothing in the folder needs to change.

## R01 (P3) — The description's supplier sentence names suppliers the head does not have

**Location** pull request description, second paragraph: "Public supplier proposals include Morse–Novikov N1 (#890), HeegaardFloer foundations (#957), HamiltonianSystems (#480) and the isolated DGFloer Liouville/cotangent construction (#900) … Their being open proposals is not a merge-first requirement."

**Claim** The head consumes neither HamiltonianSystems nor DGFloer, and MorseNovikov and HeegaardFloer are no longer open proposals.

**Witness** `grep -c HamiltonianSystems TauCetiRoadmap/FukayaTheory/README.md` is 0; README line 31: "nothing of DGFloer is consumed"; `TauCetiRoadmap/MorseNovikov/` and `TauCetiRoadmap/HeegaardFloer/` are on main (2248bbb). The only open supplier is ImplicitAtlases.

**Repair** Replace the two sentences by: "The suppliers are MorseNovikov N1, DGAInfinity Layers 1–6, StablePeriodicCurved Layer 5, HeegaardFloer (Lane M, F0–F3), PseudoholomorphicCurveAnalysis, SpinGeometry, SmoothBundlesConnections, AlgebraicTopology, DifferentialGeometry, SymplecticGeometry/CotangentLagrangian, CalibratedGeometry and GeometricTopology, all on main, and ImplicitAtlases §§0.2–0.4, still open; each use is limited to the sections named in the README's supplier contracts. Symplectomorphisms, Hamiltonian flows and the Liouville and cotangent structures are taken from the pinned Tau Ceti; nothing of HamiltonianSystems or DGFloer is consumed."

## R02 (P3) — The description's validation paragraph describes a `Suggested.lean` and a pull request that are not this head's

**Location** pull request description, fourth paragraph: "The exact updated Suggested source compiled against Lean 4.35.0-rc3 with empty output and no new admissions, using the previously consumed FK native overlay … Its finite-matrix proofs do not establish the geometric lune/orientation/continuation targets."

**Claim** The head's `Suggested.lean` has no finite-matrix proof, does not elaborate with empty output, uses no overlay, and the toolchain differs; "the full existing specification" and "the new surface subsection" present as a revision what is an added roadmap.

**Witness** `lean-toolchain`: `leanprover/lean4:v4.36.0-rc2`. `TauCetiRoadmap/FukayaTheory/Suggested.lean` declares two definitions and two theorems; `lake env lean` prints `declaration uses sorry` at lines 118 and 151. The folder is absent from main: 1185 insertions, 0 deletions.

**Repair** Replace the paragraph's sentences from "Validation:" to "…lune/orientation/continuation targets." by: "This pull request adds the roadmap folder `TauCetiRoadmap/FukayaTheory/` (it is not on main). `Suggested.lean` states the two branches of the intersection bound over `𝔽₂`, `weaklyExact_intersection_bound` and `liouvilleExact_intersection_bound`, each with `sorry`, with the definitions `IsWeaklyExact` and `hamiltonianTimeOne`; its module docstring names the headline theorems not statable at the pins (FK7, FK9.2, FK8.0, FK8.1). It elaborates against the pinned Mathlib and Tau Ceti (Lean 4.36.0-rc2) with the two `sorry` warnings only. The surface computation of FK8.1 is a README target; nothing of it is proved in Lean."

## Previous findings

- none: the previous review of 31de88a accepted with no finding. Its remark that the description "still calls HamiltonianSystems (#480) a 'public supplier proposal'" is R01 of this report.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| Description, third paragraph, and README FK8.1 (line 866): "four generators and differential d b=T^A(a−c), with A=1/(4π)−1/16" | `α(t)=(t,0)`, `β(t)=(t,2t+½sin 2πt)` on `ℝ²/ℤ²`; `t=0,¼,½,¾` | `2t+½sin 2πt=0,1,1,1`, all in `ℤ`: four points; slopes `2+π cos 2πt=5.14,2,−1.14,2`, none 0; `∫_(1/4)^(1/2)(2t−1+½sin 2πt)dt=0.0170775=1/(4π)−1/16`; cokernel of `b↦T^A(a−c)` on `Λ₀³` is `Λ₀²⊕Λ₀/(T^A)` | description and README agree | none |
| Summary block: "Floer's bound … for exact and weakly exact branes", against `liouvilleExact_intersection_bound` and README line 3 | zero section of `T*S¹`, `H=εβ(\|p\|)cos q` | intersections at `q=0,π`, count 2; `dim H⁰+dim H¹=1+1=2`; `2≥2` | agrees with the head | none |
| Summary block: "Hamiltonian invariance of the localized fixed-potential categories and their derived categories" | README lines 3 and 963 | line 963 defines the split-closed derived categories over `Λ_loc` and states that the FK9.2 quasi-equivalences induce equivalences of them | agrees | none |
| Summary block: "`AInfinityAlgebra`, which forces zero curvature" | README line 58 | "A native `AInfinityAlgebra` forces `m 0=0`" | agrees | none |
| Summary block: ownership of `m₂` and polygon operations against DGFloer and HamiltonianFloerOperations | main at 2248bbb | DGFloer README line 68 leaves general Lagrangian/polygon operations to a separate Fukaya-category construction; HamiltonianFloerOperations README line 22 names FukayaTheory as owner of the Lagrangian `m₂` | agrees | none |

The rows of the previous review for the statements of the folder stand as in the previous review, of 31de88a: no statement changed.

- Folder change since the previous review: 0 lines (`git diff` empty); nothing changed outside the folder (`git diff --stat origin/main...HEAD` outside it is empty).
- Gate, rerun with `--base origin/main`: every counter 0, result OK; the worker's gate at this head has `build=0`.
- Dependency check: `depcheck: 244 roadmaps, 2229 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Elaboration: `lake env lean` on `TauCetiRoadmap/FukayaTheory/Suggested.lean` (5 s): the only output is `declaration uses sorry` at lines 118 and 151.
- Description checked sentence by sentence against the head: title, the summary block and paragraphs one and three agree with README lines 3, 13–34, 58, 856–886, 963 and 1000–1001; paragraphs two and four give R01 and R02. The generated "Depends on" and "Merge order" blocks are outside this check; they name ImplicitAtlases and CalibratedGeometry, as the README does.
- Cross-roadmap facts resolved for the description: MorseNovikov (N1 present), HeegaardFloer, DGFloer, HamiltonianFloerOperations, CalibratedGeometry on main; ImplicitAtlases open and earlier in the merge order (line 220, FukayaTheory line 230).
- Overlap check: read HeegaardFloer, DGFloer, HamiltonianFloerOperations (main); nothing shared: HeegaardFloer line 3549 and DGFloer line 68 leave the polygon and categorical theory here, HamiltonianFloerOperations keeps the closed quantum product. No open pull request changes this roadmap and no cited id is dropped (`overlaps.md`).
- Source independence: changed passages only; 0 passages compared with 0 sources, since the folder did not change; arrangement not compared again (no layer added, removed or reordered).

## Not verifiable

- "Submitted-head CI passed" (description, fourth paragraph): the linked run was not opened, so the head it ran on is not confirmed; the worker's gate at 31de88a builds the module.
- "The new surface subsection received a separate independent mathematical review …" and the other statements of earlier reviews in the fourth paragraph: nothing in the head records them.
- Floer 1988 Theorem 1 and McDuff–Salamon Proposition 2.5.1, §3.2: uncertified, cited by locator, as in the previous review; no locator changed.

## Source issues

- none

## For the human reviewers

- none
