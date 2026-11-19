# Review of IgusaVarietiesAndTorsionConcentrationPartII (pull request #2439 at b73d2bf)

**Verdict:** accepted

**Summary.** Accepted: this is an incremental re-review of 0 changed lines since b73d2bf, and it reads the pull request's title and description against the head. The folder is unchanged and no finding stands. The loose clause of the summary block that the previous review pointed out is repaired. One small correction remains, on a sentence of the description's paragraph about §11.9 that leaves out the hypothesis of infinitely many generic places; it does not block. Nothing is left for a human to decide beyond the final approval.

## C01 — The description's paragraph on §11.9 does not say that cohomological genericity needs infinitely many generic places

The second paragraph of the description says that §11.9 "gives vanishing off the middle degree at an eigensystem decomposed generic at one split place above a prime at which the level is hyperspecial, and from it cohomological genericity in the sense of the parent's §7.2". A reader takes the single place to be the hypothesis of both conclusions. §11.9(2) (README line 590) asks for decomposed genericity at infinitely many places of `F⁺` split in `F`, and the Check of §11.9 (line 610) shows that one witness is not enough: with `Σ⁺′ = Σ⁺ ∪ {w}` the polynomial `H_w` is not in `𝕋^{Σ⁺′}_N[X]` and (1) is silent. The summary block above the paragraph now has it right. A sentence that would be right: "…and from it, for an eigensystem decomposed generic at infinitely many split places, cohomological genericity in the sense of the parent's §7.2."

## Previous findings

- The previous report had no finding (no R01).
- C01 — repaired: the summary block now reads "decomposed genericity at one split place gives vanishing off the middle degree, and at infinitely many, cohomological genericity", which is §11.9(1)–(2). The paragraph below it still has the loose form (C01 of this report).

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result |
|---|---|---|---|
| §11.9(2), as the description cites it | one witness `w`, `Σ⁺′ = Σ⁺ ∪ {w}`; infinitely many witnesses | One: `H_w ∉ 𝕋^{Σ⁺′}_N[X]`, (1) silent. Infinitely many: finitely many places above `ℓ` and below `Σ⁺′`, a witness remains | README true; summary block agrees; second paragraph omits "infinitely many" (C01) |
| §11.9 Check on decomposed genericity | `𝔽_11`, `‖w‖ = 7`, roots `{1, 2}` and `{3, 3}` | `2/1 = 2`, `1/2 = 6` (`2·6 = 12 ≡ 1`), neither `1` nor `7`: generic. `3/3 = 1`: not generic | Check true |
| Description: "any CM field that is not imaginary quadratic" against README "`F⁺ ≠ ℚ`" | `F⁺ = ℚ`; `[F⁺:ℚ] = 2` | `F⁺ = ℚ`: `[F:ℚ] = 2`, `F` imaginary quadratic. `[F⁺:ℚ] ≥ 2`: `[F:ℚ] ≥ 4` | the two conditions are equivalent |
| Description: "Four supplier statements are registered as gaps", two per supplier | slugs in the supplier contracts (README lines 717, 719, 728, 729) | EndoscopicTransferAndUnitaryTraceComparison: auxiliary-character-finite-avoidance, unitary-torus-igusa-trace. AutomorphicGaloisRepresentationsPartII: unitary-discrete-local-comparison, division-algebra-unitary-base-change. Total 4 | agrees |
| Description: "`Suggested.lean` states the two auxiliary-prime existence theorems" | declarations of the file | 2 definitions (`IsStrongGenericAt`, `IsCompletelySplitStrongGenericPrime`), 2 theorems (§8.8(a), (b)); docstring names Layers 9–11, §11.9 and §8.7 as not statable | agrees |

The rows of the previous review for untouched statements stand as in that review, of b73d2bf.

- Folder change since b73d2bf: 0 lines; nothing changes outside the roadmap folder (the outside-folder diff is empty).
- Pull request text read against the head: title; summary block (3 paragraphs); 6 paragraphs of prose. Layer 8 list against the headings of §§8.1–8.9, Layers 9–11 against §§9.1, 9.3, 10.1, 10.3, 11.5–11.9, the folder's three files, the four gaps. One sentence loose (C01); none contradicted.
- Library declarations opened at the pin (those the docstrings and the description's "Tau Ceti's Chebotarev theorem" rest on): `NumberField.Chebotarev.infinite_frobeniusPrimeSet` (`TauCeti/NumberTheory/Chebotarev/Density/Chebotarev.lean:74`), `hasDirichletDensity_frobeniusPrimeSet` (same file, line 51), `TauCeti.hasDirichletDensity_inter_compl_higherDegreePrimes_iff` (`TauCeti/NumberTheory/ArithmeticDirichletSeries/DirichletDensity/Negligible.lean:254`).
- Cross-roadmap name resolved: the hypothesis `LocallySymmetric.FrankeInput` (README lines 769, 779) is a name of ArithmeticLocallySymmetricSpaces on main, cited as that roadmap's; it is not claimed of the pinned libraries.
- Automatic checks at b73d2bf: every check passed. Dependency check, run again: `depcheck: 199 roadmaps, 2189 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `Suggested.lean`, run again: two `sorry` warnings (lines 89 and 104), nothing else. The 4 elaborated types are those of the previous review; no binder is lost.
- Declared gaps: the four slugs of the plan agree with the README, unchanged since the previous review.
- Source locators: none added or changed; the seeded sample falls in no changed passage.

Overlap check: read IgusaVarietiesAndTorsionConcentration, AutomorphicGaloisRepresentationsPartII, EndoscopicTransferAndUnitaryTraceComparison; shared objects and owners as in the previous review (cohomological genericity: the parent's §7.2, with the implication from decomposed genericity owned here; local strong genericity: AG2.7; `ϖ`, the stable–twisted identity and `Sh(V, K)`: EndoscopicTransferAndUnitaryTraceComparison); no open pull request changes this roadmap or drops an id it cites.

Source independence: changed passages only; the folder did not change, so 0 passages were compared with 0 sources this round; largest share CS17, as in the previous reviews; no layer is added, removed or reordered, so the contents were not compared again (previous result: independent).

Research link: Layers 8–11 prove Caraiani–Scholze 2017, Theorems 1.1 and 6.3.1; §11.9 is Proposition D.1.3 of Liu–Tian–Xiao–Zhang–Zhu 2022, which they use as the genericity input for their Beilinson–Bloch–Kato results. Rests on the README's references and on CS17 and LTXZZ as read.

## Not verifiable

- The proof of the claim in [Shin-BCU] Proposition 1.4 that part (c) of gap:unitary-torus-igusa-trace refers to: not opened; the passage is unchanged and is cited through LTXZZ lines 10667–10671.
- The description's sentence on the number of earlier review rounds: it describes the process, not the folder, and was not checked.

## Source issues

- none

## For the human reviewers

- none
