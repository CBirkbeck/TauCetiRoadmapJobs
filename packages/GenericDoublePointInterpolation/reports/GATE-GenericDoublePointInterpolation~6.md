## H01 (CBirkbeck) — answered

The duplicate is confirmed at ArithmeticStatisticsPartV head `7f06cfc`: the interpolation target at `TauCetiRoadmap/ArithmeticStatisticsPartV/README.md` lines 1825–1832, the `FieldStatistics.doublePointInterpolation` entry in its *Needs* line 1837, and the same name listed under §3.28 in its `Suggested.lean` docstring (line 614). Removing it takes a commit on that roadmap's branch, outside the files of this branch, so the finding stays open until that commit lands. To make the replacement one citation covering the whole nonexceptional d≥2 contract, this branch now states that contract as a single target, "Double-point theorem in every degree", at `TauCetiRoadmap/GenericDoublePointInterpolation/README.md` lines 1495–1527, with headline `alexanderHirschowitzRank` at `Suggested.lean` lines 249–258 (r≥1, every d and q, excluding d=2 with 2≤q≤r and (r,d,q)=(2,4,5),(3,4,9),(4,3,7),(4,4,14)). Scope (lines 51–53) and Downstream consumers (lines 1688–1693) now cite this target. The old case list there, which ended with an uncited "deletion and enlargement" sentence for quartics in P³ and P⁴, is gone: those counts are now proved in the target's proof sketch (lines 1504–1514).

## H02 (CBirkbeck) — answered

The omission is real, and it goes beyond GroebnerGeometry. Following the supplier pull requests' own merge orders, this pull request waits on five open new-roadmap pull requests by other authors: #899 (GroebnerGeometry, kim-em), required by #1199 and by #853, whose `TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/README.md` line 722 at `0b84954` needs G2 and G4; #1103 (PurityOfBranchLocus, tdupu) and #1104 (AbhyankarLemma, tdupu), through #857; and #446 (CFSGBasicProperties, kim-em) and #447 (ChevalleyGroups, kim-em), through #785. So the sentence "It depends on no other author's open pull request" is false. The repair belongs in the pull-request description, which this job does not edit; the corrected text is below. The README needs no change: the *Needs* lines of the consumed AlgebraicModuliForArithmeticGeometry sections (§§1.1–1.2, 1.7, 2.1) cite neither §1.5 nor GroebnerGeometry, and the README names none of the five roadmaps.

## H03 (CBirkbeck) — answered

The remark that §4.3 is a substantial owned proof obligation matches the text. README lines 1331–1336 say that its prime-existence property is a separate interpolation target, not a consequence of a determinantal-locus or properness theorem. Both differential contradictions (lines 1380 and 1396) take compatible bad-incidence specialization as an explicit hypothesis. Nothing changed for this point.

## Edits needed outside this branch

These are for the operator; this job did not make them.

1. ArithmeticStatisticsPartV §3.28:
   - Replace the interpolation target (README lines 1825–1832 at `7f06cfc`) with a citation of GenericDoublePointInterpolation §4.8, "Double-point theorem in every degree". Take its R homogeneous variables as R=r+1, and pass through the homogeneous-partial adapter of §1.4, "Homogeneous partials and affine first jets".
   - Replace `FieldStatistics.doublePointInterpolation` in the *Needs* line 1837 with that same citation, and drop the name from the §3.28 list in its `Suggested.lean` docstring.
   - Keep the mixed-trace Jacobian, minor selection, arithmetic exception exclusion and finite-fibre target in ArithmeticStatisticsPartV.
   - Its exception list (d=2 with 2≤n≤r−1; (d,r,n)=(3,5,7); d=4 with (r,n)=(3,5),(4,9),(5,14)) is exactly ours under r ↦ r+1.
   - The direction is legal: this roadmap is line 36 of the merge order and ArithmeticStatisticsPartV is line 127.
2. Pull-request description, merge-order block:

   > #1199 (ResolutionOfSingularitiesCharacteristicZero) → #820 (DiamondsAndVStacks) → #816 (PerfectoidTowers) → #940 (PadicPeriodRings) → #868 (DerivedDeRhamCohomology) → #857 (CrystallineCohomology) → #785 (ReductiveGroupsPartII) → #853 (AlgebraicModuliForArithmeticGeometry) → **this pull request** (#1472). Through those pull requests it also depends on other authors' pull requests that add roadmaps they cite, which must merge first: #899 (GroebnerGeometry, kim-em) before #1199 and #853; #1103 (PurityOfBranchLocus, tdupu) and #1104 (AbhyankarLemma, tdupu) before #857; #446 (CFSGBasicProperties, kim-em) and #447 (ChevalleyGroups, kim-em) before #785. Roadmaps already on main are not listed.

   The dependency paragraph needs the same five additions.

## Ownership and citations

This roadmap owns the double-point theorem in every degree. Its one competing statement, ArithmeticStatisticsPartV §3.28, is a consumer placed later in the merge order. Search scope: main and the 367 open roadmap pull requests (index of 2026-10-26T08:51:08Z), for Alexander–Hirschowitz, Horace, double-point interpolation and `doublePoint`. The other hits are unrelated square-zero examples (ComplexComparisonPartII, AlgebraicModuliForArithmeticGeometry, LefschetzPencilsAndVanishingCycles, and AdicSpacesPartIII on main) and EffectiveBoundsPartII, which consumes this roadmap. The new name `alexanderHirschowitzRank` occurs in no roadmap on main and in no open pull request. All heads named above were current when checked: #1175 `7f06cfc`, #853 `0b84954`, #899 `163d43c`, this branch before the edit `d1d487c`. None of #899, #1103, #1104, #446 or #447 is on main.

