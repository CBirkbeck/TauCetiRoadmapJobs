# Review of AutomorphicFormsOnReductiveGroups (pull request #1037 at 4a03177)

**Verdict:** needs changes

## R01 (P3) — The targeted build reports another warning

**Location:** Pull request description, validation paragraph: “the targeted Lake build succeeds with `sorry` as the only warning”.
**Claim:** The targeted build succeeds, but its output also includes a module-system warning.
**Witness:** `lake build TauCetiRoadmap.AutomorphicFormsOnReductiveGroups.Suggested` exits 0 and replays both `declaration uses sorry` and a warning that this file imports `Mathlib`, which is designed for the module system.
**Repair:** Replace the quoted clause with: “the targeted Lake build succeeds; direct Lean elaboration reports only the expected `sorry` warning”. Both commands were run at this head.

## Previous findings

- R01 — repaired: The `roadmap-summary` block now names “BorelRegulators and Polylogarithms”, matching `TauCetiRoadmap/AutomorphicFormsOnReductiveGroups/README.md:1317`.
- R02 — repaired: The `roadmap-summary` block now specifies “density of compact-finite vectors in the smooth topology of Banach representations” for compact Lie groups, matching README §2.7, line 489.

## Verified sound

| Statement | Instances tried | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| `compactFinite_dense_locallyConvex`, README §2.1 | `C₂` acting by sign on `ℂ`; zero space | Orbit dimensions: nonzero `1`, zero `0`; closure of finite-orbit-span vectors: `ℂ=ℂ`, respectively `{0}={0}` | Consistent with repaired summary | None |
| Compact-finite density in the smooth topology, §2.7 | Circle rotations; `f(θ)=Σ_{n≥1}2⁻ⁿe^{inθ}`; truncations `p_N` | Orbit dimension `N`; `P₁(f−p_N)=(N+3)2⁻ᴺ`: `2, 5/4, 11/256` at `N=1,2,8`; limit `0` | Each derivative tail is bounded by `Σ_{n>N}nᵏ2⁻ⁿ→0`; smooth convergence | Previous R02 repaired |
| Validation paragraph (this report's R01) | Targeted Lake build; direct Lean elaboration | Exit codes `0,0`; warning kinds `2,1`; description claims targeted-build count `1` | Description contradicts build output | Correct validation clause |

The rows for untouched statements stand as in the previous review, of 4a03177.

- Previous findings checked: 2 repaired; folder diff: 0 lines; changes outside the folder: 0; worktree clean.
- PR title, summary block and prose checked against the base and head: 3 new files, 1417 insertions, 0 deletions, 0 removed declarations; one validation discrepancy above.
- Gate rerun: every scanner count 0, `OK`; worker gate also reports `build=0`; targeted build exits 0 with the two warning kinds recorded above.
- Dependency output: `depcheck: 245 roadmaps, 2220 edges, 0 problem(s)`; no UPWARD or CYCLE.
- Direct Lean elaboration and scratch `#check @compactFinite_dense_locallyConvex`: both exit 0, only `sorry`; 1 signature compared with README §2.1, 0 lost hypotheses or changed binders.
- Pinned declarations opened: `ContRepresentation` (`Mathlib/RepresentationTheory/Continuous/Basic.lean:55`), `HeckeRing` (`Mathlib/NumberTheory/HeckeRing/Defs.lean:189`), `continuousCohomology` (`Mathlib/RepresentationTheory/Homological/ContCohomology/Basic.lean:131`); the headline explicitly adds joint continuity absent from `ContRepresentation`.
- Supplier ownership rechecked for the description: LieHighestWeight §9.2 on main (`TauCetiRoadmap/RepresentationTheory/LieHighestWeight/README.md:2819`), including reductive enveloping centres and Harish-Chandra isomorphisms; 0 unresolved cross-roadmap citations in the worker's resolver.
- Seeded sample: 0 targets in changed folder passages; 0 source locators reopened. No layer, statement or supplier changed in this incremental diff.

Overlap check: the previous scope reads of AutomorphicSpectralTheory, AutomorphicLFunctionsAndLocalFactors, AutomorphicSpectralTheoryPartII, SmoothRepresentationsOfLocalGroups, LieHighestWeight and AdelicAlgebraicGroups stand; finite-place representations belong to SmoothRepresentationsOfLocalGroups, reductive centres to LieHighestWeight, adelic foundations to AdelicAlgebraicGroups, spectral theory and L-functions to their named consumers. The worker reports 0 conflicting heads or dropped cited ids; no changed ownership to audit.

Source independence: changed passages only; 0 folder passages changed, 0 compared with 0 sources; source shares unchanged; arrangement not compared again because no layer was added, removed or reordered.

## Not verifiable

- Unchanged source-access limitations from the previous report: Borel–Jacquet, Flath and Langlands (Corvallis I); Knapp, *Lie Groups Beyond an Introduction*; Vogan 1984; Lapid; Kostant 1961. No source was newly required by this diff.

## Source issues

- none

## For the human reviewers

- none
