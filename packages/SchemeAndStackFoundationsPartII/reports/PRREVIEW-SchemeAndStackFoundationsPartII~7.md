# Review of SchemeAndStackFoundationsPartII (pull request #2272 at e4fc200)

**Verdict:** accepted

**Summary.** Accepted: no finding. The 22 changed lines repair the three small corrections that a change in this folder could settle: the opening now credits its two sources without presenting them as the plan, the identity-case Checks are gone, and the new Check of §2.1 (a non-finitary functor for which the lifting statement fails) and the rewritten Frobenius cokernels 𝔽_p[t]/𝔽_p[t^p] and 𝔽_p[[t]]/𝔽_p[[t^p]] compute correctly. Two format notes carried from the previous review remain, neither blocking. Left to the humans who approve: the parallel with the numbered results of one article, and the acceptance being conditional on the twenty declared supplier contracts and on the SchemeAndStackFoundations revision that adds §2.9a.

## N01 — Three locators name the wrong kind of item or one page too many

"CS24 §4.1.2, p.36" (Conventions, line 35) is Example 4.1.2; "§§4.1.5–4.1.6" in the References (line 511) is §4.1.5 and Lemma 4.1.6, as lines 361 and 455 already say; BC22 Proposition 2.1.4 with its proof is on p.7 alone, not pp.7–8 (line 428).

## N02 — Four rows of the Tau Ceti supplier table are consumed by no *Needs:* line

`TauCeti.AffineGroupSchemeCat.algebraPointsFunctorIsoCoordinatePointsFunctor`, `TauCeti.smoothAffineGroupSchemeProperty_inverseImage`, `TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat.cartierDual` and `…cartierDualBaseChangeNatIso` (lines 403, 404, 407, 408) appear only in the table. Naming them in the *Needs:* lines of the contracts that speak of "the pinned point comparison" and the "native Cartier dual" would say where the rows are used.

## Deferred findings

- D01 — resolved: the description's dependency blocks at this head list the SchemeAndStackFoundations revision (#2531) before this pull request and no longer list FunctorOfPoints.

## Previous findings

The previous report (of `de80147`) had no finding; its small corrections and format notes are accounted for here.

- C01 — repaired: line 3 now reads "Its theorems are those of Česnavičius–Scholze, *Purity for flat cohomology*, §§5.6–5.7, with the henselian-pair and algebraization inputs of Bouthier–Česnavičius … §2.1."
- C02 — repaired (D01): the dependency blocks of the description now name #2531 and not FunctorOfPoints.
- C03 — repaired: the six identity-case Checks (§§1.2, 1.4, 2.1, 2.2, 2.3, 2.6) are removed; §2.1 has the Check with F(C)=Hom_A(ℤ_p,C), which the theorem's hypothesis excludes.
- N01 — not repaired: lines 35, 511 and 428 are unchanged; written again as N01.
- N02 — not repaired: the four table rows are unchanged; written again as N02.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| Summary, §2.0 Check and Worked examples: H¹_fppf(𝔽_p[t],α_p)=𝔽_p[t]/𝔽_p[t^p] | 0→α_p→𝔾_a→𝔾_a→0 over A=𝔽_p[t] | H¹(A,𝔾_a)=0, so H¹(α_p)=coker(F)=A/{f^p}; {f^p}=𝔽_p[t^p]; class of t nonzero (t∉𝔽_p[t^p]) | true; the new notation names the image of Frobenius | none |
| §2.1 new Check (BC22 Lemma 2.1.3, pp.6–7, BC22 line 253) | A=ℤ_(p)^h, I=(p), F=Hom_A(ℤ_p,−) | endomorphism f of ℤ_p: f(x)−x∈p^kℤ_p for all k, so f=id; A countable, ℤ_p not: F(A)=∅; F(Â)∋id↦reduction∈F(𝔽_p); F finitary would make ℤ_p finitely generated over A | lifting equivalence fails exactly when the filtered-colimit hypothesis is dropped; source hypotheses (Noetherian, regular fibres, filtered colimits) as stated | none |
| §2.2 Check (CS24 Corollary 5.6.9, p.76, CS24 line 3190) | (𝔽_p[[t]],(t)), α_p | H¹=𝔽_p[[t]]/𝔽_p[[t^p]]∋t≠0; H¹(𝔽_p,α_p)=𝔽_p/F(𝔽_p)=0; H²(α_p) sits between H¹(𝔾_a)=0 and H²(𝔾_a)=0 | surjective, not injective, in degree 1; bijective 0→0 in degree 2: agrees with the theorem | none |
| §2.0 opening sentence on carriers; *Needs:* of §2.5 and §2.6 | the two comparisons it points to | §2.0 has the bullet comparing `flatCohomology` with the animated groups of gap:animated-flat-cohomology (line 188) and the bullet comparing it with §2.9a at X=Spec A (line 189) | both comparisons are stated where the sentence says; the added *Needs:* items point down (§2.0 before §2.5, §2.6) | none |

