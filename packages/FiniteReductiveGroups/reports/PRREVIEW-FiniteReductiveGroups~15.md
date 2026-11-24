# Review of FiniteReductiveGroups (pull request #3027 at 45a4865)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/FiniteReductiveGroups/`
**Verdict:** accepted

**Summary.** An incremental re-review of the 73 lines changed since `094da69`, all in 3.4, the scope, the supplier tables and the References. Accepted: the one finding and the one small correction of the previous review are repaired. 3.4 now restates EtaleDualityAndPerverseSheaves §7.6 for all four clauses and claims none of them as its own, and its Origin gives a locator for each clause that I confirmed in the texts. There is no finding, no small correction and no format note; three points are left for the human reviewers, as before.

## Previous findings

- R01 — repaired: 3.4 reads "(a)–(c) are *lefschetzGroupActions* … and (d) is the case `F = k̄`, `W = X` of *finitelyManyStabilizers*"; the scope lists 3.4 among the restated statements and the stabilisers under §7.6; *Needs:* and the supplier table name *finitelyManyStabilizers*.
- C01 — repaired: the Origin reads "(b) is Digne and Michel (1991), Proposition 10.15, as recorded in Chan and Ivanov, Proposition 4.4", with Dudas–Michel 13.9 for (a) and 13.8, 13.7 for (c); each locator is right.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 3.4 (a), citation and Origin | §7.6 at this head; sources | §7.6 (a): "a connected algebraic group `G`" (line 7565). Serre exposé 487 line 163: Proposition 3 = Deligne–Lusztig 6.4, connected `H`. DudasMichel2015 line 2678: 13.9, linear | agree | none |
| 3.4 (b), citation and Origin | `𝔾_m` on `ℙ¹`, `g = 1`; sources | `L(1, ℙ¹) = 1 + 1 = 2 = |{0, ∞}|`. ChanIvanov2019 lines 542–545: Proposition 4.4, torus, finite-order automorphism, proof by [DM91, 10.15]. §7.6 (b) with `T` for `S` (line 7566) | holds; locators right | none |
| 3.4 (c), "of finite order" added | §7.6; source | §7.6 (c) has `g`, `g′` of finite order with `f∘g = g′∘f` (lines 7567–7570); DudasMichel2015 lines 2664–2673: 13.8 (ii), (iii) for finite order; 13.7 at line 2648 | agree | none |
| 3.4 (d) as the case `F = k̄`, `W = X` | §7.6; `𝔾_m` on `𝔸²`, weights `(1, 2)`; `μ₂` on two points | §7.6 lines 7522–7527: any field `F`, `W` separated of finite type; quasi-projective `X` qualifies. Stabilisers `𝔾_m`, `μ₂`, `1`: three; and `1`: one | holds | none |
| 3.4, second Check (reworded) | cusp `y² = x³`, weights `(2, 3)`, `p ≠ 2`, `g = 1` | point `(a², a³)`, `a ≠ 0`: `t² = t³ = 1` gives `t = 1`; `−1 ∉ {1}`, the condition of §7.6 (b) (lines 7587–7590). `X^{−1}`: `2y = 0`, `k̄[x]/(x³)`; `X^S`: ideal `(x, y)`; both `L = 1` | holds | none |
| Layer 3 Dependencies, supplier tables, References | search of the README | §F.2.4 and SGA 3 no longer occur anywhere in the README; §F.4.5 still used by 3.2; the §7.6 row names five statements, all five defined in §7.6 | consistent | none |

The rows for untouched statements stand as in the previous review, of `094da69`.

