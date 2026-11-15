# Review of ClassicalGroupsPartII (pull request #1492 at a8badcd)

**Verdict:** needs changes

## R01 (P3) — The description still lists the merged ClassicalGroups revision as an open supplier

**Location:** The description's dependency paragraph says “Open suppliers: ArithmeticGaloisRepresentations (#856) §7.3; PELModuli (#966) §§M0.5–M0.8; the ClassicalGroups revision (#1192) §§3A.1–3A.3.” The `roadmap-summary` block has the line “- [ ] depends on: #1192”.

**Claim:** #1192 has merged, so this pull request no longer waits on it, and the ClassicalGroups §§3A.1–3A.3 it cites are now on main. Both passages still present #1192 as pending. The summary block's unticked box also contradicts the `depends-on` block, which ticks #1192.

**Witness:** Main 8ad4192 contains 848b62d0, “ClassicalGroups: rational classification and explicit GT bases (#1192)”. Sections §3A.1–§3A.3 are at lines 658, 749 and 801 of `TauCetiRoadmap/RepresentationTheory/ClassicalGroups/README.md` on main.

**Repair:** In the prose, replace the sentence with “Open suppliers: ArithmeticGaloisRepresentations (#856) §7.3; PELModuli (#966) §§M0.5–M0.8. ClassicalGroups §§3A.1–3A.3 are on main.” In the `roadmap-summary` block, delete “- [ ] depends on: #1192”; the `depends-on` block already lists the open suppliers. Checked: #856 (head 00e8930) and #966 (head 697b514) are still open, and every §3A anchor the README cites resolves on main.

## Previous findings

- None: the review of a8badcd raised no finding of its own.

## Verified sound

No statement changed since a8badcd. The rows below were recomputed this round with an exact integer script. They cover the headlines the description names and the supplier that R01 touches.

| Statement (location) | Instances tried | Values computed on each side | Result; change |
| --- | --- | --- | --- |
| `fullInvariantPresentation` (`Suggested.lean:109`; CG.2.4); the description's “full representation ring … Weyl invariants” | g=1,2,3; every flip and pair permutation | every F_k is fixed by all flips and permutations; augmentations [2], [4,5], [6,14,14] = binom(2g,k)−binom(2g,k−2) | True; retain |
| `positiveInvariantPresentation` (136; CG.3.2); the description's “polynomial ring over Z in [ν] and the [P_k]” | g=1,2,3 | minimum cone value over the monomials of every F_k is 0; t has cone value 1; so every generator lies in the positive fixed ring | True; retain |
| `mem_positiveSubring` (130; CG.3.1); the description's “support criterion” | g=1: t/z², t; g=0 | t/z² has cone −1 and is no z^a(t/z)^b with a,b≥0; t=z·(t/z) has cone 1; at g=0 the ring is ℤ∌t, so `0<g` is needed | True; retain |
| ClassicalGroups §3A.3 on main (line 801), consumed by CG.1.4–CG.1.5 (R01's supplier) | g=2,3; sign of the bivector | κ_k is onto for k≤r+1; dim P_k: 5 (g=2, k=2), 14 and 14 (g=3); native Σf_i∧e_i=−Ω, as README line 1016 says | True; retain |
| CG.2.5 Check, F₂ at g=2 (README 1388) | exact expansion | z₁z₂+t+tz₁/z₂+tz₂/z₁+t²/(z₁z₂): 5 monomials with coefficient 1, so dim P₂=5 | True; retain |

The rows for the other statements stand as in the previous review, of a8badcd.

- **Pull-request text.** The title and every claim of the summary block and the prose were checked against README lines 1–25, 108–118, 145, 148, 173, 424, 935 and 1200–1219 and against Downstream consumers. All match the head except R01. There are 3 files and 21 declarations, the outside-folder diff is empty, and the Validation line agrees with the gate.
- **Suppliers.** The ClassicalGroups folder on main is tree b30b57f, identical to the revision head 47ca68e. All 11 cited anchors (Layers 0, 1, 2 and 4, §3A.1–§3A.3) resolve. #856 and #966 are still open at their previous heads.
- **ReductiveGroups on main.** It changed (002b1438). The cited anchors for Layers 0, 1, 6 and 7 still match, and §10A and §10B are now at lines 5305 and 5378. The diff only adds text, and none of it fulfils a declared gap.
- **Gate.** `gate … ClassicalGroupsPartII --base origin/main`: every counter is 0, the result is `OK`, exit 0.
- **Dependency check.** `depcheck: 246 roadmaps, 2235 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line. In the merge order, ArithmeticGaloisRepresentations is at 58, PELModuli at 117 and ClassicalGroupsPartII at 205.
- **Elaboration.** `lake env lean TauCetiRoadmap/ClassicalGroupsPartII/Suggested.lean` exits 0. The only warnings are `declaration uses sorry` at lines 109, 130 and 136.
- **Sample and sources.** The folder is unchanged since a8badcd, so the seeded sample (“Consequences to check”, “Construction and proof”) falls on no changed passage. The previous verification of `yu`, `milne` and `sternberg` stands.

Overlap check: read ReductiveGroups, ClassicalGroups and FlagVarieties (main) and ReductiveGroupsPartIII, ShimuraData and LieHighestWeightPartII (open). The split highest-weight theory is owned by ReductiveGroups §10A–10B and the complex Sp₂g exterior blocks by ClassicalGroups §3A; both are cited here. Nothing else is shared.

Source independence: changed passages only. The diff since a8badcd changes no passage, so 0 passages were compared, and the arrangement was not compared again because no layer moved. The largest share is `yu`, 25 of 40 linked source locators.

## Not verifiable

- The description was judged from the worker's quoted copy. The merge of #1192 was read from main's history, and the open state of #856 and #966 from the roadmap index, not from the pull-request pages.
- The source texts were not re-read, because no source locator changed.

## Source issues

- none

## For the human reviewers

- none
