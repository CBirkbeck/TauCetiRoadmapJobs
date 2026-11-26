# Review of SchemeAndStackFoundationsPartII (pull request #2272 at 7fca6d3)

**Verdict:** accepted

**Summary.** Accepted: no finding. The one changed sentence, in the Conventions, now says that supports on an ordinary scheme are the groups `H^i_Z(X,G)` of SchemeAndStackFoundations §2.9a and keeps the fibre description for the animated complex of PurityForFlatCohomology §3.2; this is what the two cited sections define, and the degenerate values agree with the rest of the README. Two format notes carried from the previous review remain, neither blocking. Left to the humans who approve: the parallel with the numbered results of one article, and the acceptance being conditional on the twenty declared supplier contracts and on the SchemeAndStackFoundations revision that adds §2.9a.

## N01 — Three locators name the wrong kind of item or one page too many

"CS24 §4.1.2, p.36" (Conventions, line 35) is Example 4.1.2; "§§4.1.5–4.1.6" in the References (line 511) is §4.1.5 and Lemma 4.1.6; BC22 Proposition 2.1.4 with its proof is on p.7 alone, not pp.7–8 (line 428; the same range on line 430 is right for Theorem 2.1.6).

## N02 — Four rows of the Tau Ceti supplier table are consumed by no *Needs:* line

`TauCeti.AffineGroupSchemeCat.algebraPointsFunctorIsoCoordinatePointsFunctor`, `TauCeti.smoothAffineGroupSchemeProperty_inverseImage`, `TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat.cartierDual` and `…cartierDualBaseChangeNatIso` (lines 403, 404, 407, 408) appear only in the table. Naming them in the *Needs:* line of the contract that speaks of "the pinned point comparison" and the "native Cartier dual" (line 438) would say where the rows are used.

## Previous findings

The previous report (of `e4fc200`) had no finding; its two format notes are accounted for here.

- N01 — not repaired: lines 35, 511 and 428 are unchanged; written again as N01.
- N02 — not repaired: the four table rows are unchanged; written again as N02.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| Conventions, line 27: on an ordinary scheme X the supported groups `H^i_Z(X,G)` are those of SchemeAndStackFoundations §2.9a | §2.9a at the head of the open revision: Z=∅, Z=X, the long exact sequence | §2.9a defines groups `Hⁿ_Z(T,F)` (relative `Ext`), no complex; Z=∅ gives 0, Z=T gives `Hⁿ_fppf(T,F)`; sequence `Hⁿ_Z→Hⁿ(T)→Hⁿ(U)→Hⁿ⁺¹_Z` | true: groups, not a fibre complex, as the new sentence says | none |
| Conventions, line 27: `RΓ_Z(A,G)` is the fibre of restriction, PurityForFlatCohomology §3.2 | §3.2 at its open head; A=k⊕k[1], Z=∅ | §3.2 defines `RΓ_Z(A,G)=fib(RΓ_fppf(A,G)→RΓ(U_A,G))`; Z=∅: fib(id)=0; discrete A agrees with its §0.2, stated on §2.9a's groups | true; the two halves of the sentence are compatible | none |
| Conventions, line 42 against the changed sentence | I=(1), I=(0) | I=(1): V(I)=∅, support 0 on both carriers; I=(0): V(I)=Spec, fib(RΓ→RΓ(∅))=RΓ and §2.9a's `Z=T` gives `Hⁿ_fppf` | agree | none |
| §2.6 *Needs:* (line 294) and Scope (line 357), which cite §2.9a for the long exact sequence, excision and the triple | the bullets of §2.9a | long exact sequence, triple sequence, excision for an open V⊇Z and the affine-site comparison `fppfCohomology_algSpec` are all stated there | citations resolve to what they claim | none |

The rows for untouched statements stand as in the previous review, of `e4fc200`; `Suggested.lean` is unchanged since that head.

- Source locators checked against the text this round: 3 (BC22 Proposition 2.1.4, p.7, BC22 line 283; BC22 Theorem 2.1.6, pp.7–8, BC22 lines 306–326; CS24 Example 4.1.2 and Lemma 4.1.6, CS24 lines 1495, 1547), for N01. The changed sentence carries no source locator.
- Cross-roadmap citations in the changed passage: SchemeAndStackFoundations §2.9a (only at the head of the open revision of that roadmap, which the description names as merging first) and PurityForFlatCohomology §3.2 (at its open head); both resolve and say what the sentence says.
- Automatic checks: all pass at this head. Dependency check: `depcheck: 104 roadmaps, 1214 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the roadmap folder.
- Elaboration: `Suggested.lean` elaborates with `sorry` on the two theorems (lines 102 and 130) as the only warnings; the six elaborated signatures are unchanged.
- Pull request text: title and prose read against this head; no sentence is contradicted (the description already says §2.9a is "fppf cohomology on the big fppf site of schemes, with supports", added by the open revision that merges first).
- Overlap check: read PurityForFlatCohomology, SchemeAndStackFoundations (open revision), ArcTopologyAndDescent, PrismaticCohomologyPartIII, PrismaticCohomology; nothing shared (supports on schemes are owned by SchemeAndStackFoundations §2.9a, supports on animated algebras by PurityForFlatCohomology §3.2, and this roadmap cites both).

Source independence: changed passages only; 1 passage compared with 1 source (CS24 §5.2.5, CS24 lines 2279–2287), none shared; largest share CS24, as in the previous review; contents not compared again, the change adding, removing or reordering no layer.

Research link: Layers 1–3 state the continuity formula, henselian invariance and adic descent of Česnavičius–Scholze (2023), §§5.6–5.7, with the algebraization criterion of Bouthier–Česnavičius (2022), §2.1, used for torsors over complete and henselian rings and for flat cohomology of perfectoid rings; rests on the README's Summary and on CS24 lines 2954–3260.

## Not verifiable

- The published numbering of Y18 (2.8, 4.3, 6.9), which the README gives beside the preprint numbering: only the preprint was read.
- The claim of the description that four review rounds and two red-team rounds preceded the port: not a matter of the folder.

## Source issues

- none

## For the human reviewers

- Arrangement: the README's sections correspond in order to CS24 5.6.2–5.6.13 and 5.7.1–5.7.2; the order is forced by the *Needs:* lines, and line 3 does not say the roadmap follows that article.
- Conditional acceptance: twenty declared contracts ask SchemeAndStackFoundations, PrismaticCohomologyPartIII and DerivedModuleAlgebra, all on main, for statements they do not yet make; §2.9a exists only at the head of #2531.
- Wording: a 17-word run is shared with BC22 Lemma 2.1.3 (README line 215, BC22 line 258).
- Licence: DJ is an undated author note read from the author's page; it is cited once, for a convention (line 33).