- Source locators checked against the text: 6 (Dudas–Michel 2015, Propositions 13.7, 13.8, 13.9; Chan–Ivanov, Proposition 4.4, arXiv v2; Deligne–Lusztig Proposition 6.4 through Serre's exposé 487, Proposition 3; Digne–Michel 1991, 10.15 through Chan–Ivanov's restatement only).
- Seeded sample: of its targets only 3.4 lies in the changed passages; checked as above.
- Cross-roadmap citations resolved at this head: EtaleDualityAndPerverseSheaves §7.6, *lefschetzGroupActions* (a)–(c) with its route of (b), and *finitelyManyStabilizers*. That section calls (b) its own formulation while 3.4 gives the published locator; the locator is right.
- Record against the merge base: 3.4 keeps its number, title, the statements (a)–(d) and its four Checks; only the route went, to the section that owns it. No layer or section is added, removed or renumbered by the change.
- Automatic checks: the worker's run passed every check. Dependency check: `depcheck: 132 roadmaps, 1471 edges, 0 problem(s)`. `lake env lean` on `Suggested.lean`: three `sorry` warnings (lines 125, 187, 206) and nothing else. The Lean file is unchanged since `094da69`, so the one-tactic probe and the `#check @name` comparison of the previous review stand.
- The pull request's text: its sentences on this folder (the suppliers gained, among them EtaleDualityAndPerverseSheaves §7.6, and those dropped) agree with the head; the change drops no supplier and no section. Outside the folder, the family index changes one sentence on the `*Corollary of:*` convention, which agrees with this README's use of that line.
- Overlap check: read EtaleDualityAndPerverseSheaves §7.6, DeligneLusztigTheory (scope), and the closest-roadmap lists (ThetaKernelsForUnitaryDualPairs, ThetaLiftsForDefiniteUnitaryGroups, SmoothRepresentationsOfLocalGroups, ExceptionalThetaCorrespondencesForG2, EndoscopicTransferAndUnitaryTraceComparison, BaseChangeAndGaloisRepresentationsForUnitaryGroups, LocalFactorsOfTwistsAndTypes, BesselPoincareSeriesAndGramBounds). The finiteness of stabilisers of a diagonalisable group and the action of connected groups on `H^*_c`: owner EtaleDualityAndPerverseSheaves §7.6, now cited here. Nothing else is shared.
- Source independence: 4 passages compared with 3 sources, changed passages only (3.4 (a) with Serre's exposé and Dudas–Michel 13.9, (b) with Chan–Ivanov 4.4, (c) with Dudas–Michel 13.8, the Origin line); none shares wording beyond formulas. Largest share of the locators: Green 1955, 17 of about 162, which could not be read. The arrangement was not compared: the diff adds, removes and reorders no layer.
- Research link: Layers 4 and 5 are the character theory of finite reductive groups and of `GL_n(𝔽_q)` of Deligne–Lusztig (1976) and Green (1955), with Kondo (1963) and Shintani (1976); Layer 6 is the depth-zero theory of Moy–Prasad (1996). The README ties them to Alpöge's 2026 formal proof of GRH for Dirichlet `L`-functions. Rests on the README and the sources read.

## Not verifiable

- Digne–Michel 1991, Proposition 10.15 (3.4 (b)): the book is not readable from a legal place; confirmed only through Chan and Ivanov's Proposition 4.4, which cites it for the same statement.
- Deligne–Lusztig 1976, Proposition 6.4 (3.4 (a)): no legal copy; confirmed through Serre's exposé 487.
- Green 1955, Carter 1985, Digne–Michel 2020, Macdonald 1995, Brundan–Dipper–Kleshchev 2001, Piatetski-Shapiro 1983, Kawanaka 1987: not read, as in the previous review; the change does not touch what cites them.
- The description as given to this review is cut short, so I could not read whether it states an order with the other open pull request that edits this README ("Roadmaps: cite the sections a need uses, not whole layers").

## Source issues

- none

## For the human reviewers

- This roadmap is on `main` and names as a supplier DeligneLusztigTheory, a roadmap this same pull request adds (README, supplier contracts, "From TauCetiRoadmap.DeligneLusztigTheory"); the dependency check reports no upward edge. Whether that is acceptable is yours to decide.
- The family's Method labels and the formal-proof declaration names rest on [FormalProof], Alpöge's Lean formalisation (README, References, entry [FormalProof]), a public repository that states no licence; names and paths are cited, no code.
- Not tested: Green 1955, the source with the largest share of the locators, could not be read, so the wording was not compared with it.