The rows for untouched statements stand as in the previous review, of `de80147`; `Suggested.lean` is unchanged since that head.

- Source locators checked against the text this round: 3 (BC22 Lemma 2.1.3 pp.6–7; BC22 §2.1.1 p.5; CS24 Corollary 5.6.9 p.76), all confirmed; plus the three of N01, unchanged.
- Cross-roadmap citations in the changed passages: SchemeAndStackFoundations §2.9a (only at the head of the open revision #2531, which the description names), PurityForFlatCohomology §3.2 (at its open head), gap:animated-flat-cohomology (declared); all resolve.
- Automatic checks: all pass at this head. Dependency check: `depcheck: 131 roadmaps, 1464 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the roadmap folder.
- Elaboration: `Suggested.lean` elaborates with `sorry` on the two theorems (lines 102 and 130) as the only warnings; the six elaborated signatures are those compared with the README in the previous review.
- Pull request text: title and prose read against this head; no sentence is contradicted by the change (the change touches Checks, one notation, the opening credit and two *Needs:* lines, none of which the description describes).
- Overlap check: read PurityForFlatCohomology, ArcTopologyAndDescent, PrismaticCohomologyPartIII, PrismaticCohomology, SchemeAndStackFoundations (#2531); nothing shared. No layer added, removed or reordered by the change.

Source independence: changed passages only; 4 passages compared with 2 sources (CS24, BC22), none shared (the new Check of §2.1 has no counterpart in BC22 §2.1); largest share CS24, as in the previous review; contents not compared again, the change adding, removing or reordering no layer.

Research link: Layers 1–3 state the continuity formula, henselian invariance and adic descent of Česnavičius–Scholze (2023), §§5.6–5.7, with the algebraization criterion of Bouthier–Česnavičius (2022), §2.1, used for torsors over complete and henselian rings and for flat cohomology of perfectoid rings; rests on the README's Summary and on CS24 lines 2954–3260.

## Not verifiable

- The published numbering of Y18 (2.8, 4.3, 6.9), which the README gives beside the preprint numbering: only the preprint was read.
- The claim of the description that four review rounds and two red-team rounds preceded the port: not a matter of the folder.

## Source issues

- none

## For the human reviewers

- Arrangement: the README's sections correspond in order to CS24 5.6.2–5.6.13 and 5.7.1–5.7.2; the order is forced by the *Needs:* lines, and line 3 no longer says the roadmap follows that article.
- Conditional acceptance: twenty declared contracts ask SchemeAndStackFoundations, PrismaticCohomologyPartIII and DerivedModuleAlgebra, all on main, for statements they do not yet make; §2.9a exists only at the head of #2531.
- Wording: a 17-word run is shared with BC22 Lemma 2.1.3 (README line 215, BC22 line 258).
- Licence: DJ is an undated author note read from the author's page; it is cited once, for a convention (line 33).
