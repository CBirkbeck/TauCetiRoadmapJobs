# Review of GroupSchemesOverABase (pull request #1522 at 4a23b23)

**Verdict:** needs changes

Incremental re-review of 0 changed lines since 2e1e5e7: the head merges main (8ad4192) and the folder is unchanged; the description was edited. One finding remains, a two-passage deletion in the README.

## R01 (P3) — The FlagVarieties consumer bullet cites a sentence main does not have

**Location:** `TauCetiRoadmap/GroupSchemesOverABase/README.md` lines 1431–1433: "FlagVarieties (Scope) names this roadmap, as GS7, for the relative scheme `Bor(G)`", and lines 1447–1448: "The identifier GS7 used in FlagVarieties resolves here".

**Claim:** FlagVarieties on main names neither this roadmap nor GS7 (the previous report's R03, not repaired: the folder did not change).

**Witness:** `TauCetiRoadmap/FlagVarieties/README.md` on main (8ad4192): 0 occurrences of "GS7" and of "GroupSchemesOverABase". `roadmaps grep --fixed 'GS7'` over main and the 476 open heads: this README's lines 1431 and 1447 only.

**Repair:** Delete the FlagVarieties bullet (lines 1431–1433) and the closing paragraph (lines 1447–1448) of **Downstream consumers**. Nothing else cites GS7 (2 occurrences in the README, both in these passages).

## Previous findings

- R01 — repaired: the description's "Depends on" now reads "ReductiveGroups §8.1 *Split reductive data*, §8.2 *Pinnings*, 9B and Layer 9D … are on main under these numbers"; main's lines 3689, 3719, 4976, 5000 agree.
- R02 — repaired: the description now lists "(Exp. VI_A, VI_B, VII_A, VIII–XII) … Exp. VII_A is cited only for what **Out of scope** excludes" and adds Česnavičius 2022, Gille 2022, Humphreys 1990.
- R03 — not repaired: README lines 1431 and 1447 still read "FlagVarieties (Scope) names this roadmap, as GS7" and "The identifier GS7 used in FlagVarieties resolves here"; raised again as R01.

## Verified sound

| # | Statement | Instances | Values computed | Result |
| --- | --- | --- | --- | --- |
| 1 | README lines 1431, 1447: FlagVarieties names GS7 | FlagVarieties on main 8ad4192; all 476 open heads | 0 occurrences of "GS7", 0 of this roadmap's name; 0 other heads | false at main, R01 |
| 2 | Description: ReductiveGroups §8.1, §8.2, Layer 9D "are on main under these numbers" | main 8ad4192 | line 3689 `### 8.1 Split reductive data`; 3719 `### 8.2 Pinnings`; 4976 `## Layer 9D: classification, relative groups and forms`; 5000 the relative-groups bullet | description true |
| 3 | 4.5 `smooth_of_charZero` (cited by the EllipticCurveModularityPartII bullet, line 1427) | `μ_n/ℚ`; `μ_p/𝔽_p`; trivial group; constant group `ℤ` over `ℚ` | `d(xⁿ−1) = n·xⁿ⁻¹`, a unit mod `xⁿ−1` as `n ≠ 0`: étale; `𝔽_p[x]/(x−1)^p` nonreduced, excluded by `[CharZero k]`; `Spec k` smooth; `⊔_ℤ Spec ℚ` locally of finite type, étale | ok |
| 4 | Description: "The suppliers still open are those listed below"; supplier list | the 11 roadmaps of the description against main | on main: ReductiveGroups, ReductiveGroupsPartII, SchemeAndStackFoundations, ModularCurves, SchubertGeometry, EquivariantIntersectionTheory (6); not on main: the 5 unchecked entries of the `depends-on` block | description true |
| 5 | Description: "Nothing outside the folder changes"; three files | `git diff --stat origin/main...HEAD` outside the folder; folder listing | empty; `README.md`, `Suggested.lean`, `metadata.toml` | description true |

Rows for the statements of the folder stand as in the previous review, of `2e1e5e7`.

- **Gate.** Worker's gate (`scratch/gate.md`): every counter 0, `build=0`, OK. My rerun with the candidate order: every counter 0, OK.
- **Dependency check** (the brief's command): `depcheck: 247 roadmaps, 2242 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line; the candidate order lists the roadmap at line 69.
- **Elaboration.** `lake env lean` on `Suggested.lean` at this head (after the merge of main): exit 0, 25 `declaration uses sorry` warnings, no other message. The file is unchanged, so the signature comparison and the one-tactic probe of the earlier rounds stand.
- **Description, remaining sentences.** Title, the layer bullets, the headline list (0.2, 1.2–1.4, 2.2, 2.5, 2.6, 3.1–3.3, 4.2, 4.3, 4.5–4.9; 25 theorems) and the source list against **References**: no contradiction; the description states that the pull request adds the roadmap (1923 insertions, 0 deletions, 64 headings, 33 declarations).
- **Cross-roadmap citations resolved again (5).** EllipticCurveModularityPartII (open, lines 90, 822, 832 cite this roadmap); SpringerResolutionAndCharacteristicCycles line 10; ReductiveGroupsPartIII line 119; PurityForFlatCohomology (160e354) §§7.12a–7.12e at lines 2574–2869; HeightsRationalPointsAndObstructions (3dc9d71) §3.8e at line 1559. `scratch/citations.md`: no cross-roadmap citation unresolved; the two Lean-name leads (README lines 491, 540) are this roadmap's own declarations.
- **Overlaps** (`scratch/overlaps.md`): no other pull request changes this roadmap, no cited id dropped, none defined only by an open revision, no second copy (the folder is not on main).
- Overlap check: read PurityForFlatCohomology, ReductiveGroups (main and its open revision), ReductiveGroupsPartIII, NeronModelsAndSemistableAbelianVarieties, ReductiveGroupsPartII, ModularCurves; diagonalizable groups, groups of multiplicative type and tori over an arbitrary base: owner this roadmap (earlier in the order), also claimed by PurityForFlatCohomology lines 211–213 (see the human reviewers' section); `D_S(M)` for finite `M`: ModularCurves 0B; `π₀(G/k)` in finite type: NeronModelsAndSemistableAbelianVarieties 2.2; relative reductive theory: ReductiveGroups Layer 9D.
- Source independence: changed passages only; 0 passages compared with 0 sources (no change in the folder); arrangement not compared again (no layer added, removed or reordered); largest share SGA 3, as in the previous rounds.
- Remark (no change requested): the EllipticCurveModularityPartII bullet's "§6.0f is to cite it" is already met at that roadmap's open head; the *From ReductiveGroups* contract does not list Layer 2, which Scope (line 84) says 4.4 and 5.3 use.

## Not verifiable

- Carried and untouched: Sansuc 1981 §6 and Popov 1974 §4 (the cached `sansuc1981` text is a landing page); Demazure–Gabriel I (no legal online copy); Slodowy, LNM 815 (paywalled); Jantzen II.1.8 and II.4.4, Humphreys 1.12, Bourbaki Lie VI §3 no. 4 (not read).
- The seeded sample was not reread: no sampled target lies in a changed passage (0 changed lines).

## Source issues

- none

## For the human reviewers

- **Ownership.** PurityForFlatCohomology (open, 160e354) lines 211–213 says diagonalizable groups, multiplicative type and tori over an arbitrary base are "owned here" (§§7.12a–7.12e); this README lines 41–48 owns the same. The edit is in that pull request.
- **Ownership.** HeightsRationalPointsAndObstructions (open, 3dc9d71) §3.8e, line 1559, proves the Picard groups of a split reductive group over a field itself; 6.2 here (line 1207) owns them. The edit is in that pull request.
