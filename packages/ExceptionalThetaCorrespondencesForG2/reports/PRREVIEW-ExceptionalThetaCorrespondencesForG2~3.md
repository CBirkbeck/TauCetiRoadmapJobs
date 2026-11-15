# Review of ExceptionalThetaCorrespondencesForG2 (pull request #1736 at 496ccde)

**Verdict:** needs changes

Incremental re-review of the 6 lines changed since ce943ae (README lines 587, 593 and 692), the two findings of the previous report, the gate, the elaboration, and the pull request's title and description read against this head. Both previous findings are repaired and the folder needs no change. One finding remains, in the description.

## R01 (P3) — The description says the Lean states definitions and theorems and that the build warns of `sorry`; the file declares nothing

**Location:** pull request description, “the Lean states only real-bodied definitions and theorems statable against the pinned Mathlib and Tau Ceti”, and under Validation, “the targeted Lake build succeeds with `sorry` as the only warning”.

**Claim:** `Suggested.lean` states definitions and headline theorems, each admitted with `sorry`.

**Witness:** `TauCetiRoadmap/ExceptionalThetaCorrespondencesForG2/Suggested.lean` (41 lines) is a module docstring and an empty namespace: 0 declarations, 0 `sorry`. Its line 9 says no headline theorem is statable at the pins. Elaboration prints no warning.

**Repair:** Replace the first sentence by “`Suggested.lean` states no declaration: no headline theorem is statable at the pinned Mathlib and Tau Ceti, and its module docstring names the missing carriers for each; every target is in the README.” Replace the second by “the targeted Lake build succeeds with no warning (the file has no declaration and no `sorry`)”.

## Previous findings

- R01 — repaired: line 587 now reads “This isomorphism is a construction of this roadmap, not taken from a source; GS supplies only the H₃(B) model and its split specialization B=M₂(F) (GS, §4.1, p. 15 (GS lines 542–543))”; the Check at line 593 cites the same two lines.
- R02 — repaired: line 692 now reads “for J=M₃⁺ the connected partner is PGL₃; for J=H₃(M₂(F)) it is split PGSp₆.”

Neither repair introduced a new problem.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| §2.2 proof route, line 587: GS locator for the H₃(B) model | GS lines 542–543 on printed p. 15, inside §4.1 (heading at GS line 525; §4.2 starts at line 547) | Source: dimension-15 J is H₃(B_F), split case B_F=M₂(F). README claims exactly these two facts of GS and no more | agrees | none |
| §2.2 proof route: U₃(B,h)/μ₂ → Aut(H₃(B)), now the roadmap's own construction | B=ℍ over ℝ; B=M₂(ℝ); kernel of g·x=gxg* | dim H₃(B)=3+3·4=15; dim U₃=21 both; centre {±1}; B=ℍ: Sp(3)/±1 compact, rank 0; B=M₂: Sp₆/μ₂=PGSp₆, rank 3 | agrees with Check line 593 | none |
| §2.2 Check, line 593 | same two real forms against GS line 580 | GS table: H_J=PGSp₆ only for J=H₃(M₂(F)); Check: split PGSp₆ for B=M₂(ℝ), PSp(3) for ℍ; both dimension 21 | agrees | none |
| Layer 2 Examples, line 692 | dim J=1,3,9,15; partner for M₃⁺ and H₃(M₂(F)); negative control B=ℍ | 8+dim Lie(M_J)+6·dim J: 8+0+6=14; 8+2+18=28; 8+16+54=78; 8+35+90=133. Partners PGL₃ (dim 8), split PGSp₆ (dim 21); sentence no longer covers B=ℍ | agrees with GS lines 533–534, 580 | none |
| Description summary block against the README | Summary line 3; §1.13 line 526; §6 line 1020; §10 lines 1612–1655; Downstream consumers line 1742 | p≠3 only for universal division nonvanishing: both; nongeneric τ_ρ via Gan–Takeda Plancherel, Shahidi not applied: both; number fields k in Layer 10: both; consumer LocalLanglandsCorrespondenceForG2: both | agrees | none |

The rows for the untouched statements stand as in the previous review, of ce943ae.

- Source locators checked against the text: 2 (GS lines 542–543 and GS line 580), both on the cited pages.
- Library declarations opened at the pin: `TauCeti.Algebra.exists_isSplittingField_finrank_eq_deg` and `TauCeti.Algebra.isSplittingField_of_finrank_eq_deg`, TauCeti/Algebra/CentralSimple/MaximalSubfield.lean lines 135 and 142; the citation lead that reported the first as found nowhere is a false positive.
- Cross-roadmap citations resolved on the changed passages' *Needs:* line: ReductiveGroups, QuadraticFormInvariants (Layer 7B, its README line 71) and ClassFieldTheory are on main; no citation was added or changed by the diff.
- Dependency check: `depcheck: 239 roadmaps, 2256 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line.
- Gate at 496ccde: every check 0, build OK. Elaboration of `Suggested.lean`: no output (no error, no warning; the file has no declaration, so the `#check` comparison and the one-tactic probe have nothing to act on).
- Files changed outside the folder: none. No Lean statement, heading, layer or supplier changed since ce943ae.
- Overlap check: read AutomorphicLFunctionsAndLocalFactorsPartII, MetaplecticAutomorphicForms, TwistedAutomorphicDescents, GanGrossPrasadUnitaryGroups, ModularityAndLanglandsExtensions, SmoothRepresentationsOfLocalGroups, LieHighestWeight as listed for this head (no dropped id, no second copy, no conflicting head); the changed passages introduce no shared object; ownership as settled in the review of ce943ae.
- Source independence: 3 passages compared with 1 source (GS), changed passages only, none shared (longest shared run 3 words, a formula); largest share GS, as in the previous review; contents not compared again, since the diff adds, removes or reorders no layer.

## Not verifiable

- HPS, GS05 (waived) and Var (uncertified): the diff does not touch the targets that cite them.
- The automorphism group of H₃(B) for non-split B: no source is cited for it now (by design); it was checked by direct computation of the action, its kernel and its real forms.
- The description's sentence on AI assistance (rounds of review on the job board) describes the process, not the head, and was not checked.

## Source issues

- none

## For the human reviewers

- none
