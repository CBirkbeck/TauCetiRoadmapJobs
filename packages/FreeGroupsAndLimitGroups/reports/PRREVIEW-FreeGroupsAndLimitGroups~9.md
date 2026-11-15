# Review of FreeGroupsAndLimitGroups (pull request #2205 at d31b59b)

**Verdict:** needs changes

## R01 (P3) — Disclose the finite-rank restriction in §11.5

**Location:** PR description, `scratch/pull-request.md:24`: “No other target is added, removed or weakened.” The `roadmap-summary` block at line 15 likewise omits the coefficient-rank restriction.
**Claim:** The description omits a narrowing of the README's quadratic implicit-function theorem, beyond the listed corrections.
**Witness:** `TauCetiRoadmap/FreeGroupsAndLimitGroups/README.md:2730` adds “of finite rank” to §11.5's coefficient group; the base's §11.5 has no rank restriction. `FreeGroup ℕ` satisfies the old coefficient hypothesis and fails the new one.
**Repair:** Replace the quoted sentence with: “Section 11.5 also restricts the coefficient free group to finite rank and extends the compatible equation to a finite system.” In `roadmap-summary`, change “over nonabelian free groups” to “over nonabelian free groups of finite rank”.

## Previous findings

- R01 — repaired: `TauCetiRoadmap/FreeGroupsAndLimitGroups/README.md:903` cites GL-JSJ §§1.2, 1.3 and 1.4.2; lines 800, 872 and 963 retain the corrected §1.2 locators.
- R02 — repaired: `TauCetiRoadmap/FreeGroupsAndLimitGroups/README.md:247` separates `x` and `y`; line 1230 uses `ℤ`; line 1782 uses `Ω_K`. The passing text gate confirms no recurrence.
- R03 — repaired: `TauCetiRoadmap/FreeGroupsAndLimitGroups/README.md:1029`–1033 retain the five discriminating Checks for freely indecomposable groups and Grushko decompositions.
- R04 — repaired: `TauCetiRoadmap/FreeGroupsAndLimitGroups/README.md:489` inserts `x⁻¹x` at the identified terminus; line 494 distinguishes the accepted subgroup from the label language.
- R05 — repaired: PR description, `scratch/pull-request.md:26`, specifies #2205 before #2221; the `merge-order` block repeats that order at line 94.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| §11.5 coefficient scope | `F(Fin 2)`; `F(ℕ)` | Old hypotheses: true, true. New hypotheses: true, false; basis cardinalities `2`, `ℵ₀`. | Description omits restriction | R01: description only |
| `hasCompleteLift_of_isRegularOrientable` | `F₂`, genus two, `d=1`; `T:z=x₁`, `W=a` | At `(a,b,b,a)`, `S=[a,b][b,a]=1`; `κ=4`; generic `z=x₁` gives `zx₁⁻¹=1`, `a≠1`. | Regular exception and lift agree | none |
| `hasCompleteLift_of_isRegularNonorientable` | `F₂`, four squares, `d=1`; `T:z=x₁`, `W=a` | `S(a,a⁻¹,b,b⁻¹)=a²a⁻²b²b⁻²=1`; `κ=4`; `[a⁻²,b²]≠1`; generic `z=x₁` gives `zx₁⁻¹=1`, `a≠1`. | Regularity and lift agree | none |

Rows for untouched statements stand as in the previous review of `d31b59b`.

- Incremental scope: 0 changed folder lines; 0 outside-folder edits; all 5 previously resolved findings accounted for.
- PR text: title, prose and `roadmap-summary` compared with the base diff: 854 insertions, 2060 deletions; numbered sections retained; supplier changes and Lean replacement described.
- Sources: 0 newly changed source-dependent passages; 0 seeded targets fall in a folder change; the previous locator checks stand.
- Signatures: all 26 `#check @name` probes elaborate together; README comparison retains the same binders, including finite coefficient rank in both §11.5 headlines; no type changes.
- Library: opened 4 declarations at Tau Ceti `GroupTheory/FreeGroup/Linear.lean:89`, 98, 110 and 118; they support the description's §5.8 library claim.
- Cross-roadmap citations: GraphConnectivityAndFlows Targets 1.1 and 2.1 resolve on main; RepresentationTheory/CharacterTheory Layer 8 resolves at `README.md:1210`; SurfaceTopology's supplier table retains §§2.1–2.2a and 6.0a–6.0d.
- Gate: all checks 0, OK; targeted build passes. Dependency output: `depcheck: 245 roadmaps, 2211 edges, 0 problem(s)`; no UPWARD or CYCLE.
- Direct elaboration: exit 0, 12 `sorry` warnings only. Targeted build also emits a module-system advisory; no build failure. The previous one-tactic probes stand.

Overlap check: read SurfaceTopology, RandomGraphs, GraphConnectivityAndFlows and GeometricTopology; this roadmap owns the combinatorial surface and signed graph-group inputs consumed by SurfaceTopology; GraphConnectivityAndFlows owns multigraph connectivity and forests; GeometricTopology owns manifold JSJ; RandomGraphs owns general formula coding, distinct from the group-language specialization here. No changed ownership passage.

Source independence: changed passages only; 0 passages compared with 0 sources. Largest share: IFT, 58 of 267 bracketed source citations before References. No layer added, removed or reordered since `d31b59b`; arrangement and reuse comparisons were not reopened.

## Not verifiable

- No new source-access question in this incremental scope; TREES remains uncertified as recorded in the previous review.

## Source issues

- none

## For the human reviewers

- none

