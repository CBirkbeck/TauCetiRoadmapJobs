# Review of EulerSystemsAndKolyvaginSystems (pull request #3188 at c6c0acc)

**Verdict:** accepted

**Summary.** An incremental re-review of the 62 lines changed since `10ffe54`, all of them corrections to citations of the two Mazur–Rubin works: accepted, with no finding. Every changed citation of the 2016 paper was read at its locator in arXiv v1 and agrees; the changed citations of the 2004 memoir could not be read in a legal copy and were checked only where another readable text restates the item. There is no small correction and one format note, carried from the previous review; the dependency on the open SelmerIwasawaCohomology revision, the licence of one linked copy and the unread memoir are left to the human reviewers.

## N01 — Three hyphenated labels that no heading defines remain in untouched text

Line 781 ("the identifications of finite-singular-decomposition"), line 1231 ("by core-rank-formula") and line 4901 ("of twisting-by-characters-of-gamma") point to sections by labels that no heading defines, as the three repaired earlier in Layers 0.8 and 0.9 did. Naming the layers they mean (apparently the finite–singular decomposition of Layer 1, Layer 0.10 and the twisting section of Layer 8) would finish that repair; it can go in a separate change.

## Previous findings

- The previous report had no finding (no R-numbered point) and no small correction. Its format note N01 is not repaired (the passages did not change); it is written again above as N01, with a third instance at line 781.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 0.10 (a), hypotheses line now `(H.0)`–`(H.3)`: `χ(T, F_can) = rank T^− + corank H⁰(ℚ_p, T^*)` (lines 458–460) | `T = ℤ_p(1) ⊗ ρ^{-1}`, `ρ` even, `ρ(p) ≠ 1`; `ρ` odd, `ρ ≠ ω`; `T = T_pE` | even: `T^− = T`, `1 + 0 = 1`; odd: `0 + 0 = 0`; `T_pE`: `1 + 0 = 1`. MR16 Corollary 5.8 over `ℚ` (mr16 line 513): 1, 0. Proposition 5.9 with `d = 1`: 1 | agree with lines 424, 470 and 1231 | none |
| Line 472, `χ(T_pA, F_ur) = d[K : ℚ]` for `p > 3` | `K = ℚ`, `d = 1`; `K` imaginary quadratic, `d = 1` | real place: corank `d = 1`; complex place: `2d = 2 = d[K:ℚ]` (mr16 lines 547–559); source assumes `p > 3` at line 542 and takes `F = F_ur` at line 534 | agrees | none |
| Lines 341 and 361, `F_ur = F_can` at `𝔭` when `H⁰(K_𝔭, T^*)` is finite | `T = ℤ_p(1) ⊗ ρ^{-1}`, `ρ` nontrivial on `G_{K_𝔭}`; `ρ` trivial there | `H⁰(K_𝔭, T^*)` finite, quotient finite and torsion-free, so 0; trivial: `H⁰ = ℚ_p/ℤ_p`, corank 1, quotient of rank 1 (mr16 lines 421–436; the divisible-part identification is in the proof, lines 422–425) | agrees; attribution to the proof is right | none |
| Line 303, MR16 Proposition 3.3 "assumes `F` cartesian throughout" | the proposition's hypotheses | principal artinian of length `k`, `F` cartesian, `T^{G_K} = (T^*)^{G_K} = 0` (mr16 lines 315–317); erratum to Lemma 2.1.4 on p. 32 (line 1412) | agrees | none |
| Lines 1007, 1026–1028, 1053: pages of arXiv v1 | each item against the page markers | §5.2 begins p. 11 (line 476), 5.7 and 5.8 on p. 12; 7.2, 7.3, 7.4 on p. 16; 8.3 a proposition, p. 17; 8.5, 8.6 p. 18; 8.7, 8.9 p. 19; 12.3 p. 24, 12.4 p. 25; `p > 2` at line 477 | all agree | none |
| Line 4277, prime selection "Mazur–Rubin 2004, Proposition 3.6.1, as in BSS II Remark 6.19" | BSS II arXiv v1, Remark 6.19; MR16 uses of the proposition | the remark cites Proposition 3.6.1 of the memoir with `(H.4)` (bss2 lines 2243–2247); MR16 uses it for Chebotarev choices (mr16 lines 641, 1202) | agrees | none |

The rows for the untouched statements of the folder (the sentences of 0.1, 0.4, 0.7 and 0.9, the supplier contracts and the two headline theorems of `Suggested.lean`) stand as in the previous review, of `10ffe54`.

