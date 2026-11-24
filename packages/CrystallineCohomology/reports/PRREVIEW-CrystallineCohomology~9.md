# Review of CrystallineCohomology (pull request #2532 at 66a2f7d)

**Verdict:** accepted

**Summary.** Accepted with no findings. The folder is unchanged since the previous review of this same head, so this round read the pull request's title and description against the head and the change from the base: every sentence agrees with what the head shows, and no change a reader must know of is left unstated. Two format notes carried from the previous review remain, neither blocking; there are no small corrections, and nothing is left for a human to decide.

## N01 — In the citation of *Crystalline cup products* (line 3058) the chapter name "Cohomology on Sites" is still written twice.

## N02 — *Crystalline Leray spectral sequence* (line 3347, and again at line 3497) still gives "pp.17–19" for the proof of Bhatt–Morrow–Scholze Theorem 2.10; in the linked copy the theorem is on p.16 and its proof on pp.16–17, and p.19 begins §3.

## Previous findings

The previous review, of this same head, had no findings (R) and no small corrections; its two format notes are accounted for here.

- N01 — not repaired: line 3058 still has "Cohomology on Sites, Cohomology on Sites"; restated above.
- N02 — not repaired: line 3347 still has "of Theorem 2.10, pp.17–19"; restated above.

## Verified sound

No statement changed since the previous review; the rows are for the statements the pull request's description cites, each recomputed against the head.

| Statement | Instances tried | Left-side value | Right-side value | Result; change |
| --- | --- | --- | --- | --- |
| Description: the ordinary log base change of h:(a,b)↦(a+b,b) on ℕ² along itself is not integral | pushout of ℕ²←ℕ²→ℕ² with generators e₁,e₂ and f₁,f₂ | relations e₁=f₁, e₁+e₂=f₁+f₂; so e₁+e₂=e₁+f₂ while e₂≠f₂ (the relation needs an e₁) | cancellation fails: not integral; h is an isomorphism on ℤ² (det 1), so log étale | Description true; agrees with *Base change of logarithmic morphisms* (line 8039) |
| Description: "correct six targets" / "statements or locators of six targets" | hunks of the diff against the base | 10 hunks: 1 scope sentence, 1 reference added, 8 in targets | targets: *The derived de Rham to crystalline map*, *Crystalline cup products*, *Kummer morphisms*, *Kummer étale morphisms*, *Base change of logarithmic morphisms*, *Proper smooth crystalline base change*: 6 | Count right |
| Description: section ids of the six targets | headings at the head | CR.DDR.4.1 at 2236 (target route at 2269); CR.3.3 at 2871 (target 3001); CR.3.4 *Frobenius* at 3085 | CR.5:log-algebra.2 at 7832 (target 7906); .3 at 7962 (targets 8012, 8039); CR.7.3 at 11347 (target 11349) | All six ids right |
| Description: Proper smooth crystalline base change "names everything it uses" | I₀=I, I₀′=I′; I₀=0=I₀′; S=S′, I₀=(p), I₀′=0 over ℤ/p² | first: ordinary case of CR.3; second: S₀=S, X′=X×_S S′ | third: I₀O_(S′)=(p)⊄0, excluded, as S₀′=S′ does not map to Spec 𝔽_p | Lines 11349–11360 contain I₀⊂I, I₀′⊂I′, the inclusion, π′, g and (V,T), as described |
| Description: Illusie locators | README lines 7920–7922, 8028–8030, 8050–8053 | README: §1.6, p.274; §1.6, pp.274–275; §2.1, p.276 | description: §1.6, pp.274–275 for the two Kummer targets; §2.1, p.276 for fs base change | Agree; the overview is in the References (line 11622) |
| Description: Part II plans two of the four subjects and says it does not plan the other two | CrystallineCohomologyPartII on main, Scope and ownership | names h-covers and singular schemes as "what it builds" | "Convergent-coefficient descent and Cartier transforms of periodic connections … are not part of this roadmap" | Description true; head lines 191–194 agree |
| Description: "What the roadmap keeps", four headline comparisons | README Summary, last sentence | end theorems: crystalline–de Rham via PD Poincaré, de Rham–Witt comparison, Poincaré duality, Hyodo–Kato comparison | description lists the same four | Agree; no layer or Lean declaration changed |

The rows of the earlier reviews for the roadmap's statements, including the two headline theorems of `TauCetiRoadmap/CrystallineCohomology/Suggested.lean`, stand as in the previous review, of `66a2f7d`.

- Pull request text: title, the summary block and each paragraph of the prose were compared with the diff against the base (one file, 33 insertions, 25 deletions; 0 headings, 0 Lean declarations, 0 layers added, removed or renamed) and with the head. No sentence is contradicted; "no target, heading, section number, supplier contract or Lean declaration is added, removed or renumbered" holds; nothing changed outside the folder.
- Source locators checked against the text this round: none new (no passage changed); the five of the previous review stand. Seeded sample: no sampled target lies in a changed passage, so none was re-read in this incremental round.
- Cross-roadmap citations resolved: CrystallineCohomologyPartII on main (Scope and ownership, first two paragraphs).
- Automatic checks at this head: all passed. Dependency check output: `depcheck: 132 roadmaps, 1469 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `TauCetiRoadmap/CrystallineCohomology/Suggested.lean`: two warnings, both `declaration uses sorry` (lines 49 and 82); single `import Mathlib`, no `set_option`. No statement changed, so the signatures and the one-tactic probe stand as in the earlier reviews.
- Overlaps: one other open pull request, #3036, changes this roadmap (its *Needs:* lines). Its changes were compared with main: none falls in a passage this pull request changes, the heads merge cleanly, and the description states the order (this pull request first). No cited id dropped; no second copy on main.

Overlap check: read DerivedDeRhamCohomology, PrismaticCohomologyPartIV, AInfCohomology, HabiroCohomologyFoundations, CrystallineCohomologyPartII; nothing shared (as in the previous review; nothing in the folder changed, and CrystallineCohomologyPartII was read again against the scope sentence).

Source independence: changed passages only: none changed since the previous review, so 0 passages compared this round (previous round: 4 passages with 3 sources, none shared). Largest share Stacks Project, 191 of about 530 cited passages, unchanged; contents not compared again, since no layer was added, removed or reordered (previous result: independent).

Research link: CR.6 is Hyodo–Kato theory (Hyodo–Kato 1994) for semistable reduction; its convergent complexes are those Disegni–Liu use, and CR.6.5 is Grosse-Klönne's log rigid cohomology, which he applies to Drinfeld's symmetric space. CR.7's base change follows Du–Moon–Shimizu (2026). Rests on README lines 83–87 and the sources read.

## Not verifiable

- The description's sentence that Temkin's §1.2.7 "treats log smoothness of snc pairs and defines no Kummer map" was not read against Temkin's text this round; it restates a point an earlier review established, and no text of the head depends on it.

## Source issues

- none

## For the human reviewers

- none
