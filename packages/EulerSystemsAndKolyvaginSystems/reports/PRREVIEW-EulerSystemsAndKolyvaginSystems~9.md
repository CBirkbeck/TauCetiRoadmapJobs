# Review of EulerSystemsAndKolyvaginSystems (pull request #3188 at acd5006)

**Verdict:** accepted

**Summary.** An incremental re-review: the folder is unchanged since the last review of `acd5006`, and this round read the pull request's title and description against the head. Every sentence of the description now agrees with the 28-line change (the three inaccuracies reported last time are repaired), and the three SelmerIwasawaCohomology sections the added passages cite were read again at the new head of that roadmap's open revision and still state what is consumed. There is no finding; one small correction on untouched text is carried over, there are no format notes and one question for the author. The dependency on the open SelmerIwasawaCohomology revision, the licence of one linked copy and one unreadable source are left to the human reviewers.

## C01 — Untouched text: Layers 0.8 and 0.9 point to sections by labels that name nothing

In `README.md`, Layer 0.8 line 407 ("Independence of the modulus is core-rank-independence-of-modulus") and Layer 0.9 lines 438 ("the invariants hypothesis of core-rank") and 446 ("apply selmer-torsion-identification") use hyphenated labels that no heading or sentence of the README defines, so a reader cannot follow the pointer. From the context they mean Layer 0.9, Layer 0.8 and Layer 0.6; naming those layers would repair it. The pull request did not write these lines, so this can go in a separate change.

## Questions for the author

- Layer 0.7 admits the equal-characteristic ring `k⟦X⟧` and Layer 0.1 a general complete noetherian local `R`; the added sentences form `Δ(F)` there through SelmerIwasawaCohomology §2.22a. Does "every coefficient ring `R` of this section" in §2.22a cover finite free modules over such rings? Its hypothesis line names "the compact, rational or discrete coefficients of §2.21", so I could not settle it from the text; §2A.8, which uses `U(L)` of §2.22a, is stated over every complete Noetherian local ring with finite residue field.

## Previous findings

- The previous report had no finding (no R-numbered point). Its small correction on the description is repaired: the description now reads "No numbered section is added", "the condition `U(H¹_F(K_q, T))` of `Δ(F)`", and "cites Lemma 3.7.1`(i)` only in Layer 0.4". Its small correction on untouched text is not repaired and stands as C01.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 0.4 added sentence, against SelmerIwasawaCohomology §2A.8 item 1 at the supplier's new head | `ℚ_p`, `p` odd, `T = ℤ_p` trivial, `H¹ = ℤ_pψ ⊕ ℤ_pχ`; `L = pℤ_pχ`; `L = ℤ_p(ψ + pχ)`; `π^k`- versus `π`-torsion | cone `(H¹/L)[p]`: first `L` gives `𝔽_p ≠ 0`, not simple; second gives quotient `≅ ℤ_p`, cone `0`; `π^k x = 0`, `x ≠ 0` gives a nonzero `π`-torsion multiple | holds | none |
| 0.9 added sentences, against §2A.8 items 2 and 3 and §2.23a | `ℚ`, `S = {p, ∞}`, `p` odd, `T = ℤ_p`, strict at `p`, `k = 1` | `Sel = 0`; `Sel(𝔽_p) = 0`; `H² = coker(ℤ_p → ℤ_p²) = ℤ_p` (as `H²(G_S, ℤ_p) = 0`), `H²[p] = 0`: `0 → 0 → 0 → 0 → 0` | holds | none |
| Description, 0.4 bullet versus head line 250 | every `F`, not only `F_can` | head: "the condition `U(H¹_F(K_q, T))` of `Δ(F)`"; description: the same words | agrees | none |
| Description, "no existing statement changes" | word-level diff against the merge base | 9 deleted lines are each re-added with words appended (five `*Needs:*`/dependency lines, the overview sentence, three paragraphs); no word of a statement removed | agrees | none |

