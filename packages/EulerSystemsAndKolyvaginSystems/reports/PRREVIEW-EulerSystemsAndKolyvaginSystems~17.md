# Review of EulerSystemsAndKolyvaginSystems (pull request #3188 at 5711c1e)

**Verdict:** accepted

**Summary.** An incremental re-review of the 4 lines changed since `32082bb`, together with the title and description as they now stand: accepted, with no finding. Both small corrections of the previous review are repaired: Layer 8.5 now refers a Selmer structure over `Λ` to Layer 0.1, whose coefficient rings include `Λ` (checked below), and the description's count of rewritten references is right. The title and description agree with the head. One format note is carried over, not blocking; the dependency on the open SelmerIwasawaCohomology revision, the licence of one linked copy and the unread memoir remain for the human reviewers.

## N01 — Two references by label remain, as the description says

Line 987 ("the counterexample in arbitrary-subquotient counterexample") and line 5600 (a list of seven underscore-separated names that no heading or declaration defines) are unchanged; a reader who searches for them finds nothing. The description reports both as undetermined, so this is for a later change.

## Previous findings

- The previous report had no finding (no R-numbered point). Its two small corrections and its format note are accounted for here.
- C01 — repaired: line 4520 reads "is a Selmer structure over `R = Λ` in the sense of Layer 0.1 Selmer triples and squarefree conductors", and the `*Needs:*` line of 8.5 (line 4562) names Layer 0.1 in place of SelmerIwasawaCohomology §2.13. No new problem: 8.5 no longer uses §2.13 anywhere, and the Layer 8 dependency list already names Layer 0.1 (and keeps §2.13, which 8.8 uses, line 4675).
- C02 — repaired: the description now says "Fifteen further references of the same kind … and one, in Layer 8.19, states the convention `Ind(0) = 0` it referred to", which is what line 5087 shows.
- N01 — not repaired, by the author's stated choice: written again above.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 8.5 (line 4520): a `Λ`-adic Selmer structure is a Selmer structure over `R = Λ` in the sense of Layer 0.1 | `O = ℤ_p`, `Λ = ℤ_p[[X]]`, `𝐓 = Λ^r`, `r = rank T` | `Λ` complete noetherian local, `m = (p, X)`, `Λ/m = 𝔽_p` finite; `𝐓` free of rank `r` over `Λ`; Layer 0.1 (lines 39–41) asks exactly this | Layer 0.1 covers `𝐓` | none |
| 8.5: the discarded pointer (SelmerIwasawaCohomology §2.13) against the new one | `𝐓 = Λ` | `Λ/(γ − 1)^n` has `O`-rank `n`, unbounded, so `𝐓` is not finitely generated over `O` (the hypothesis of §2.13); over `Λ` it has rank 1 | only Layer 0.1 applies | none |
| 8.5: support and dual as Layer 0.1 requires | `Ψ` the tautological character of a `ℤ_p`-extension | `Ψ` ramifies only above `p`, so the ramified primes of `𝐓` are those of `T` and `S_p`, all in `Σ(F_Λ)`; `𝐓* = Hom(Λ^r, μ_{p^∞})` is `m`-power torsion with `m`-torsion `(Λ/m)^{r∨} = 𝔽_p^r`, finite | `𝐓*` is discrete of cofinite type; `Σ(F_Λ*) = Σ(F_Λ)` as in Layer 0.1 | none |
| 8.5 instance (a), canonical structure, against Layer 0.1 "unramified condition elsewhere" | `v ∤ p`, infinite decomposition group | `H¹(K_v, 𝐓) = H¹_ur(K_v, 𝐓)` (line 4522), so full at `v ∈ Σ` and unramified off `Σ` agree | consistent with Layer 0.1 | none |

The rows for the untouched statements of the folder stand as in the previous review, of `32082bb`.

