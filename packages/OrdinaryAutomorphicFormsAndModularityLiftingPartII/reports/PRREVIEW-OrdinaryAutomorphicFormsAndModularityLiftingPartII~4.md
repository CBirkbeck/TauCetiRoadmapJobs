# Review of OrdinaryAutomorphicFormsAndModularityLiftingPartII (pull request #2268 at 9210046)

**Verdict:** needs changes

Incremental re-review: the folder is unchanged since `9210046` (0 lines); this round reads the pull request's title and description against the head. One finding, in the description; nothing in the folder needs to change.

## R01 (P3) — The description's summary narrows the symplectic theorem to a weight-two seed

**Location:** pull-request description, summary block (`<!-- roadmap-summary -->`), first paragraph: “with reasonable, tidy residual image and a weight-two seed on unique ordinary components.”

**Claim:** The head does not ask the seed π to have weight 2. The weight-2 condition is on the residual representation above p; the seed may be regular algebraic.

**Witness:** `README.md` line 622 (§5.4): π “is either regular algebraic … or of weight 2”; condition (3) puts “ordinary of weight 2” on `ρ̄|G_{F⁺_v}`. BCGP25 lines 6642–6644 say the same of π.

**Repair:** Replace the clause by: “with reasonable, tidy residual image that is ordinary of weight 2 above p, and a seed, regular algebraic or of weight 2, lying on a unique ordinary component at each place above p.”

## Previous findings

- none: the previous report, of `9210046`, listed no finding.

## Verified sound

| Statement | Instances tried | Computed value | Required or competing value | Result / change |
|---|---|---|---|---|
| §5.4 seed datum, weight of π (R01) | π regular algebraic, weights (k_v, l_v; 2); π of weight 2, (1, 1; 2) | README admits both: 2 of 2. BCGP25 lines 6620–6644 admit both: 2 of 2 | Description's “weight-two seed” admits 1 of 2 | Description narrower than head: R01 |
| Description: “the seven headline theorems” | Bullets of the `Suggested.lean` docstring | 4.7, 4.8, 3.2(b), 6.3, 6.4, 5.3, 1.2(4): 7 named, 0 declarations | 7, none stated | Agrees |
| Description: §6.3 uses the selected components' dimensions from §6.2 | g = t − 4d + #S − 1; F⁺ = ℚ, #S = 3, t = 7 | g + 10#S + 4d = t + 11#S − 1; instance 5 + 30 + 4 = 39 | dim S_∞ relative: 7 + 33 − 1 = 39 | Agrees; §6.2 claims nothing on dim R^·_∞ |
| Description: §6.3 consumes DeformationAndDerivedPatchingAlgebra §6.1, not §9.6 | `*Needs:*` of §6.3 (line 728); search of the README for §9.6 | §§6.1, 6.5 cited; §9.6: 0 matches | §6.1 present, §9.6 absent | Agrees |
| Description: §5.2 owns reasonableness, two consumers cite it | README lines 12, 754, 755 | “owned here” once; both consumer bullets name 5.2 | One owner | Agrees |
| Description: dyadic reduced R = T assumes 3.2(b); symplectic theorem on reduced quotients | Summary items 1–2, §4.8 docstring bullet, §6.3 | 4.8 conditional on dim ≥ dim Λ = 1 + nd; 6.3 gives `(R)_red ≅ (T)_red` | Same | Agrees |

Rows for the statements of the folder stand as in the previous review, of `9210046`.

- Pull-request text: title (“roadmap”, a new folder: 847 insertions, 0 deletions, 61 headings added, 0 removed) and every prose sentence compared with the head; 1 sentence contradicted (R01), the others agree.
- Suppliers: 12 `From TauCetiRoadmap.*` subsections in the README; the same 12 names in the description's dependency block.
- Source locators checked: 1 passage (BCGP25 §6.3 opening and Hypothesis 6.3.1, lines 6620–6644, p. 146), the one the finding touches. No seeded target lies in a changed passage, since none changed.
- Library declarations: the change touches none; `Suggested.lean` has 0 declarations, so 0 binder checks and 0 one-tactic probes apply.
- Gate at this head: every check 0, `OK`. Targeted build: exit 0, with the Mathlib module-system warning the description names. `lake env lean` on `Suggested.lean`: exit 0, no output. 0 files changed outside the folder.
- Dependency check output: `depcheck: 236 roadmaps, 2241 edges, 0 problem(s)`.

Overlap check: read PotentialAutomorphyInfrastructurePartII, AbelianSurfacesModularity, GSp4NonregularModularityLifting, AutomorphyLiftingBeyondTaylorWiles, PotentialAutomorphyInfrastructure and GlobalGaloisDeformations (the main-vocabulary list is empty); the overlap facts list no dropped id, no second copy and no other pull request changing this roadmap; shared objects and owners as in the previous reviews, nothing new shared.

Source independence: changed passages only; the folder has none, so 0 passages compared for wording; largest share BCGP25, unchanged from the previous review; no layer added, removed or reordered, so the contents were not compared again.

## Not verifiable

- §3.2(b)'s inputs (★) and (C) remain unproved in the sources and are kept as targets, with §4.8 conditional on the bound; unchanged by this head.

## Source issues

- none

## For the human reviewers

- none
