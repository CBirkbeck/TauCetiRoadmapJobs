# Review of EllipticCurveModularityWild3Adic (pull request #1484 at 690b059)

**Verdict:** accepted

Incremental re-review of 2 changed lines since 6fcc253, plus the check of the pull request's title and description against this head. No finding.

## Previous findings

- R01 — repaired: the description's summary block now reads "The argument follows BCDT, with Conrad–Diamond–Taylor for conductors not divisible by 27 and the switch at 5." The repair introduced no new problem.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result; change |
|---|---|---|---|
| Scope list, item 5 (`README.md:15`, the changed line) against §6.9 (`README.md:1314`) and the description | `N = 11`, `99`, `27`, `243` | `gcd(N, 27) = 1, 9, 27, 27`; `27 ∣ N`: no, no, yes, yes. Scope list, §6.9 and description all admit `11` and `99`, exclude `27` and `243` | Pass; the three now agree |
| §6.9 against its source | CDT line 57 (the theorem of the introduction) | Source hypothesis: conductor not divisible by 27. README, all seven occurrences (lines 3, 15, 1209, 1257, 1314, 1328, 1364): "not divisible by 27"; "prime to 27" occurs 0 times in the folder | Pass |

The rows for all untouched statements stand as in the previous review, of `6fcc253`.

- Gate, run again on this head: every count 0, `OK`; the worker's record adds `build=0`. Dependency check: `depcheck: 245 roadmaps, 2241 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line.
- Elaboration of `TauCetiRoadmap/EllipticCurveModularityWild3Adic/Suggested.lean`: exit 0, ten `declaration uses 'sorry'` warnings (lines 40, 57, 65, 73, 79, 85, 102, 112, 123, 142) and nothing else. The file is unchanged since `6fcc253`, so the `#check` comparison and the one-tactic probe of the earlier rounds stand.
- The diff since `6fcc253` changes one sentence of `README.md` (line 15) and nothing else in the folder: no statement, locator, `*Needs:*` line, Check, supplier citation or heading. Against `origin/main` the pull request changes no path outside the folder (the gate's `outside-folder=0`; the paths listed with the change set come from the merge of main into the branch).
- Source locators checked against the text: 1 (CDT line 57). None of the fifteen sampled targets lies in the changed sentence, which only names 6.1 and 6.3 in a list.
- Pull request text against the head. Title: adds a roadmap (1563 insertions, 0 deletions; 73 headings and 16 Lean declarations added, none removed). Description: `ellipticCurve_modular` (`Suggested.lean:142`); "six normal forms" (§§1.9–1.10); "four wild types and three conductor-243 extended types" (§§0.3–0.8); "any characteristic-zero field" (§1.15; `equivariantIcosahedralLift`, `[Field K] [CharZero K]`); "matrix Hilbert 90 over any field" (`matrixHilbert90`, `[Field K]` only); "only that roadmap's conditional comparison layers" (R29.3–R29.6, `README.md:17`); the folder's three files; the validation line (gate and elaboration above). The sixteen roadmaps of the generated `depends-on` block are the sixteen open suppliers the README names under *From TauCetiRoadmap suppliers*. No sentence is contradicted by the head, and the head makes no change the text leaves unstated.
- Cross-roadmap citations: the citation service lists none unresolved; its one Lean-name lead, `BarsottiTate.extend_genericFibre` (`README.md:90`), is a target of FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.1.22, as before. The changed sentence cites no other roadmap.
- Overlap check: read FiniteFlatGroupsAndIntegralPadicHodgeTheory, GL2ModularityLifting, EllipticCurveModularityTotallyReal, PadicLocalLanglandsForGL2Qp, ClassicalSerreModularity, PadicExtensionFamilies, LocalFieldsRamification, RamificationOfCompleteDiscretelyValuedFields at the previous review; nothing shared, and the changed sentence claims no new object.

Source independence: 1 passage compared with 1 source (changed passages only: `README.md:15` against CDT line 57), none shared beyond the mathematically forced hypothesis; largest share BCDT, 65 of about 90 locators; contents not compared again, since the diff adds, removes and reorders no layer.

## Not verifiable

- The description's "AI assistance" sentence (the counts of review and red-team rounds on the job board): the board's history is not among the materials of this review.
- Serre, Corps locaux, and BBM §4.2.14: settled as waived and uncertified; cited by untouched text only, not reread.

## Source issues

- none

## For the human reviewers

- none