- Source locators checked against the text: 0; the change adds, removes or alters no locator.
- Seeded sample: none of the fifteen targets (0.3, 0.4, 1.8, 1.23, 2.8, 3.20, 4.13, 5.2, 6.5, 7.4, 8.6, 8.8, 8.21, 8.22, 8.25) contains a changed sentence; the two changed sentences are both in 8.5.
- Headings resolved in the README: 2 (Layer 0.1 "Selmer triples and squarefree conductors", line 37; Layer 8.1, line 4346), each with the title the new text gives.
- Cross-roadmap citations resolved for the changed `*Needs:*` line: 4 (SelmerIwasawaCohomology §§2.5, 3.1, 3.2, 3.5 on main, same titles). For the description: ArithmeticGaloisDuality "Cohomological finiteness and perfect amplitude" (in §D7.3, line 4837 on main) and "Finiteness of Galois cohomology with restricted ramification" (in §R02.4.4, line 3081 on main) exist as it says. No open pull request drops an id cited here or changes this roadmap.
- Dependency check: `depcheck: 18 roadmaps, 22 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Automatic checks at `5711c1e`: all pass; no file changed outside the folder.
- Elaboration of `Suggested.lean` (unchanged): two warnings, both `declaration uses sorry` (102:8, 120:8); no library declaration opened, since the change touches no Lean statement.
- Title and description against the head: the title's two subjects (pointer sentences in Layers 0.1, 0.4, 0.7, 0.9; Mazur–Rubin citations) and the description's statements checked — revision of a roadmap on main, no numbered section added, two supplier-contract subsections added (lines 5867, 5955), `Suggested.lean` unchanged, suppliers added and the §2.13 edge dropped from 8.5, lines 987 and 5600 unchanged — each agrees with the head. Record: no layer or item removed, retitled or renumbered against the merge base.

Overlap check: read HeegnerPointEulerSystems, SelmerIwasawaCohomology (`main` and the cited revision), EulerSystemsCyclotomicMainConjecture; the change shares no object with them (it repoints one cross-reference from a supplier section to a layer of this roadmap); Selmer structures on modules finitely generated over `O` stay owned by SelmerIwasawaCohomology §2.13, and Selmer structures over a general coefficient ring by Layer 0.1 here.

Source independence: changed passages only; 2 passages compared with 0 sources, none shared (each is a cross-reference to a heading of this README and carries no source wording); largest share Rubin, Euler Systems, 102 of 343 linked locators, cited by no changed sentence and not opened; arrangement not compared (no layer added, removed or reordered).

Research link: the roadmap is the Euler- and Kolyvagin-system descent of Rubin (2000), Mazur–Rubin (2004, 2016), Howard (2004) and Burns–Sakamoto–Sano (2018), consumed by Heegner-point, cyclotomic-unit and Kato-class bounds; the change ties its Selmer structures to Selmer complexes. Rests on the README overview and References.

## Not verifiable

- The citations of Mazur–Rubin 2004 corrected in the earlier commits of this pull request, and the description's counts for them (145 places compared, 32 changed): the memoir is paywalled and the copy the README links is on a third party's page, which was not read. This round's change touches none of them.
- The description's account of how the text was drafted and reread cannot be checked from the head.

## Source issues

- none

## For the human reviewers

- **Merge order.** The README cites SelmerIwasawaCohomology §§2.22a, 2.23a and 2A.8 (lines 53, 105, 250, 275, 337, 391, 450, 454, 486, 5867), defined only at the head of that roadmap's open revision, which the description names under "Depends on". That revision merges first.
- **Licence.** `README.md` Layer 0.1 (lines 43–49) and later: the Mazur–Rubin "Kolyvagin systems" link is a copy on a third party's institutional page, not an author's page or the publisher.
- **Not tested.** Mazur–Rubin 2004 could not be read legally; about two thirds of this revision's 32 citation corrections concern it and rest on the author's comparison. Rubin's "Euler Systems", the source with the largest share of locators, is cited by no changed sentence and was not opened.
