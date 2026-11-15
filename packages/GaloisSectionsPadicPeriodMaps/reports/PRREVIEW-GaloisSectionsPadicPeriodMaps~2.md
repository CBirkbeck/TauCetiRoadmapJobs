# Review of GaloisSectionsPadicPeriodMaps (pull request #1739 at aa9c90f)

**Verdict:** needs changes

Incremental re-review of the 138 lines changed since `0d951ae` (README only), and of the pull request's title and description against this head. Both findings are names that the renamed headings left without a referent.

## R01 (P3) — "Theorem A" and "Theorem B" no longer name anything in the roadmap

**Location:** `TauCetiRoadmap/GaloisSectionsPadicPeriodMaps/README.md` lines 1474, 1482, 1491, 1495, 1529, e.g. line 1491: "As in Theorem A; Stoll's conjecture that the locus is the closure of Y(K) … is not assumed."

**Claim:** The change renamed "9.4 Theorem A: …" and "9.5 Theorem B: …" to descriptive headings, so the label "Theorem A"/"Theorem B" used in §§9.4, 9.5 and Downstream consumers is now defined nowhere in the README.

**Witness:** Headings at lines 1470 and 1487 carry no label; the only remaining anchors are the source citations at lines 1476 and 1493 and "Betts–Stix, Theorem B" at line 284.

**Repair:** Refer by section. Line 1474: "…is not assumed; the statement is an unconditional prediction of it." Line 1482: "…so §9.4 is a consequence of the section conjecture". Line 1491: "As in §9.4; …". Line 1495: "Apply §9.4 with the identical field and genus hypotheses." Line 1529: "§9.4 constrains …; §9.5 gives the corresponding finite-descent constraint." (Lines 284 and 1505, which the change did not touch, read better as "§9.4" too.)

## R02 (P3) — "the orbit lemma" survives the renaming of §2.3

**Location:** `TauCetiRoadmap/GaloisSectionsPadicPeriodMaps/README.md` line 1152: "…or exactly one automorphism orbit, by the orbit lemma."

**Claim:** §2.3 was "The orbit lemma for retwisted filtrations"; it is now "Orbits of retwisted filtrations and the dimensions of their automorphism groups" and its statement is called "the orbit criterion" (lines 577, 585, 1136). "The orbit lemma" names nothing.

**Witness:** `grep -n 'orbit lemma'` on the README returns line 1152 only; "orbit criterion" occurs at lines 577, 585, 787, 1136.

**Repair:** Replace the end of line 1152 by "…or exactly one automorphism orbit, by the orbit criterion of §2.3."

## Previous findings

- none: the review of `0d951ae` accepted the folder and listed no finding.

## Verified sound

| Statement | Instances tried | Values computed on each side / wrong model | Result; change |
|---|---|---|---|
| §2.3 orbit criterion, reworded | K_v=ℚₚ, D_dR of dimension 2, Aut(D_pst)=G_m² on P¹ | diag(1,2) carries [1:1] to [1:2]; no diag(a,b) carries [1:0] to [1:1]. Three orbits, dimensions 0,0,1 ≤ 2. | Both directions hold as reworded; no change. |
| §2.3 dimension bound, "any one of finitely many classes" | Union of the two eigenline classes; all three classes | Z = two points, dim 0 ≤ 2; Z = P¹, dim 1 ≤ 2 = dim Aut(D_pst). | Finite-union form agrees with the earlier wording; no change. |
| §7.1 Check cited by R02 | Same torus example; a class with other φ-eigenvalues | Matching D_pst: exactly one of the three orbits. Mismatched D_pst: 0 Lagrangians. | Check true; only its name for §2.3 is stale (R02). |
| §9.4, reworded | K=ℚ; K=ℚ(∛2); K=ℚ(i) | Degrees 1 and 3 admit no CM subfield (CM degree is even): hypothesis holds. ℚ(i) is CM: hypothesis fails, places above 5 are exchanged. | Hypotheses equal those before the change (number field, no CM subfield, smooth projective geometrically connected, genus ≥ 2); no change. |
| §9.5, reworded | Empty Y(K_v); one rational point; hypotheses against §9.4 | Projection and loc_v image have cardinal 0=0, resp. the same single point, by §0.5. "As in §9.4" imports exactly the four hypotheses above. | Same statement as before; no change beyond R01. |
| New linking sentences (13) against the `*Needs:*` lines | Every "§x uses §y" claim, 46 edges | 44 edges appear in the consumer's `*Needs:*` line; the other two (§5.2→§2.3, §7.4→§6.3) appear in the consumer's API bullets at lines 848 and 1202. | No false edge. |

