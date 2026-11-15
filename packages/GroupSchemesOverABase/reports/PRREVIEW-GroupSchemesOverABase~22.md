# Review of GroupSchemesOverABase (pull request #1522 at 180c164)

**Verdict:** accepted

Incremental re-review of 6 changed lines since 4a23b23 (6 deletions in `TauCetiRoadmap/GroupSchemesOverABase/README.md`, **Downstream consumers**). No finding.

## Previous findings

- R01 — repaired: the FlagVarieties bullet and the closing GS7 paragraph are gone; `README.md` and `Suggested.lean` have 0 occurrences of "GS7" and of "FlagVarieties"; **Downstream consumers** now ends with the SpringerResolutionAndCharacteristicCycles bullet (lines 1423–1442). The repair introduced no new problem: nothing else in the folder cited either passage.

## Verified sound

| # | Statement | Instances | Values computed | Result |
| --- | --- | --- | --- | --- |
| 1 | The deleted passages (FlagVarieties names this roadmap as GS7) | this folder at 180c164; FlagVarieties on main 276e711; every open head | folder: 0 "GS7", 0 "FlagVarieties"; main's FlagVarieties: 0 "GS7", 0 "GroupSchemesOverABase"; `roadmaps grep --fixed 'GS7'`: no match anywhere | deletion right, nothing dangling |
| 2 | 6.2 exact sequence `0 → X*(G) → X*(T) → Pic(G/B⁻) → Pic(G) → 0` (cited by the HeightsRationalPointsAndObstructions bullet, which now follows the deletion) | `SL₂`; `PGL₂`; `GL₂`; a torus; `PGL₃` | `0 → ℤ → ℤ → 0`; `ℤα = 2ℤϖ ⊂ ℤϖ`, cokernel `ℤ/2`; `(a,b) ↦ a−b`, kernel `ℤ·det`, cokernel `0`; `Δ = ∅`: `X*(T) → X*(T) → 0 → 0`; `P/Q = ℤ/3` | ok, agrees with the three Checks |
| 3 | Description: "Nothing outside the folder changes"; three files; suppliers still open | `git diff --stat origin/main...HEAD` outside the folder; folder listing; the 11 supplier roadmaps against main 276e711 | empty; `README.md`, `Suggested.lean`, `metadata.toml`; 6 on main, 5 not on main = the 5 entries of the `depends-on` block | description true |
| 4 | Description: ReductiveGroups §8.1, §8.2, Layer 9D "are on main under these numbers" | main 276e711 | lines 3689 `### 8.1 Split reductive data`, 3719 `### 8.2 Pinnings`, 4976 `## Layer 9D: classification, relative groups and forms` | description true |

Rows for the untouched statements of the folder stand as in the previous review, of `4a23b23`.

- **Gate.** Worker's gate (`scratch/gate.md`): every counter 0, `build=0`, OK. My rerun with the candidate order: every counter 0, OK.
- **Dependency check** (the brief's command): `depcheck: 245 roadmaps, 2238 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line; the candidate order lists the roadmap at line 69.
- **Elaboration.** `lake env lean` on `Suggested.lean` at this head: exit 0, 25 `declaration uses sorry` warnings, no other message. The file is unchanged since `4a23b23`, so the signature comparison and the one-tactic probe of the earlier rounds stand.
- **Description against the head.** It names neither FlagVarieties nor GS7, so the deletion leaves no sentence wrong and no change unstated; it states that the pull request adds the roadmap (now 1917 insertions, 0 deletions, 64 headings, 33 declarations; no heading or declaration removed by this change).
- **Cross-roadmap citations of the remaining consumer bullets resolved again (4).** EllipticCurveModularityPartII (open, 99111f0) lines 11, 90, 92 cite §4.5 `smooth_of_charZero`; HeightsRationalPointsAndObstructions (open) `### 3.8e` at line 1559; PurityForFlatCohomology (open, a825987) §§7.12a–7.12e at lines 2591–2892; SpringerResolutionAndCharacteristicCycles (open, 906b9c7) line 10 names §7.6. `scratch/citations.md`: no cross-roadmap citation unresolved; the two Lean-name leads (README lines 491, 540) are this roadmap's own declarations.
- **Overlaps** (`scratch/overlaps.md`): no other pull request changes this roadmap, no cited id dropped, none defined only by an open revision, no second copy (the folder is not on main).
- Overlap check: read PurityForFlatCohomology, ReductiveGroups (main and its open revision), ReductiveGroupsPartIII, NeronModelsAndSemistableAbelianVarieties, ReductiveGroupsPartII, ModularCurves; diagonalizable groups, groups of multiplicative type and tori over an arbitrary base: owner this roadmap (earlier in the order), also claimed by PurityForFlatCohomology (see the human reviewers' section); `D_S(M)` for finite `M`: ModularCurves 0B; `π₀(G/k)` in finite type: NeronModelsAndSemistableAbelianVarieties 2.2; relative reductive theory: ReductiveGroups Layer 9D.
- Source independence: changed passages only; 0 passages compared with 0 sources (the change only deletes text and no source locator); arrangement not compared again (no layer added, removed or reordered); largest share SGA 3, as in the previous rounds.

## Not verifiable

- Carried and untouched: Sansuc 1981 §6 and Popov 1974 §4 (the cached `sansuc1981` text is a landing page); Demazure–Gabriel I (no legal online copy); Slodowy, LNM 815 (paywalled); Jantzen II.1.8 and II.4.4, Humphreys 1.12, Bourbaki Lie VI §3 no. 4 (not read).
- The seeded sample was not reread: no sampled target lies in a changed passage (the change deletes two passages of **Downstream consumers** and adds nothing).

## Source issues

- none

## For the human reviewers

- **Ownership.** PurityForFlatCohomology (open, a825987) line 208 says diagonalizable groups, multiplicative type and tori over an arbitrary base are "owned here" (§§7.12a–7.12e, lines 2591–2892); this README lines 41–48 owns the same. The edit is in that pull request.
- **Ownership.** HeightsRationalPointsAndObstructions (open) §3.8e, line 1559, proves the Picard groups of a split reductive group over a field itself (as read in the previous review; heading resolved again); 6.2 here (line 1207) owns them. The edit is in that pull request.
