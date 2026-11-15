# Review of GroupSchemesOverABase (pull request #1522 at 2e1e5e7)

**Verdict:** needs changes

Incremental re-review of 0 changed lines since 2e1e5e7: the folder is unchanged, and this round reads the pull request's title and description against the head and against main (3cf7342). R01 and R02 are edits to the description only; R03 is a two-passage deletion in the README.

## R01 (P3) — The description's "Depends on" paragraph is contradicted by main

**Location:** pull-request description, "Depends on": "ReductiveGroups #1676 (#1797 and #1808 share its numbering) … main still has this material as Layer 8 and 9B. In #1332's numbering the same material is §8.2 *Relative reductive groups* and 9B.0."

**Claim:** Main no longer has the old numbering, #1676 and #1332 are merged, and #1797 no longer changes ReductiveGroups; the roadmap depends on no open ReductiveGroups revision.

**Witness:** `TauCetiRoadmap/ReductiveGroups/README.md` on main (commits b06dcdf, 002b143): line 3689 `### 8.1 Split reductive data`, 3719 `### 8.2 Pinnings`, 4976 `## Layer 9D: classification, relative groups and forms`, 5000 the bullet *Relative reductive groups over an arbitrary affine base*.

**Repair:** Replace the paragraph by: "ReductiveGroups §8.1 *Split reductive data*, §8.2 *Pinnings*, 9B and Layer 9D *classification, relative groups and forms*, cited in Layers 6–7, are on main under these numbers. The suppliers still open are those listed below." (#1808, a draft that changes ReductiveGroups, keeps the same ids: its lines 2041, 2065, 2942.)

## R02 (P3) — The description's source list does not match the head's references

**Location:** pull-request description, "Sources": "SGA 3, *Schémas en groupes*, Gille–Polo re-edition (Exp. VI_A, VI_B, VIII–XII), read for every locator cited."

**Claim:** The head also cites Exp. VII_A, and three works of **References** are absent from the description's list.

**Witness:** `TauCetiRoadmap/GroupSchemesOverABase/README.md` lines 121–123 and 1491: "Exp. VII_A 6.1, 7.2, 7.4, 8.1.2"; lines 1500–1505 (Česnavičius 2022; Gille 2022) and 1527–1528 (Humphreys 1990).

**Repair:** Write "(Exp. VI_A, VI_B, VII_A, VIII–XII)", saying of VII_A that it is cited only for what **Out of scope** excludes, and add: "K. Česnavičius, « Problems about torsors over regular rings » (2022); P. Gille, « When is a reductive group scheme linear? » (2022); J. E. Humphreys, *Reflection groups and Coxeter groups* (1990)."

## R03 (P3) — The FlagVarieties consumer bullet cites a sentence main no longer has

**Location:** `TauCetiRoadmap/GroupSchemesOverABase/README.md` lines 1431–1433: "FlagVarieties (Scope) names this roadmap, as GS7, for the relative scheme `Bor(G)`", and lines 1447–1448: "The identifier GS7 used in FlagVarieties resolves here".

**Claim:** FlagVarieties on main does not name this roadmap or GS7. The text is untouched, but main changed under it on 13 Nov. (45f58db), after the review of 9 Nov. resolved the citation; it is raised for that reason.

**Witness:** `TauCetiRoadmap/FlagVarieties/README.md` on main: 0 occurrences of "GS7" and of "GroupSchemesOverABase"; line 29 lists "relative schemes parametrizing parabolics" as outside its scope, naming no roadmap. `roadmaps grep --fixed 'GS7'` over main and the 474 open heads: this README only.

**Repair:** Delete the FlagVarieties bullet (lines 1431–1433) and the closing paragraph (lines 1447–1448). Nothing else cites GS7 (`grep -c GS7` on the README: 2, both in these passages).

## Previous findings

- none: the previous report (accepted at 2e1e5e7) had no finding.

## Verified sound

| # | Statement | Instances | Values computed | Result |
| --- | --- | --- | --- | --- |
| 1 | Description: ReductiveGroups §8.1, §8.2, Layer 9D "only in #1676's numbering" | main 3cf7342; #1808 head 705e4f6 | main lines 3689, 3719, 4976, 5000; #1808 lines 2041, 2065, 2942, 2952; overlaps: 0 ids only an open revision defines | description false, R01 |
| 2 | Description: headlines stated are 0.2, 1.2–1.4, 2.2, 2.5, 2.6, 3.1–3.3, 4.2, 4.3, 4.5–4.9 | the 25 theorems of `Suggested.lean`, by docstring tag | 0.2: 1; 1.2: 1; 1.3: 2; 1.4: 2; 2.2, 2.5, 2.6: 1 each; 3.1–3.3: 1 each; 4.2, 4.3: 1 each; 4.5: 5; 4.6: 2; 4.7, 4.8: 1 each; 4.9: 2; total 25 | description true |
| 3 | 1.3 `smooth_diagonalizable_iff` (cited by the description) | `M = ℤ/6`, `S = Spec ℤ`; `M = ℤ`; `M = 0`; `S = ∅` | at `(2)`: `6 = 0` in `𝔽₂`, fibre `𝔽₂[x]/(x−1)² × …` nonreduced, both sides false; torsion card `1 ≠ 0`, `𝔾_m` smooth; card `1`, `D = S`; both sides vacuously true | ok |
| 4 | Description: supplier list | 11 roadmaps of **Exact supplier contracts** (lines 233–265) against the description's 11 | same 11 names; ReductiveGroups Layer 2 is named in Scope (line 84), not in the contract | description true |
| 5 | Description: "Nothing outside the folder changes"; three files, topic `math.AG` | `git diff --stat origin/main...HEAD` outside the folder; folder listing | empty; `README.md`, `Suggested.lean`, `metadata.toml` with `topic = "math.AG"` | description true |
| 6 | README lines 1431, 1447: FlagVarieties names GS7 | main's FlagVarieties; all open heads | 0 occurrences; 0 other heads | false at main, R03 |

Rows for the statements of the folder stand as in the previous review, of `2e1e5e7`.

- **Gate.** Worker's gate (`scratch/gate.md`): every counter 0, `build=0`, OK. My rerun with the candidate order: every counter 0, OK; without `--order` it prints `depcheck: NOT IN ORDER: GroupSchemesOverABase (insert it after its last supplier)`, the placement notice (the candidate order lists the roadmap at line 69).
- **Dependency check** (the brief's command): `depcheck: 245 roadmaps, 2217 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- **Elaboration.** `lake env lean` on `Suggested.lean`: exit 0, 25 `declaration uses sorry` warnings, no other message. The file is unchanged, so the signature comparison and the one-tactic probe of the earlier rounds stand.
- **Description, remaining sentences.** Title; the six layer bullets against the 64 headings; "SGA 3, Exp. X, 8.7" against 5.3 (line 1087); the paragraph on ReductiveGroups Layer 9D and §§8.1–8.2 against Scope (lines 68–90); "its docstring names, for each other target, the carrier it lacks" against the docstring (1.5, 1.6, 2.3, 2.4, 2.7, 3.1 for smooth affine targets, 3.4, 3.5, 4.1, 4.4, Layers 5–7; 3.6 is covered by the `Z_G(H)` entry without its number): no contradiction.
- **Cross-roadmap citations resolved again at the current heads (5).** #1491 EllipticCurveModularityPartII (99111f0): now has a contract *From TauCetiRoadmap.GroupSchemesOverABase* (lines 90–92) and cites §4.5 in §6.0f (lines 822, 832), so the bullet's request is met. #1017 (3dc9d71, §3.8e at line 1560) and #1840 (160e354, §§7.12a–7.12e at lines 2574–2869): 0 mentions of this roadmap, bullets true as written. #1828 line 10 cites §7.6. #2131 ReductiveGroupsPartIII line 119 cites §7.2 for the Steinberg map over `ℤ`, consistently with 7.2.
- **Overlaps and citations** (`scratch/overlaps.md`, `scratch/citations.md`): no other pull request changes this roadmap, no cited id dropped, none defined only by an open revision; the two Lean-name leads (lines 491, 540) are this roadmap's own declarations (`Suggested.lean` lines 178, 195).
- Overlap check: read PurityForFlatCohomology (#1840), ReductiveGroups (main and #1808), ReductiveGroupsPartIII (#2131), ReductiveGroupsPartII, ModularCurves, NeronModelsAndSemistableAbelianVarieties (#852, as resolved in the previous rounds); diagonalizable groups, groups of multiplicative type and tori over an arbitrary base: owner this roadmap (earlier in the order), also claimed by #1840 lines 211–217 (see the human reviewers' section); `D_S(M)` for finite `M`: ModularCurves 0B; `π₀(G/k)` in finite type: NeronModelsAndSemistableAbelianVarieties 2.2; relative reductive theory: ReductiveGroups Layer 9D.
- Source independence: changed passages only; 0 passages compared with 0 sources (no change in the folder); arrangement not compared again (no layer added, removed or reordered); largest share SGA 3, as in the previous rounds.
- Remark (no change requested): the EllipticCurveModularityPartII bullet's "§6.0f is to cite it" is now met by #1491; AlgebraicModuliForArithmeticGeometry §7.9 overlaps 4.6's first statement, carried from the previous rounds; the *From ReductiveGroups* contract does not list Layer 2, which Scope (line 84) says 4.4 and 5.3 use.

## Not verifiable

- Carried and untouched: Sansuc 1981 §6 and Popov 1974 §4 (the cached `sansuc1981` text is a landing page); Demazure–Gabriel I (no legal online copy); Slodowy, LNM 815 (paywalled); Jantzen II.1.8 and II.4.4, Humphreys 1.12, Bourbaki Lie VI §3 no. 4 (not read).
- The seeded sample was not reread: no sampled target lies in a changed passage (0 changed lines).

## Source issues

- none

## For the human reviewers

- **Ownership.** #1840 PurityForFlatCohomology (160e354) lines 211–217 says diagonalizable groups, multiplicative type and tori over an arbitrary base are "owned here" (§§7.12a–7.12e); this README lines 41–48 owns the same. The edit is in #1840.
- **Ownership.** #1017 HeightsRationalPointsAndObstructions (3dc9d71) §3.8e, line 1560, proves the Picard groups of a split reductive group over a field itself; 6.2 here (line 1207) owns them. The edit is in #1017.