The rows for the statements the change did not touch stand as in the previous review, of `0d951ae`.

- Source locators checked against the text: 3 (bs Lemma 2.15, p. 12, bs lines 578–587; bs Theorem A, p. 1, bs lines 44–47; bs Theorem B, p. 2, bs lines 66–68). The seeded targets that fall in the changed passages (§§2.3, 9.5) agree in number, page and hypotheses; the others changed in heading only.
- Library declarations opened: 0 new; the change cites none that the review of `0d951ae` did not open.
- Cross-roadmap citations: none added or changed. No roadmap on main or at an open head cites a section of this roadmap (`roadmaps grep GaloisSectionsPadicPeriodMaps`: 0 hits outside the folder), so the sections now carried as run-in paragraphs (2.4, 3.3, 3.4, 4.2, 4.4, 4.5, 5.2, 6.2, 6.3, 6.5, 6.9, 7.2, 7.3, 7.5, 7.8, 8.2, 8.3, 8.5) break no citation; all 59 section ids are still present.
- Gate at `aa9c90f`: every check 0, `OK` (re-run; the worker's run also reports `build=0`). Dependency check: `depcheck: 244 roadmaps, 2229 edges, 0 problem(s)`, no UPWARD or CYCLE line. Outside-folder diff: empty.
- Elaboration of `TauCetiRoadmap/GaloisSectionsPadicPeriodMaps/Suggested.lean`: exit 0, no output. The file is unchanged since `0d951ae`: 0 declarations, so the `#check` inventory and the one-tactic probe have 0 cases.
- Pull request text: the title and each sentence of the description's summary and prose were read against the head (adds a new roadmap; Part II of AnabelianGeometryAndNonabelianChabauty, README line 3; density-one comparison, §8.6 (I)–(II); nonreduced and nonsplit algebras, §6.8; locally constant relative dimension, §5.2; outside-folder diff 0). None is contradicted, and since the roadmap is new nothing is removed or renumbered against the base.
- Remark (no change asked): the description's "the Lean states only real-bodied definitions and theorems" and "`sorry` as the only warning" hold vacuously: the file has no declaration and its docstring names 14 headline families as not statable.
- Remark (untouched text, no change asked): the `*Needs:*` lines of §5.2 and §7.4 omit §2.3 and §6.3, which their API bullets at lines 848 and 1202 cite.

Overlap check: searched MordellLawrenceVenkatesh, AnabelianGeometryAndNonabelianChabauty, PadicHodgeTheory, HeightsRationalPointsAndObstructions and every other roadmap on main and at the open heads by object (Selmer sections, symplectic pairs of Galois representations, self-conjugate places, filtered discrete modules, modified adelic points of schemes); nothing shared. The change adds no object; ownership is as in the review of `0d951ae`.

Source independence: changed passages only; 3 reworded passages (§§2.3, 9.4, 9.5) and 13 new linking paragraphs compared with 1 source (bs), none shared (longest common run 5 words, "as filtered discrete (φ, N, G_v)-modules", forced by the statement); largest share bs, 65 of 68 locators; contents not compared again, since the change adds, removes or reorders no layer.

## Not verifiable

- The description's account of earlier review and red-team rounds is a statement about process, not about the head; it was not checked.

## Source issues

- none

## For the human reviewers

- none
