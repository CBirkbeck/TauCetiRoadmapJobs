# Review of RankZeroOneBSDPartII (pull request #1732 at 27e8ab0)

**Verdict:** accepted

Incremental re-review of the 14 lines of `TauCetiRoadmap/RankZeroOneBSDPartII/README.md` changed since `249b5e4`, and of the pull request's title and description against this head. No finding.

## Previous findings

- R01 — repaired: the gap sentence is gone; `README.md:113-115` adds "From TauCetiRoadmap.RankOneConverse", and §1.1 (line 190) applies "RankOneConverse §4.1 to the weight-two newform g of E"; *Needs:* (line 199) and Layer 1 Dependencies (line 223) cite it.
- R02 — repaired: `README.md:7` now reads "the irreducible-residual localization criteria belong to RankOneConverse Layers 0–6"; RankOneConverse's head has Layers 0–6 at lines 185–538.
- R03 — repaired: the description now says "`Suggested.lean` states no declaration: no headline theorem of the roadmap is statable at the pinned Mathlib and Tau Ceti" and "the targeted Lake build succeeds with no warning".
- R04 — repaired: the summary block now says "Layer 4 turns restricted three-Selmer bounds into positive lower proportions" and "Layer 5 tests this scope", with both diagnostic curves.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §1.1 route through RankOneConverse §4.1 (line 190) | r=1 (w=−1), r=0 (w=+1) | value branch: ε=−1, εD>0 ⇒ D<0, twisted sign ε·sgn(D)=+1, order 0=1−r; derivative branch: ε=+1, εD<0 ⇒ D<0, sign −1, order 1=1−r | agrees with §4.1 (RankOneConverse `README.md:401`) | none |
| §1.1 on a concrete curve | level 11, w=+1, D=−7, S₀ ⊇ {2, 11} | −7≡4 mod 11 is a square, −7≡1 mod 8: 2 and 11 split; χ_D(−11)=sgn(D)·χ_D(11)=−1: odd order, the derivative branch | consistent | none |
| §1.1 "splitting at 2 makes it odd"; D<−4 | fundamental D with 2 split | D≡1 mod 8; −3≡5 mod 8 (2 inert) and −4 even are excluded; largest admissible D is −7 | holds | none |
| §1.1 identification of the newform of E^K with the primitive twist | q∤ND against the predicate's "q∤M₀M′δ" | M₀=N, M′=ND² (since (D,N)=1), δ=D: excluded primes are those of ND on both sides; uniqueness is stated in §4.1 | hypotheses of the uniqueness met | none |
| Contract "From TauCetiRoadmap.RankOneConverse" (line 115) against §4.1 | each clause | trivial nebentypus, S₀ ⊇ primes of level, εδ>0 with rank 0, εδ<0 with rank 1, uniqueness by ModularForms Layer 5: all five in RankOneConverse `README.md:399-401` | matches | none |
| Description, "three gaps" | gap sentences in the README | 3: lines 67, 73, 81 (EllipticCurves, EllipticCurveModularity, SelmerIwasawaCohomology); `complementary-heegner-twists`: 0 matches | agrees | none |
| Description, "d≡2 mod 3, of density 3/8" | squarefree d by class mod 3 | classes 0, 1, 2 have densities 1/4, 3/8, 3/8 among squarefree integers; README line 554 says mass 3/8 | agrees | none |

The rows for all other statements stand as in the previous review, of `249b5e4`.

- Previous findings: 4 of 4 repaired; no new problem found in the repairs.
- Cross-roadmap citations in the changed passages, resolved: RankOneConverse §4.1 (open head `9b5c88a`, `README.md:397`) and Layers 0–6 (lines 185–538); EllipticCurves Layer 5 on main (`README.md:1154`, the Galois-twisted point isomorphism at lines 1193–1194); ModularForms Layer 5 on main (`README.md:708`).
- Supply direction: the merge order has RankOneConverse at line 401 and this roadmap at line 404; RankOneConverse's README does not name this roadmap. Dependency check with `--movable`: `depcheck: 238 roadmaps, 2248 edges, 0 problem(s)`, no UPWARD, CYCLE or `moved:` line.
- Source locator in the changed section: §1.1's "CGLS Proof of Theorem 5.2.1, pp. 574–575, conditions (a)–(d) and (d′)" holds at CGLS lines 2151–2161 and 2173–2182 (printed page 575 begins at line 2180).
- Description read against the head: every sentence of the summary block and of the prose, none contradicted; it states the new supplier (RankOneConverse §4.1) and the three remaining gaps. The title agrees: the folder is not on main and the pull request adds it (601 insertions).
- Gate, my own run at this head: every check OK, exit 0 (the worker's run also passed, `build=0`). Outside-folder diff against `origin/main`: empty. Worktree clean.
- Elaboration: `lake env lean TauCetiRoadmap/RankZeroOneBSDPartII/Suggested.lean` exits 0 with no output. The file is unchanged and declares nothing, so there is nothing for the one-tactic probe or a `#check` comparison, and no name it could share with RankOneConverse's `Suggested.lean`.
- Declared gaps: the three that remain are unchanged and stand as in the earlier reviews; acceptance is conditional on them.

Overlap check: read CMRankZeroConverse, RankOneConverse, HeegnerPointEulerSystems; quadratic twist nonvanishing with split prescriptions is owned by RankOneConverse §4.1 and cited here (lines 7, 115, 190, 199, 223); the rank-r p-converse proposition is owned by CMRankZeroConverse §0.1 and cited here; the Eisenstein anticyclotomic equality is owned by HeegnerPointEulerSystems §8b.10 and cited here.

Source independence: 3 passages compared with 1 source (changed passages only: the scope sentence, the RankOneConverse contract and the §1.1 route, against CGLS lines 2149–2185), none shared; largest share CGLS, as counted in the earlier full review; contents not compared again, since no layer was added, removed or reordered.

## Not verifiable

- The description's "after 1 independent review round and 2 red-team rounds on the job board": a statement about the board's history, not about the head; not checked.

## Source issues

- none (the two CGLS gaps recorded by the earlier full review at Corollary 5.2.3 and Remark 5.2.4, printed p. 575, stand as recorded there).

## For the human reviewers

- **Scope.** `README.md:554-556` states that CGLS Corollary 5.2.3 and the percentages of Remark 5.2.4 (printed p. 575) are not reached by the converse without a good-at-3 twist; the roadmap adds that hypothesis to a published statement.
- **Not tested.** `Suggested.lean` states no declaration (every headline is named as not statable at the pins), so the build tests no mathematics of this roadmap.
