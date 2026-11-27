# Review of EulerSystemsAndKolyvaginSystems (pull request #3188 at e209bb2)

**Verdict:** accepted

**Summary.** An incremental re-review of the 6 lines changed since `c6c0acc`: accepted, with no finding. The three cross-references that the previous format note asked about now name Layer 1.2, Layer 0.10 and Layer 8.9, and each named layer does supply what the citing sentence uses (checked by computation below). There is no small correction and one format note, on further label-style references in untouched text; the dependency on the open SelmerIwasawaCohomology revision, the licence of one linked copy and the unread memoir remain for the human reviewers.

## N01 — Six more references by hyphenated label, which no heading defines, remain in untouched text

The same pattern as the three just repaired: "in ring-class-local-operator" (lines 2039 and 2765), "the setting of euler-to-kolyvagin" (line 2496), "the constant of iwasawa-evaluation-maps" (line 5478, apparently Layer 8.10), "as in true-iwasawa-selmer-and-singular-quotient" (line 5695), and, pointing into a supplier, "unramified-dimension-count of SelmerIwasawaCohomology L2" (line 465) and "SelmerIwasawaCohomology L2, dual-selmer-structure" (line 4520). A reader who searches for these finds no heading. Naming the layer or the supplier section each one means would finish the repair; it can go in a separate change.

## Previous findings

- The previous report had no finding (no R-numbered point) and no small correction. Its format note N01 is repaired: line 781 now reads "the identifications of Layer 1.2 Finite and singular parts at an unramified prime", line 1231 "by Layer 0.10 Core rank of the canonical and unramified structures", line 4901 "of Layer 8.9 Twisting Euler systems by characters of infinite order". The repair introduced no new problem.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.8 proof route (line 781): `φ^fs` is `Q(Fr^{-1})` composed with the identifications of Layer 1.2 | `T = ℤ/p^k`, trivial action, `p^k` dividing `#𝔽^×` | `P(x) = 1 − x`, `Q = −1`; 1.2 (line 537) gives `H¹_f ≅ T/(Fr−1)T = ℤ/p^k` and `H¹_s ⊗ 𝔽^× ≅ T^{Fr=1} = ℤ/p^k`; `φ^fs = −1`, an isomorphism | Layer 1.2 states both identifications used; hypotheses (`\|𝔽^×\|·T = 0`, unramified) match 1.8 | none |
| 1.19 (line 1231): `χ(T_pE, F_can) = rank T_pE^− = 1` by Layer 0.10 | `T = T_pE`, `K = ℚ`, `p ≥ 5`, surjective mod `p` | 0.10 (a) (line 458): `rank T^− + corank H⁰(ℚ_p, T^*)`; `T^−` of rank 1 (determinant of conjugation is −1); `H⁰(ℚ_p, E[p^∞])` finite, corank 0; sum 1 | agrees with line 470 and with the statement at line 1223; 0.10 (a) needs `K = ℚ`, `(H.0)`–`(H.3)`, which 1.19 has | none |
| 8.14 (line 4901): `c^ρ` for `ρ: Γ → O^×` is the twist of Layer 8.9; `Tw_ρ(char X∞(T ⊗ ρ)) = char X∞(T)` | `X∞(T) = Λ/(γ − a)`; `ρ` trivial | 8.9 (line 4679) defines `c^ρ` for `ρ` factoring through a finite extension of `K∞`, characters of `Γ` included, and `Tw_ρ: γ ↦ ρ(γ)γ`; twist has `γ ↦ aρ(γ)`, char `(γ − aρ(γ))`, and `Tw_ρ` of it is `ρ(γ)(γ − a)`, the ideal `(γ − a)`; `ρ = 1`: identity | Layer 8.9 is the layer that defines both `c^ρ` and `Tw_ρ`; convention consistent | none |

The rows for the untouched statements of the folder stand as in the previous review, of `c6c0acc`.

- Source locators checked against the text: 0; the change adds, removes or alters no locator.
- Seeded sample: none of the fifteen targets lies in a changed passage (the nearest are 1.20, which follows the changed 1.19, and 8.12, in the same layer as 8.14); nothing to check there.
- Headings resolved in the README: 3 (Layer 1.2 at line 535, Layer 0.10 at line 456, Layer 8.9 at line 4677), each with the title the new text gives.
- Cross-roadmap citations: none changed. SelmerIwasawaCohomology §§2.22a, 2.23a, 2A.8 are still defined only at the head of that roadmap's open revision, which the description names; no open pull request drops an id cited here or changes this roadmap.
- Dependency check: `depcheck: 94 roadmaps, 1058 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Automatic checks at `e209bb2`: all pass; no file changed outside the folder.
- Elaboration of `Suggested.lean` (unchanged): two warnings, both `declaration uses sorry` (102:8, 120:8); no library declaration opened, since the change touches no Lean statement.
- Record and pull request text: no layer or item removed, retitled or renumbered against the merge base; the description's sentence "Three more, in Layers 1.8, 1.19 and 8.14, now name Layer 1.2, Layer 0.10 and Layer 8.9" agrees with the diff, and nothing else in the title or description is changed by it.

Overlap check: read HeegnerPointEulerSystems, SelmerIwasawaCohomology (`main` and the cited revision), EulerSystemsCyclotomicMainConjecture; the change shares no object with them (it alters three internal cross-references only); the simple local conditions with `Δ(F)` stay owned by SelmerIwasawaCohomology and the finiteness of continuous cohomology by ArithmeticGaloisDuality, both cited here.

Source independence: changed passages only; 3 passages compared with 0 sources, none shared (each is a cross-reference to a heading of this README and carries no source wording); largest share Rubin, Euler Systems, 102 of 343 linked locators, cited by no changed sentence and not opened; arrangement not compared (no layer added, removed or reordered).

Research link: the roadmap is the Euler- and Kolyvagin-system descent of Rubin (2000), Mazur–Rubin (2004, 2016), Howard (2004) and Burns–Sakamoto–Sano (2018), consumed by Heegner-point, cyclotomic-unit and Kato-class bounds; the change ties its Selmer structures to Selmer complexes. Rests on the README overview and References.

## Not verifiable

- The citations of Mazur–Rubin 2004 corrected in the earlier commits of this pull request (listed in the previous review): the memoir is paywalled and the copy the README links is on a third party's page, which was not read. This round's change touches none of them.
- Rubin, Euler Systems, Ch. VI §4, Theorem 4.1 (the source of 8.14): not opened this round; the changed sentence alters only the internal pointer, and the convention was checked against Layer 8.9 by computation.
- The description's account of how the text was drafted and reread cannot be checked from the head.

## Source issues

- none

## For the human reviewers

- **Merge order.** The README cites SelmerIwasawaCohomology §§2.22a, 2.23a and 2A.8 (lines 53, 250, 337, 450, 5867 and the `*Needs:*` lines), defined only at the head of that roadmap's open revision, which the description names under "Depends on". That revision merges first.
- **Licence.** `README.md` Layer 0.1 (lines 43–49) and later: the Mazur–Rubin "Kolyvagin systems" link is a copy on a third party's institutional page, not an author's page or the publisher.
- **Not tested.** Mazur–Rubin 2004 could not be read legally; about two thirds of this revision's 32 citation corrections concern it and rest on the author's comparison. Rubin's "Euler Systems", the source with the largest share of locators, is cited by no changed sentence and was not opened.