- Source locators checked against the text: 14 of the 2016 paper in arXiv v1 (Notation p. 3; Proposition 3.3; Lemma 5.2 and its proof; Corollary 5.3; §5.2; Proposition 5.7; Corollary 5.8; Proposition 5.9; Lemma 7.2, Proposition 7.3, Theorem 7.4; Propositions 8.3, 8.5, 8.7, Theorems 8.6, 8.9; Proposition 12.3, Theorem 12.4), 1 of BSS II (Remark 6.19); the memoir's Proposition 3.6.1 and Lemma 3.7.1`(i)` only through those restatements.
- Seeded sample: none of the fifteen targets lies in a changed passage. The nearest are 8.12 (line 4813, "there for `K = ℚ`" added to the citation of Definition 3.1.3) and 8.14 (line 5921, scope of Lemmas 5.3.4–5.3.5 added); both additions concern the memoir and are under `## Not verifiable`.
- Cross-roadmap citations: none changed. SelmerIwasawaCohomology §§2.22a, 2.23a, 2A.8 are still defined only at the head of that roadmap's open revision, which the description names; no open pull request drops an id cited here or changes this roadmap.
- Dependency check: `depcheck: 94 roadmaps, 1058 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Automatic checks at `c6c0acc`: all pass; no file changed outside the folder.
- Elaboration of `Suggested.lean` (unchanged): two warnings, both `declaration uses sorry` (102:8, 120:8); no library declaration opened, since the change touches no Lean statement.
- Record: no layer or item removed, retitled or renumbered against the merge base; the two added headings are supplier-contract subsections, as before.
- Pull request text: the title and the section "Citations of Mazur–Rubin" agree with the diff (31 lines; 14 + 13 + 3 + 1 + 1 = 32 places); each listed correction was found at lines 31, 41–64, 303, 315, 341, 361, 379, 424, 448, 460, 472, 783, 1007, 1026–1028, 1053, 1191, 2377, 4277, 4813, 5020, 5032, 5046, 5059, 5171, 5290, 5921.

Overlap check: read HeegnerPointEulerSystems, SelmerIwasawaCohomology (`main` and the cited revision), EulerSystemsCyclotomicMainConjecture; the change shares no object with them (it alters citations only); the simple local conditions with `Δ(F)` stay owned by SelmerIwasawaCohomology and the finiteness of continuous cohomology by ArithmeticGaloisDuality, both cited here.

Source independence: changed passages only; 9 passages compared with 1 source (Mazur–Rubin 2016, arXiv v1: Notation, Proposition 3.3, Lemma 5.2 with its proof, Corollary 5.3, §5.2, Proposition 5.9), none shared; the passages citing Mazur–Rubin 2004 could not be compared, the memoir being unread; largest share Rubin, Euler Systems, 102 of 343 linked locators, cited by no changed passage; arrangement not compared (no layer added, removed or reordered).

Research link: the roadmap is the Euler- and Kolyvagin-system descent of Rubin (2000), Mazur–Rubin (2004, 2016), Howard (2004) and Burns–Sakamoto–Sano (2018), consumed by Heegner-point, cyclotomic-unit and Kato-class bounds; the change ties its Selmer structures to Selmer complexes. Rests on the README overview and References.

## Not verifiable

- The changed citations of Mazur–Rubin 2004 (§0.5; Chapter 3, second paragraph; Definitions 3.1.3 and 6.1.1; Lemmas 1.2.3, 3.7.1`(ii)`, 3.7.3, 5.3.4–5.3.5, 5.3.13, 6.1.2, 6.1.5; Proposition 6.1.6; Remark 6.1.8; Corollary 5.3.15; Theorem 5.3.10, pp. 66–67; §5.2 standing hypotheses; Chapter 4, pp. 35–53; the number A.2.6 of the corollary of Rubin's book): the memoir is paywalled, an author's page that should carry it did not answer, and the copy the README links is on a third party's page, which was not read. Only Proposition 3.6.1 and Lemma 3.7.1`(i)` were confirmed, through MR16 and BSS II.
- The published page numbers of the 2016 paper: only arXiv v1 was read, which is the version the README cites.
- The description's account of how the text was drafted and reread cannot be checked from the head.

## Source issues

- none

## For the human reviewers

- **Merge order.** The README cites SelmerIwasawaCohomology §§2.22a, 2.23a and 2A.8 (lines 53, 250, 337, 450, 5867 and the `*Needs:*` lines), defined only at the head of that roadmap's open revision, which the description names under "Depends on". That revision merges first.
- **Licence.** `README.md` Layer 0.1 (lines 43–49) and later: the Mazur–Rubin "Kolyvagin systems" link is a copy on a third party's institutional page, not an author's page or the publisher.
- **Not tested.** Mazur–Rubin 2004 could not be read legally; about two thirds of this revision's 32 corrections concern it and rest on the author's comparison. Rubin's "Euler Systems", the source with the largest share of locators, is cited by no changed passage and was not opened.