Supplier names were re-checked as follows:
- on main `b38eddd`: DiophantineApproximationAndTranscendence §2.7 `blockHomogenize`; SchemeAndStackFoundations §0.28 `quotientPresheaf`, `quotientToClosedNatTrans_isIso`, `allOpenSheafComparison`, §2.6 `projectiveSpace_cohomology`, §4.12 `generic_flatness`, §5.12 `bezout_inequality`; AlgebraicVectorBundles §L0B;
- at `0b84954`: AlgebraicModuliForArithmeticGeometry §§1.1–1.2, 1.7 and 2.1 (`ProjectiveBundles.projectiveBundle`, `integerTwists`, `projectiveSpaceCechComparison`, `rankLocus`, `hilbertFunctorAsQuot`).

The pinned Mathlib (`6b7abb3`) and Tau Ceti (`a91d3aa`) trees contain no `.lean` file mentioning Hirschowitz or Horace. The only source used was BO line 22, Theorem 1.1, with its exception list at BO lines 33–38, which the new exclusions match in (r,d,q) order. No source was fetched, quoted or found missing, and the source manifest is unchanged.

## Elaborated signatures

All 30 declarations were put as `#check @name` in one scratch file and elaborated once (exit 0, no errors). The 29 existing types are unchanged; the diff against the pre-edit run differs only in name qualification. `alexanderHirschowitzRank` elaborates with `[Field k] [CharZero k]`, `1 ≤ r`, `¬(d = 2 ∧ 2 ≤ q ∧ q ≤ r)`, `(r, d, q) ∉ [(2,4,5), (3,4,9), (4,3,7), (4,4,14)]` and the conclusion: there is an injective `P` with `(firstJetMatrix P d).rank = min ((r+d).choose d) (q*(r+1))`. This is the README statement at lines 1495–1502. The file has no `variable` block, so no binder can be lost. The module docstring (lines 10–13) now names the new headline.

## Adversarial mathematics pass

The ranks below are the maxima over three random integer configurations (coordinates in [−50,50)) of the first-jet matrix rank modulo 1000003. Such a rank is a lower bound for the rational rank, and min(N,q(r+1)) is the upper bound.

| Statement | Instances and computed values | Result; change |
| --- | --- | --- |
| `alexanderHirschowitzRank`, nonexcluded quadrics | (2,2,3): 6=min(6,9); (3,2,4): 10=min(10,16); (5,2,6): 21=min(21,36); (1,2,2): 3=min(3,4), not excluded because 2≤q≤1 is empty | Agrees; new target |
| Quadric exclusion is necessary | (2,2,2): 5<6; (5,2,5): 20<21, equal to the quadric formula 21−choose(2,2) | Exclusion kept |
| Four exceptional triples are necessary | (2,4,5): 14<15; (3,4,9): 34<35 (square of the quadric through 9 points); (4,3,7): 34<35 (secant cubic of the rational normal quartic); (4,4,14): 69<70. Rank is lower semicontinuous, so no configuration reaches min | Exclusions kept; Checks added |
| Neighbors of the exceptions | (2,4,4): 12; (2,4,6): 15; (3,4,8): 32; (3,4,10): 35; (4,3,6): 30; (4,3,8): 35; (4,4,13): 65; (4,4,15): 70, each equal to min | Agrees; subset and superset sketch |
| d≤1 and q=0 | (3,0,2): 1=min(1,8); (3,1,1): 4=min(4,4); (3,1,3): 4=min(4,12); (1,0,0): 0 | Agrees; d≥1 needed only for the homogeneous-partial form, as recorded in a Check |
| r=0 | r=0,q=2: no injective Fin 2 → Fin 0 → k | `1 ≤ r` kept |
| Downstream R=r+1 translation | (R,d,n)=(3,5,6) ↔ (2,5,6): 18=min(21,18); (3,2,2) ↔ (2,2,2): 5; ArithmeticStatisticsPartV's (3,5,7),(3,5),(4,9),(5,14) ↔ (4,3,7),(2,4,5),(3,4,9),(4,4,14) | Agrees; text now cites §4.8 |
| Generality | README "r≥1, every d,q, every characteristic-zero field" matches the Lean `(r d q : ℕ)`, `1 ≤ r`, `[Field k] [CharZero k]` | Agrees |

## Build and gates

`lake build TauCetiRoadmap.GenericDoublePointInterpolation.Suggested` exited 0 with `Build completed successfully (8976 jobs).` There are 17 warnings, each "declaration uses `sorry`", one per theorem, and no errors.

Gate at the committed head `5cd46bd` (exit 0). Before the commit, the same run differed only in `dirty=2`, for the two uncommitted edited files:

```text
gate GenericDoublePointInterpolation: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```

Dependency direction with `--movable` (exit 0), with no UPWARD, CYCLE or moved line:

```text
depcheck: 55 roadmaps, 638 edges, 0 problem(s)
```

Policy greps on both files: `set_option` 0, imports only `import Mathlib`, `lemma` 0, `#eval`/`#print`/`#synth` 0, sorry'd data 0, pull-request references 0, LaTeX delimiters 0, process words 0.
