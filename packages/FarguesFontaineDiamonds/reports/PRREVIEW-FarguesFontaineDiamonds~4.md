# Review of FarguesFontaineDiamonds (pull request #964 at 389338f)
**Verdict:** needs changes

## R01 (P3) — The summary incorrectly makes the divisor invariant on Y

**Location:** PR description, `roadmap-summary` block, “Each marked ℚ_p-untilt of S becomes a closed analytic Cartier divisor on Y and on X, unchanged by Frobenius shifts of the marking.”
**Claim:** Frobenius shifts preserve the embedded divisor on both spaces.
**Witness:** `TauCetiRoadmap/FarguesFontaineDiamonds/README.md:929` makes invariance a statement over X. At p=2, a divisor at radius 1 moves to radius 2 on Y; these are distinct, though their images under q coincide.
**Repair:** Replace the sentence with: “Each marked ℚ_p-untilt defines closed analytic Cartier divisors on Y and X. Shifting the marking translates the divisor on Y by Frobenius and leaves its descended divisor on X unchanged.”

## R02 (P3) — Describe the new folder and its empty acceptance-test file explicitly

**Location:** PR description, folder paragraph: “the Lean states only real-bodied definitions and theorems statable against the pinned Mathlib and Tau Ceti”.
**Claim:** The paragraph describes supplied Lean definitions and theorem statements, and leaves unstated whether this adds or revises a roadmap.
**Witness:** The base-to-head diff adds three files, 1,205 lines, and zero declarations. `TauCetiRoadmap/FarguesFontaineDiamonds/Suggested.lean:10` says no headline is statable; lines 35–37 contain an empty namespace.
**Repair:** Replace the paragraph with: “This adds the new FarguesFontaineDiamonds roadmap: README.md, Suggested.lean and metadata.toml, totalling 1,205 lines. Suggested.lean contains no declarations; its module docstring identifies the missing pinned carriers for F0–F5. The README specifies every mathematical target.”

## R03 (P3) — The summary cites a downstream layer that no longer exists

**Location:** PR description, `roadmap-summary` block: “VectorBundlesAndIsocrystals Layer VB−1 extends the fixed-field divisor and its all-affinoids closedness criterion to general bases”.
**Claim:** VB−1 is the downstream location of that extension.
**Witness:** At PR #1205, `TauCetiRoadmap/VectorBundlesAndIsocrystals/README.md:88` names Layer 0; line 148 places the marked-untilt Cartier extension there and imports F4. The head contains no VB−1 identifier.
**Repair:** Replace “VectorBundlesAndIsocrystals Layer VB−1” in the PR summary with “VectorBundlesAndIsocrystals Layer 0, ‘Marked untilt Cartier divisors and Cartier descent’”.

## R04 (P3) — The previous source-manifest finding remains unrepaired

**Location:** `TauCetiRoadmap/FarguesFontaineDiamonds/README.md:1118`, References; missing `TauCetiRoadmap/FarguesFontaineDiamonds/sources.toml`.
**Claim:** The four cited works require source-manifest records.
**Witness:** At this head the folder contains only README.md, Suggested.lean and metadata.toml; References names FS, SW, ECD and KL. Previous review R01 reported the same omission; the folder has changed by zero lines.
**Repair:** Add a `tauceti-roadmap-sources/v1` manifest with one record each for FS, SW, ECD and KL, preserving the editions and locators in References and recording the legal-copy provenance, hash and licence class through the sources service.

## Previous findings

- R01 — not repaired: `TauCetiRoadmap/FarguesFontaineDiamonds/README.md:1127`–1147 still cites FS, SW, ECD and KL; the folder still has no sources.toml. Carried here as R04.

## Verified sound

| Statement or claim | Instance | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Summary: divisor invariant on Y; README:929 | Kummer untilt with t♯=p; positive Frobenius | p=2: κ=1 versus 2; p=3: κ=1 versus 3 | Distinct supports on Y | R01: restrict invariance to X |
| README:929: descended divisor invariant | Same untilt and its Frobenius translate | q(y)=q(φy); orbit labels [0]=[1] in ℤ/ℤ | Same support and descended ideal on X | None |
| Description: delivered Lean content/newness | Base-to-head file and declaration counts | Added files=3; added lines=1,205; definitions=0; theorems=0 | Empty acceptance-test namespace | R02 |
| Description: downstream layer identifier | VectorBundlesAndIsocrystals #1205 | VB−1 occurrences=0; replacement layer=0, Cartier target at line 148 | Old locator absent | R03 |
| Previous R01: source records | Folder inventory and References | Cited works=4; manifest files=0 | Omission persists | R04 |

Untouched mathematical rows stand as in the previous review of 389338f.

- Incremental scope: 0 changed folder lines; 0 files outside the folder; title and description checked against all 3 added files and the head.
- Seeded sample: 0 of the 10 “API” blocks changed; 0 new source locators checked; 0 library declarations reopened.
- Citation checks for the description: AdicSpacesPartII R0.3/R0.5/R0.8 resolved on main; VectorBundlesAndIsocrystals Layer 0 resolved at #1205.
- Gate: every scanner and dependency check passed; supplied worker gate also reports `build=0 OK`.
- Lean: absolute-path `lake env lean` and targeted `lake build TauCetiRoadmap.FarguesFontaineDiamonds.Suggested` both exited 0; no warnings; 0 declarations require binder or one-tactic probes.
- Dependency-check output: `depcheck: 245 roadmaps, 2213 edges, 0 problem(s)`; no UPWARD or CYCLE lines.
- Worktree: clean before and after review.

Overlap check: read RelativeFarguesFontaine, AdicCoefficientsAndComparisons, VectorBundlesAndIsocrystals, DiamondEtaleCohomology, AInfCohomology, PerfectoidSpaces, DiamondsAndVStacks and AdicSpaces. Owners: fixed-field Cartier comparison—FarguesFontaineDiamonds; general-coefficient curve/divisor extension—VectorBundlesAndIsocrystals; relative refinements—RelativeFarguesFontaine; adic coefficients—AdicCoefficientsAndComparisons; discrete diamond coefficients—DiamondEtaleCohomology; tilts and primitive kernels—PerfectoidSpaces; diamondification/sites—DiamondsAndVStacks; fixed adic curve—AdicSpaces. AInfCohomology's BKF/cohomology targets add no shared ownership in the reviewed passages.

Source independence: changed passages only; 0 changed roadmap passages compared with 0 sources. No layers were added, removed or reordered, so source-locator shares and the arrangement comparison were not repeated; no new source reuse was introduced.

## Not verifiable

- Source wording and locators were not newly checked in this zero-line re-review; the prior source checks remain the evidence for untouched mathematics.

## Source issues

- none

## For the human reviewers

- none
