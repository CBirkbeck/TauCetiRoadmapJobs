# Review of PurityForFlatCohomology (pull request #1840 at 160e354)

**Verdict:** needs changes

Incremental re-review of the 9 lines of `TauCetiRoadmap/PurityForFlatCohomology/README.md` changed since d3f15fd, and the first check of the pull request's title and description against the head. The folder's change is sound; the one finding is in the description.

## R01 (P3) — The description's list of what `Suggested.lean` states stops at seven of its fifteen theorems

**Location:** pull request description, second paragraph: "`Suggested.lean` states Zariski–Nagata purity in virtual dimension `≥ 2` and `≥ 3`, Gabber's local Picard conjecture, … Katz's theorem on Frobenius-fixed vectors, Auslander's freeness criterion and the factoriality of regular local rings".

**Claim:** The sentence was written for the first commit. The head also states Gabber's étale-depth bound, the Picard groups of global complete intersections, torsion purity of `H²(−, 𝔾_m)`, Česnavičius's Brauer purity (local and global) and purity for tori: a reader concludes these are unstated.

**Witness:** `TauCetiRoadmap/PurityForFlatCohomology/Suggested.lean` lines 241, 320, 336, 378, 394, 421, 436, 450 (`etaleDepth_ge_virtualDimension`, `picard_globalCompleteIntersection_*`, `etaleCohomology_two_gm_torsion_purity`, `etaleCohomology_two_gm_puncturedSpectrum_subsingleton`, `etaleCohomology_torus_*`, `etaleCohomology_gm_purity_regular`); README lines 47–69 list all fifteen.

**Repair:** Replace the sentence by: "`Suggested.lean` states Zariski–Nagata purity in virtual dimension `≥ 2` and `≥ 3`, Gabber's étale-depth bound for commutative finite étale coefficients, Gabber's local Picard conjecture, the vanishing of the local Picard group of a regular local ring, the Picard groups of global complete intersections, purity for the torsion of `H²(−, 𝔾_m)`, Česnavičius's purity for the Brauer group of a punctured strictly henselian regular local ring and of regular schemes, his purity for tori (punctured henselian regular local rings with residue field of dimension at most one; regular closed subsets of codimension `≥ 2`), and three classical inputs: Katz's theorem on Frobenius-fixed vectors, Auslander's freeness criterion and the factoriality of regular local rings; its docstring names, for each flat-cohomological headline, the carrier the pinned libraries lack."

## Previous findings

- The review of d3f15fd had no finding; nothing to account for.

## Verified sound

| # | Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|---|
| 1 | §5.7, structure of `Spec ∏ V_i` (reworded, lines 1855–1859) against CS24 Lemma 2.2.4 | `I = ∅`; `I` a singleton; `I` infinite; fraction fields not algebraically closed | zero ring, empty spectrum, no component; only the principal ultrafilter, `∏_𝒰 V = V`, one component `Spec V`, quasi-compact opens `Spec V_𝔭` strictly henselian; components indexed by `βI`, fibre over `𝒰` is `Spec ∏_𝒰 V_i` (CS24 lines 780–789); second clause not claimed | same three clauses and hypotheses as CS24 lines 774–777; "admits only split étale covers" = "no nonsplit étale covers" | none |
| 2 | §5.7 main statement (untouched, cites the passage) | `I` singleton, `A = 𝒪_C`, `a = p` | `Spec 𝒪_C[1/p] = Spec C`, a quasi-compact open with one component, valuation ring `C`; `H^j(C, G) = 0`, `j ≥ 1`, as the first Check says | consistent with row 1 | none |

The rows of the review of d3f15fd for untouched statements stand as in that review.

- Source locators checked against the text: 1 (CS24 Lemma 2.2.4, statement CS24 lines 774–777 on printed page 19, proof lines 780–797 on page 20; "pp. 19–20" is right).
- Dependents of the changed passage read: §5.8 (line 1914), §5.9 (lines 1927–1932), which use only the main statement of §5.7; the `*Needs:*` line of §5.7 is unchanged and the change adds no name, supplier or section number.
- Seeded sample: none of the fifteen targets (1.6, 1.8, 3.4, 4.2, 4.3, 4.4, 5.1, 5.3, 7.1, 7.4, 7.5, 7.9, 8.4, 8.7, 8.16) lies in or cites the changed passage; the README flags no locator as unverified.
- Gate rerun at 160e354: every counter 0, `OK`; the worker's `gate.md` shows `build=0`. Dependency check: `depcheck: 246 roadmaps, 2235 edges, 0 problem(s)`, no UPWARD, CYCLE or `moved:` line.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with 15 warnings, all ``declaration uses `sorry` ``, 0 errors. `git diff d3f15fd 160e354` touches only `README.md`, so signatures (25 declarations) and the one-tactic probe stand as recorded.
- Outside-folder diff against `origin/main`: empty. `overlaps.md`: no other open pull request changes the roadmap, no cited id dropped, none defined only by an open revision.
- Description, other sentences checked against the head: the title (the pull request adds the folder: 3 files, 0 deletions); `i < dim R` and `i ≤ dim R` for regular non-fields (§§6.2, 6.5); "no excellence or normality" (§1.8, line 1257); "over arbitrary rings" (§§0.4, 0.5: no Noetherian hypothesis); the two consumers named (Downstream consumers, lines 3467–3473); `zariskiNagata_isEquivalence`, `localPicard_torsion_eq_one` declared (lines 172, 275); imports from PrismaticCohomologyPartII and PartIII (supplier contracts, lines 660, 734); the suppliers not in the open-pull-request list are on main (SchemeAndStackFoundations, LocalPurity, ModularCurves, EtaleCohomologyFoundations, DerivedModuleAlgebra, EnhancedDerivedSheaves, PerfectoidSpaces). All agree.
- Overlap check: read SchemeAndStackFoundationsPartII, LocalPurity, SchemeAndStackFoundations (scopes as in the previous reviews; the change adds no owned object); nothing newly shared.
- Source independence: changed passages only; 1 passage compared with 1 source (CS24 lines 774–777), longest shared run 4 words ("algebraically closed fraction field(s)", a forced term); largest share CS24, unchanged; no layer added, removed or reordered, so the arrangement was not compared again.

## Not verifiable

- Nothing in the changed passage. As before: SGA3 VIII–X (§§7.12a–7.12e), Aus62 Theorem 1.3 (§7.2), DF84 Remark 3 (§8.18), Avr77 Proposition 3.6 (§1.2) are uncertified and were read only through their uses in CS24 and C19.

## Source issues

- none

## For the human reviewers

- none
