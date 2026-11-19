# Review of CrystallineCohomology (pull request #2532 at 66a2f7d)

**Verdict:** accepted

**Summary.** Accepted with no findings. This is an incremental re-review of the 57 lines changed since `45263ea`: all five small corrections of the previous review are repaired, the repairs are mathematically correct and introduce no new problem, the new locators (Illusie's overview §1.6 and §2.1, Kato (2.8)) were read at the text and support the statements, and the pull request's title and description agree with the head. Two format notes carried from the previous review remain, neither blocking. Nothing is left for a human to decide.

## N01 — In the citation of *Crystalline cup products* (line 3058) the chapter name "Cohomology on Sites" is still written twice.

## N02 — *Crystalline Leray spectral sequence* (line 3347, and again at line 3497) still gives "pp.17–19" for the proof of Bhatt–Morrow–Scholze Theorem 2.10; in the linked copy the theorem is on p.16 and its proof on pp.16–17, and p.19 begins §3.

## Previous findings

The previous review had no findings (R); its five small corrections and two format notes are accounted for here.

- C01 — repaired: lines 192–194 now read "descent of convergent F-isocrystals along étale and proper surjective morphisms, and Cartier transforms of periodic connections, also build on this roadmap and are outside both Parts"; no claim about other roadmaps remains.
- C02 — repaired: lines 11349–11360 define "S₀=V(I₀) and S₀′=V(I₀′) for sub-PD ideals I₀⊂I and I₀′⊂I′ with I₀O_(S′)⊂I₀′", π′, "g:X′→X the projection", and (V,T) as an object of the site of *Relative crystalline direct images*.
- C03 — repaired: line 3016 reads "The coefficient de Rham comparison in the API below additionally requires … a smooth lift X̃ of X over A"; the API bullet uses X̃ throughout; CR.DDR.4.1 (line 2269) now points to CR.3.3.
- C04 — repaired: *Kummer morphisms* (line 7920) cites Illusie's overview, "§1.6, p.274"; *Kummer étale morphisms* cites "§1.6, pp.274–275"; both read at the text (Illusie2002 lines 174–187).
- C05 — repaired: line 8039 reads "Strict morphisms are stable under log base change; log smooth and log étale morphisms of fine log schemes are stable under fine log base change", as Kato (2.8) states (Kato lines 296–302).
- N01 — not repaired: line 3058 still has "Cohomology on Sites, Cohomology on Sites"; restated above.
- N02 — not repaired: line 3347 still has "of Theorem 2.10, pp.17–19"; restated above.

## Verified sound

| Statement | Instances tried | Left-side value | Right-side value | Result; change |
| --- | --- | --- | --- | --- |
| *Base change of logarithmic morphisms* (changed) | chart h:(a,b)↦(a+b,b) pulled back along itself; strict f | ordinary pushout: (f₂,0)≠(0,f₂), both ↦f₂ in ℤ²: not integral | fine pushout: image in ℤ² is ℕ²; base change is the identity, log étale | Holds as now stated; Kato (2.8) p.199 (Kato lines 296–302); C05 repaired |
| Same target, Kummer étale clause | root chart 1↦n pulled back along 1↦m, n,m prime to p | fs pushout: cokernel on groups ℤ/n, order invertible | Illusie §2.1, p.276: Kummer étale stable under fs base change (Illusie2002 lines 229–231) | Locator supports the clause |
| *Kummer morphisms* (locator changed) | 1↦n, n≥1; 1↦0; composite of Kummer maps with nP⊂h(Q), mQ⊂g(R) | n·1 in image, injective; nmP⊂hg(R) | 1↦0 not injective: not Kummer | Definition equals Illusie §1.6, p.274 (Illusie2002 lines 174–177); C04 repaired |
| *Kummer étale morphisms* (locator changed) | n=1; n prime to p; n=p in characteristic p | cokernel ℤ/n, order a unit: log étale and Kummer | n=p: cokernel ℤ/p, p=0 on base: Kummer, not log étale | Illusie §1.6 runs p.274–275 (lines 178–187, criterion with n invertible) |
| *Proper smooth crystalline base change* (changed) | I₀=I, I₀′=I′; I₀=0=I₀′; S=S′=Spec ℤ/p², I₀=(p), I₀′=0; ℙ¹ over W₂→k | I₀=I: S₀=V(I), ordinary case; I₀=0: S₀=S, X′=X×_S S′; (W₂⊕W₂[−2])⊗^L k=k⊕k[−2] | third case: S₀′=S does not map to S₀=Spec 𝔽_p, and I₀O_(S′)⊄I₀′ excludes it | The added inclusion is exactly what makes u restrict; C02 repaired |
| *Crystalline cup products*, smooth-lift bullet (changed) | X=Spec A/I, X̃=Spec A; Y in (4) | H⁰: cup is multiplication of A | wedge in degree 0 is multiplication of A; Y now only the second scheme | Agrees with *Smooth-lift comparison and PD filtration* (1), whose "Y" is X̃ here; C03 repaired |
| *Smooth-lift comparison and PD filtration* (sampled; cited by the changed bullet) | Stacks Remark 60.24.11 (tag 07MW) read | README: p nilpotent in A, Y smooth over S, X=Y×_S S₀, F quasi-coherent crystal | Stacks: same four hypotheses, same three conclusions | Locator and hypotheses match |
| *The derived de Rham to crystalline map*, multiplicativity route (changed) | pointer "CR.3.3" | CR.3.3 heading at line 2871, CR.3.4 (*Frobenius*) at 3085 | *Crystalline cup products* at line 3000, inside CR.3.3 | Pointer resolves |
| Scope sentence, lines 191–194 (changed) | CrystallineCohomologyPartII on main, Scope and ownership | parent gives Part II two subjects | Part II says it builds those two and not the other two | Consistent; C01 repaired |

The rows of the previous review for untouched statements, including the two headline theorems of `TauCetiRoadmap/CrystallineCohomology/Suggested.lean`, stand as in the previous review, of `45263ea`; the Lean file is unchanged since.

- Source locators checked against the text this round: 5 (Illusie2002 §1.6 at lines 174–187, printed pp.274–275; Illusie2002 §2.1 at lines 208–231, printed pp.275–276; Kato (2.8) at lines 296–302, printed p.199; Kato on exact morphisms under fine base change at lines 616–618; Stacks Remark 60.24.11, tag 07MW).
- Seeded sample: one target, *Smooth-lift comparison and PD filtration*, falls in or is cited by a changed passage and was checked; the others are untouched and outside this incremental round.
- Cross-roadmap citations resolved: CrystallineCohomologyPartII on main (Scope and ownership, second paragraph).
- Automatic checks at this head: all passed. Dependency check output: `depcheck: 200 roadmaps, 2195 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `TauCetiRoadmap/CrystallineCohomology/Suggested.lean`: two warnings, both `declaration uses sorry` (lines 49 and 82). No statement changed, so signatures and the one-tactic probe stand as in the previous review.
- Pull request text: the title ("six targets") and each paragraph of the description were compared with the diff against the base (one file, 33 insertions, 25 deletions; no heading, target, supplier or Lean declaration added or removed): the six targets named are the six changed, the section numbers CR.3.3, CR.3.4, CR.DDR.4.1, CR.7.3, CR.5:log-algebra.2 and .3 are right, the Illusie pages agree with the README, and the overview is in the References. No sentence contradicts the head; nothing changed outside the folder.
- Overlaps: no other open pull request changes this roadmap; no cited id dropped; no second copy on main. Layers were not added, removed or reordered.

Overlap check: read DerivedDeRhamCohomology, PrismaticCohomologyPartIV, AInfCohomology, CohomologyComparisons, HabiroCohomologyFoundations, HodgeTateAndCanonicalSubgroups, RefinedTraceMethods, ProetaleCohomologyOfPAdicCurvesAndTowers, CrystallineCohomologyPartII; nothing shared (as in the previous review; the change moves no ownership, and CrystallineCohomologyPartII was read again against the changed scope sentence).

Source independence: changed passages only: 4 passages compared with 3 sources (Illusie2002, Kato, Stacks Project), none shared beyond the forced definition of a Kummer map (longest run 5 words). Largest share Stacks Project, 191 of about 530 cited passages, unchanged; contents not compared again, since no layer was added, removed or reordered (previous result: independent).

Research link: CR.6 is Hyodo–Kato theory (Hyodo–Kato 1994) for semistable reduction; its convergent complexes are those Disegni–Liu use, and CR.6.5 is Grosse-Klönne's log rigid cohomology, which he applies to Drinfeld's symmetric space. CR.7's base change follows Du–Moon–Shimizu (2026). Rests on README lines 83–87 and the sources read.

## Not verifiable

- none

## Source issues

- none

## For the human reviewers

- none
