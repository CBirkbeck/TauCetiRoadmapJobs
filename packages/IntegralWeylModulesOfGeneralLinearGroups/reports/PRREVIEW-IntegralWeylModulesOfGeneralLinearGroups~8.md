# Review of IntegralWeylModulesOfGeneralLinearGroups (pull request #2888 at 4b745e9)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/IntegralWeylModulesOfGeneralLinearGroups/`
**Verdict:** accepted

**Summary.** Accepted. The small correction of the previous review is repaired: the ownership paragraph now says about the closed alcove what the route of 0.2 says. The reference to the formal proof now names the repository's first commit, and the files the README cites are there, with the statements I opened unchanged. There is one small correction (a sentence of the description that the family index no longer has) and no format note; scope and licence are left to the human reviewers.

## C01 — The description still says the family "follows the formal Lean proof", which the family index at this head no longer says

The description's first paragraph reads "The family follows the formal Lean proof of these theorems by Levent Alpöge (announced 20 November 2026)". The family index (`TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/README.md`, lines 10–12) was reworded at this head to "The results that the family states are those of the formal Lean proof", so the description now describes the family in words its own index dropped, and a reader takes the roadmaps to be arranged after the proof.

The index's sentence would do in the description: "The results that the family states are those of the formal Lean proof of these theorems by Levent Alpöge (announced 20 November 2026)". The description's "at a named commit" could also name it: the first commit of the proof's repository, with paths relative to `src/`.

## Previous findings

- C01 (ownership paragraph and the closed-alcove form of 0.2) — repaired: "the closed-alcove form of the three equalities is not a target of this roadmap; the simplicity of `∇_k(λ)` over a field `k` of characteristic `p` on the closed alcove is recorded in the route of 0.2 with its locator".

The previous report had no finding (R).

## Verified sound

| Statement | Instances | Values computed on each side | Result |
|---|---|---|---|
| Ownership sentence (line 394) against the route of 0.2 (line 109): simplicity of `∇_k(λ)` when `λ_i − λ_j + (j − i) ≤ p` for `i < j` | `GL_2`, `p = 3`: `λ = (2,0)`, `(3,0)`; `GL_3`, `p = 3`: `(1,0,0)`; `GL_3`, `p = 2`: `(1,0,0)` | `(2,0)`: `3 ≤ 3`, `Sym²k²` simple; `(3,0)`: `4 > 3`, excluded, `⟨x³, y³⟩` stable; `(1,0,0)`, `p = 3`: `3 ≤ 3`, `k³` simple; `p = 2`: `3 > 2`, excluded though simple (sufficient only, as stated) | the two passages agree; one direction only is claimed |
| The same sentence against its locator at the commit now named | `InducedSimpleLowestAlcove` in the file the route names, read at `40e56ba…` under `src/` | source: `p` prime, `CharP k p`, `lam.w i − lam.w j + (j − i) ≤ p` for `i < j`; conclusion `nablaSq ≠ ⊥` and every `GL`-stable submodule is `⊥` or all | matches the README |
| 0.2, first route sentence (`e = 0` below the wall) against its locator at the commit now named | `ExIntervalLt` in `Formalism/PieriBlockIdeals/StatementE.lean` at `40e56ba…`; `N = 2`, `p = 3`, `λ = (1,0)` | source: values in `[lo, lo + w]` give `ex ≤ C(N,2)·log_l w`, and `ex = 0` when `w < l`; instance `w = 2 < 3`, `⌊log_3 2⌋ = 0` | matches |
| Reference entry `[FormalProof]`: "the first commit of that repository", "paths relative to its directory `src/`" | commit `40e56bab…`; 7 of the README's 36 cited files | the commit has no parent (dated 20 November 2026); the 7 files exist at `src/<path>` there, with the namespaces the README's statement names carry (`Formalism.L2.DIV`, `Formalism.BasicNotions`, `Formalism.HN`, `Formalism.CohomologicalDescent.E`, `GlobalTheory.Published`) | true |

The rows of the previous reviews, of `a356b2a` and before, stand for the statements this change does not touch; no Lean statement changed.

- Source locators checked against the text, 7 files at the first commit (the two of 0.2 with their statements, and `CoefMod.lean`, `StatementLD.lean`, `DataCoeff.lean`, `StatementPl.lean`, `BranchSandwichDivisors/StatementR.lean` for existence and namespace); between the commit named before (`e50d098…`) and the first commit, the one file under `src/` in the part of the comparison I could read is `src/Challenge.lean`, which the README does not cite.
- Cross-roadmap citations in the changed passages: PotentialAutomorphyInfrastructure §§0.4, 0.6, unchanged since the previous review, which resolved them on main.
- Automatic checks: all passed. Dependency check: `depcheck: 133 roadmaps, 1477 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `Suggested.lean` gives 9 `sorry` warnings and nothing else; the file is unchanged since `a356b2a`.
- Outside the folder the pull request changes only the family index, which the family carries in every pull request. Since `a356b2a` its README changed in three places: the sentence of C01, the statement that files are looked up at the first commit under `src/`, and the entry of BernoulliBoundsForClassGroupEigenspaces (not this roadmap's; its entry for this roadmap, lines 175–179, is unchanged and agrees with 0.2).
- The pull request's description read against the head: C01; nothing else is contradicted, and the change adds, removes or renumbers no section, target, declaration or supplier.

Overlap check: read PotentialAutomorphyInfrastructure §§0.4–0.6 as cited; the change adds no object, so the scope of ClassicalGroups, SchurWeyl and TensorProductCombinatorics on main and of LocalGainOfThetaChains, ThetaChainsOnDefiniteUnitaryGroups and CongruenceModulesOfThetaLifts at their open heads stands as read in the previous reviews; the closed-alcove simplicity over the residue field of a `p`-adic ring of integers is PotentialAutomorphyInfrastructure §0.4 and is cited; nothing else shared.

Source independence: changed passages only; 2 passages compared with 1 source (the formal proof's Lean source, which has no prose), no wording shared; largest share FormalProof; the diff adds, removes and reorders no layer, so the arrangement was not compared again.

Research link: the Weyl and dual Weyl lattices of Kostant 1966 and Jantzen 2003, linkage as in Carter–Lusztig 1974, and Bost's slopes; Layers 0–3 are prerequisites of the theta-chain roadmaps of the family built on Alpöge's 2026 formal proof. Rests on the README (References, Downstream consumers).

## Not verifiable

- Jantzen II.5.6 (the closed lowest alcove): no legal copy, as in the previous reviews; the sentence was checked against the formal proof's statement and by instances instead.
- The other 29 files the README cites in the formal proof were not opened again at the first commit; the end of the comparison of the two commits (its last entry, a notes file outside `src/`) was not read.

## Source issues

- none

## For the human reviewers

- Scope: the source of most targets is one Lean formalization announced on 20 November 2026 (README References, last two entries); it is unpublished and unrefereed.
- Licence: several definitions of `Suggested.lean` (`rowOperation`, `dividedRowOperator`, `weylLattice`, `pieriShapes`, `branchingInteger`) have the bodies of `rowGen`, `rowDiv`, `weyl`, `shapes`, `cCap` in the formal proof, under other names; the family index (line 16) records that the proof was published without a licence.
- Scope: the family index has a section, "When a roadmap is wrong" (line 46), which sets rules for writers and reviewers of later contributions; whether a roadmap index may carry such rules is a project decision.
