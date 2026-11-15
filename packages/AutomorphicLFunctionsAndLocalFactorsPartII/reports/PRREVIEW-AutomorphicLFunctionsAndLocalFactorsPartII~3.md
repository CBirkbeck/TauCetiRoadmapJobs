# Review of AutomorphicLFunctionsAndLocalFactorsPartII (pull request #1756 at 065d15c)

**Verdict:** accepted

Incremental re-review of the 2 lines changed since e331779 (the `*Needs:*` line of §5.0), and a check of the pull request's title and description against this head. No finding.

## Previous findings

- R01 — repaired: `TauCetiRoadmap/AutomorphicLFunctionsAndLocalFactorsPartII/README.md:827` now reads "SR.0.4 (admissible duality), SR.2.2 (induced contragredients and geometric lemma) and SR.3.1 (cuspidal support and embedding)"; SR.2.3 is gone and each label matches its section on main.

## Verified sound

| Statement | Instances tried | Values on the two sides | Result | Change |
| --- | --- | --- | --- | --- |
| §5.0 *Needs:* line (changed) | each cited id opened in SmoothRepresentationsOfLocalGroups on main | SR.0.4 heading at line 869 (admissibility, duals); SR.2.2 at 2045, holding *induced-contragredient* (2157) and *geometric-lemma* (2175); SR.3.1 at 2571, holding *cuspidal-support* (2639) | Pass | None |
| §5.0 quotient statement (cited by the changed line) | Sp₂=SL₂ over ℚ₃, σ=ν on GL₁, tail Sp₀, π=Steinberg | π is the subrepresentation of i_B(ν), not a quotient; π̃≅π embeds in i_B(wσ̃)=i_B(ν) with w≠1; dualizing gives π as quotient of i_B(ν⁻¹), and χ_π⊗σ∨=ν⁻¹ with χ_π=1 | Pass | None |
| §5.0 route inputs against the line | the three steps of the written route | exact dual and biduality: SR.0.4; (i_P σ)~≅i_P σ̃: SR.2.2; embedding into i_P(wσ): SR.3.1; no step uses a pairing or Whittaker statement of SR.2.3 | Pass | None |

The rows of the previous review, of `e331779`, stand for every untouched statement.

- Source locators re-read for §5.0 (the one seeded target in the changed passage): 2. CFK line 271 (p.7: C^• trivial outside GSpin, outer involution, two Siegel parabolics) and CFK lines 1824–1828 (Corollary 4.11 proof, p.42) support the uses made of them. The other seeded targets lie in untouched text.
- Cross-roadmap citations resolved: 3 (SR.0.4, SR.2.2, SR.3.1), on main at 2248bbb, where SmoothRepresentationsOfLocalGroups now is. No other passage of the README is made wrong by the change: the supplier contract (line 63) and the other `*Needs:*` lines cite SR.2.1–SR.2.3 with the label "induction, Jacquet functors, geometric lemma and pairings", which matches the headings.
- Gate rerun on this head: every check 0, `OK`, exit 0; the worker's run includes `build=0`. Diff outside the roadmap folder against `origin/main`: empty. Worktree clean at 065d15c5e89819813f2eb159b6888ca3e2438d26.
- Dependency check: `depcheck: 244 roadmaps, 2230 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line.
- Elaboration: `lake env lean` on `TauCetiRoadmap/AutomorphicLFunctionsAndLocalFactorsPartII/Suggested.lean` exits 0 with no output. The file is unchanged and declares no name (its docstring names seventeen headline groups as not statable at the pins), so there is no `#check @name` inventory and nothing to probe for padding.
- Pull request text against the head. Title: adds a roadmap; the folder is not on `origin/main` (1882 insertions, 0 deletions, 105 headings added, none removed). Summary block and prose checked sentence by sentence against the README: right-action normalization and arbitrary inducing characters (Summary, §2.0, contract lines 97–99); split-algebra character missed by splitting characters (line 368); residue characteristics 2 and 3 (Conventions); rank zero (line 157); SO₂/GSpin₂ through GL₁×GL_k products (§§6.11, 9.5); GSpin from even elements of `lipschitzGroup` (Tau Ceti contract); fixed ramified twist (§10.3); no global endoscopic transfer (line 19). "4 independent review rounds and 2 red-team rounds" agrees with the board's report files (four package reviews, red-team rounds 1 and 2). No sentence is contradicted, and the change since e331779 alters nothing the text describes.
- Remark, no change asked: the description's sentence that the Lean "states only real-bodied definitions and theorems statable against the pinned Mathlib and Tau Ceti" holds with an empty set; the file states no declaration, as its docstring explains.
- Overlap check: read GanGrossPrasadUnitaryGroups, TwistedAutomorphicDescents, ExceptionalThetaCorrespondencesForG2 (open, scope sections), AutomorphicSpectralTheory and AutomorphicLFunctionsAndLocalFactors (as cited suppliers), SmoothRepresentationsOfLocalGroups (main); nothing shared. A search of every open head and main for generalized doubling, (k,c) models and the Garrett pullback finds no second owner. `scratch/overlaps.md` lists no dropped id, no competing pull request and no second copy.
- Source independence: 1 passage compared (the changed `*Needs:*` line, changed passages only) with 1 source (CFK at lines 271 and 1824), no wording shared; largest share CFK, as in the previous review; arrangement not compared again, since the diff adds, removes and reorders no layer.

## Not verifiable

- CFK22, KAP23, YAM14: settled as uncertified; not touched by the change.

## Source issues

- none

## For the human reviewers

- none