The rows for the other statements (the added sentences of 0.1 and 0.7, the supplier contract, and the two headline theorems of `Suggested.lean`) stand as in the previous review, of `acd5006`.

- Pull-request text: title and all description sentences compared with the head and the change (1 heading added, the supplier-contract subsection at line 5867; 0 layers removed, retitled or added; `Suggested.lean` unchanged; one supplier revision added and named). None contradicted; nothing a reader must know is left out.
- Cross-roadmap citations resolved again: SelmerIwasawaCohomology §2.22a, §2.23a, §2A.8 at head `8989684` of its open revision (it moved since the last review); the three titles agree word for word with the README's citations, and §2A.8 items 1–3, "No perfectness is needed", and §2.22a "with or without `(P)`" still state what Layers 0.1, 0.4, 0.7, 0.9 and the supplier subsection consume.
- Seeded sample: the fifteen targets (0.4, 0.10, 1.21, 1.22, 2.4, 3.5, 3.9a, 4.15, 6.1, 6.2, 7.6, 7.7, 8.9, 8.19, 8.36) lie in text unchanged since the last review; only 0.4 is touched by the pull request, and its added sentence is the first row above. The README flags no locator as unverified. Source locators opened this round: 0.
- Dependency check: `depcheck: 94 roadmaps, 1058 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Automatic checks run again at `acd5006`: all pass; no file changed outside the folder.
- Elaboration of `Suggested.lean`: two warnings, both `declaration uses sorry` (102:8, 120:8); the elaborated types of both theorems carry every binder of their statements.
- Record: no layer or item removed, retitled or renumbered against the merge base. No other open pull request changes this roadmap; none drops an id it cites.

Overlap check: read HeegnerPointEulerSystems, SelmerIwasawaCohomology (`main` and the cited revision), EulerSystemsCyclotomicMainConjecture; the only shared object of the change is the simple local conditions with `Δ(F)` and their base change, owner SelmerIwasawaCohomology, cited here; the others consume this roadmap's descent and own none of it.

Source independence: changed passages only; no passage changed since the last review, whose comparison stands (6 passages compared with 1 source, Mazur–Rubin 2016, none shared); largest share Rubin, Euler Systems, 102 of 343 linked locators; Mazur–Rubin 2004 Lemma 3.7.1 not readable; arrangement not compared (no layer added, removed or reordered).

Research link: the roadmap is the Euler- and Kolyvagin-system descent of Rubin (2000), Mazur–Rubin (2004, 2016), Howard (2004) and Burns–Sakamoto–Sano (2018), consumed by Heegner-point, cyclotomic-unit and Kato-class bounds; the change ties its Selmer structures to Selmer complexes. Rests on the README overview and References.

## Not verifiable

- Mazur–Rubin 2004, Lemma 3.7.1(i), cited by the added sentence of 0.4: the memoir is paywalled and the only copy the README links is on a third party's page, which was not read. The last review checked the attribution through Mazur–Rubin 2016 Remark 3.2.
- The description's account of how the text was drafted and reread, and of where the question was raised, cannot be checked from the head.

Automatic checks set aside as false positives: the listing of elaborated signatures reads the docstring words "structure and" at `Suggested.lean` line 84 as a declaration named `and`; the file has no such declaration.

## Source issues

- none

## For the human reviewers

- **Merge order.** The README cites SelmerIwasawaCohomology §§2.22a, 2.23a and 2A.8 (lines 53, 250, 337, 450, 5867 and the `*Needs:*` lines), defined only at the head of that roadmap's open revision, which the description names under "Depends on". That revision merges first.
- **Licence.** `README.md` Layer 0.1 (lines 43–49) and later (untouched text): the Mazur–Rubin "Kolyvagin systems" link is a copy on a third party's institutional page, not an author's page or the publisher.
- **Not tested.** Mazur–Rubin 2004 could not be read legally; the changed passages cite it only for Lemma 3.7.1(i), and their wording was not compared with it. Rubin's "Euler Systems", the source with the largest share of locators, is cited by no changed passage and was not opened.
