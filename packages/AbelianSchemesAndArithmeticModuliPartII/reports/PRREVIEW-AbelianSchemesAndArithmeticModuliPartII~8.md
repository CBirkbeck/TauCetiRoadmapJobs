# Review of AbelianSchemesAndArithmeticModuliPartII (pull request #1405 at fc1683b)

**Verdict:** needs changes

Incremental re-review: the folder is unchanged since the review of `fc1683b` (0 lines); this round reads the title and description against the head and reruns the gate.

## R01 (P3) — README names a roadmap on the project's dropped-names list

**Location:** `TauCetiRoadmap/AbelianSchemesAndArithmeticModuliPartII/README.md:52–53`: “its planar specialization agrees with **PlanarTopology**, Layer 2, under the usual real identification ℂ≃ℝ².”

**Claim:** The gate's `dropped` rule (“no name of the project's dropped-names list”) fails on this line: `PlanarTopology` is on the list of roadmaps that are never cited, and it is not on main (it exists only as another author's open pull request).

**Witness:** Gate at this head: `dropped=1 … FAIL — dropped: line 53: agrees with **PlanarTopology**, Layer 2, under the usual real identification ℂ≃ℝ².` It is the only occurrence of the name in the folder; no `*Needs:*` line uses it.

**Repair:** End the sentence at README:52 after the ownership clause: “B2.9 constructs the arbitrary-dimensional invariance-of-domain extension in the shared topology API.” and delete “; its planar specialization agrees with **PlanarTopology**, Layer 2, under the usual real identification ℂ≃ℝ².” B2.9 keeps its own statement, Checks and `*Needs:*` (pinned Tau Ceti complement theorems), so nothing else changes; the gate's `dropped` count becomes 0.

## Previous findings

- none: the previous report (of `fc1683b`) had no findings.

## Verified sound

| Statement | Instances and values computed on each side | Result / change |
|---|---|---|
| `isogenyClassAsymptotic` (F6.5; named in the description's summary) | Upper bound log((4g+1)^g q^(g(g+1)/4))/g² at q=2: g=10 gives (37.14+19.06)/100=0.562; g=1000 gives (8294+173460)/10⁶=0.1818; limit log 2/4=0.1733. g=0 gives 0/0=0 in Lean, irrelevant to `atTop`. | Consistent with the stated limit (log q)/4; no change. |
| `isomorphismClassCount` (F6.4; named in the description's summary) | Signature at head: prime p via `Fact p.Prime`, carrier `ZMod p`, conclusion `=O[atTop] g²`; README F6.4 states log B(p,g)=O_p(g²) for every prime p, including p=2. | Same generality in README, Lean and description; no change. |
| B2.9 invariance of domain (touched by R01) | n=2: an injective continuous map U⊂ℝ²→ℝ² is open; z↦z² on the unit disc is open but not injective (0-fibre of size 1, others 2), x↦x² on (−1,1) has image [0,1), not open. The arbitrary-n target contains n=2. | Removing the comparison clause loses no statement; B2.9 is self-contained. |

Rows for all other statements stand as in the previous review, of `fc1683b`; no statement changed.

- Pull request text (step 8): title and every prose sentence of the description, with the `roadmap-summary` block, read against the head. Checked: it adds a new folder with `README.md`, `Suggested.lean`, `metadata.toml` (3741 insertions, 0 deletions, nothing removed or renumbered); “over a noetherian base” (README:170, :733, :842); `isogenyClassAsymptotic` and `isomorphismClassCount` are declared (`Suggested.lean`:101, :111); `AbelianVectorExtension` is imported from the parent A4.2 (README:23, :314) and Tate's theorem over finite fields from ArithmeticStatisticsPartI (README:146, :535); the divided-power comparison uses Mathlib's `DividedPowerAlgebra` (README supplier contract, P0.5); definitions in the Lean have real bodies (3 definitions, 3 sorried theorems, no sorried data). No sentence is contradicted by the head and no change is left unstated: no finding.
- Gate at this head, rerun: every text scanner 0 except `dropped=1` (R01); `depcheck=0`, `stray-files=0`, `outside-folder=0`, `dirty=0`. Result: FAIL, on R01 only among the checks that ran.
- Dependency check output: `depcheck: 244 roadmaps, 2231 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Diff outside the folder against `origin/main`: empty. Worktree clean at `fc1683bcd350a755c11a9f11f8497570af901ef0`.
- Elaborated signatures (worker's `#check` file, 6 declarations; the seventh entry `and` is prose from a docstring): compared with README F2.2, F6.0, F6.4, F6.5; no binder lost, nothing changed.
- Cross-roadmap citations resolved this round: 3 (`PlanarTopology` — only an open pull request of another author, on the dropped-names list; `ConformalMapping` L3 — on main under `Completed/`; ArithmeticStatisticsPartI §0.16 as cited in the Lean docstrings). The 12 unresolved Lean-name leads are supplier targets, as in the previous review.
- Overlap check: read HeightsRationalPointsAndObstructionsPartII, AbelianVarietiesOverFiniteFields, AbelianSchemesAndArithmeticModuli; nothing shared. HeightsRationalPointsAndObstructionsPartII (its scope paragraph and `*Needs:*` lines) assigns Betti maps, forms, degeneracy loci and fibre-power criteria to this roadmap's B0–B4 and extends B2.3 and B2.21 to higher-dimensional bases; AbelianVarietiesOverFiniteFields consumes F0–F3 here. No overlap fact in the worker's list (no dropped id, no second copy, no other pull request changing this folder).
- Source independence: changed passages only — 0 passages compared with 0 sources (the diff is empty); the arrangement was not compared again (no layer added, removed or reordered).

## Not verifiable

- Elaboration of `Suggested.lean` and the targeted build could not be rerun on this worker: `lake env lean` stops before Lean starts with `error: already exists (error code: 17, file already exists)` on `.lake/packages`, because the packages for the pinned Mathlib `6b7abb3` and Tau Ceti `a91d3aa` are not present in the worker's package cache. The `build (2)` entry in the worker's gate is this same error, not a Lean diagnostic, so it is not raised as a finding against the pull request. The file is byte-identical to the one the previous review elaborated (three `sorry` warnings, nothing else); that result was not reproduced here, and the one-tactic probes were not rerun.
- **Tits**, *Free subgroups in linear groups*, Theorems 1 and 3: settled as uncertified, cited by locator (B2.8), as in the previous review.

## Source issues

- none (no source locator was opened this round; the five issues recorded in the review of `fc1683b` stand).

## For the human reviewers

- none
