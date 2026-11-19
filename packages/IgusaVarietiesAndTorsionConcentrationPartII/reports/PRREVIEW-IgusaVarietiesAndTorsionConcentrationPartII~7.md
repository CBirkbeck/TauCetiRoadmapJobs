# Review of IgusaVarietiesAndTorsionConcentrationPartII (pull request #2439 at b73d2bf)

**Verdict:** accepted

**Summary.** Accepted: this is an incremental re-review of 0 changed lines since b73d2bf, and it reads the pull request's title and description, as they stand now, against the head. The folder is unchanged and no finding stands. The one small correction of the previous review, on the description's paragraph about §11.9, is repaired: the paragraph now asks for decomposed genericity at infinitely many split places before it concludes cohomological genericity. There are no small corrections and no format notes, and nothing is left for a human to decide beyond the final approval.

## Previous findings

- The previous report had no finding (no R01).
- C01 — repaired: the description's second paragraph now reads "and from it, for an eigensystem decomposed generic at infinitely many split places, cohomological genericity in the sense of the parent's §7.2", which is §11.9(2) (README line 590).

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result |
|---|---|---|---|
| §11.9(1)–(2), as the description's second paragraph and summary block cite them | one witness `w` with `Σ⁺′ = Σ⁺ ∪ {w}`; infinitely many witnesses | One: `H_w ∉ 𝕋^{Σ⁺′}_N[X]`, (1) silent. Infinitely many: finitely many places above `ℓ` or below `Σ⁺′`, a witness remains | README true; both passages of the description now state "one place" for (1) and "infinitely many" for (2) |
| §11.9 Check on decomposed genericity | `𝔽_11`, `‖w‖ = 7`, roots `{1, 2}` and `{3, 3}` | `2/1 = 2`, `1/2 = 6` (`2·6 = 12 ≡ 1`), neither `1` nor `7`. `3/3 = 1`; `7·3 = 21 ≡ 10 ≠ 3` | Check true |
| Description: "any CM field that is not imaginary quadratic" against README "`F⁺ ≠ ℚ`" | `F⁺ = ℚ`; `[F⁺:ℚ] = 2` | `F⁺ = ℚ`: `[F:ℚ] = 2`, imaginary quadratic. `[F⁺:ℚ] ≥ 2`: `[F:ℚ] ≥ 4` | equivalent |
| Description: "Four supplier statements are registered as gaps", two per supplier | slugs in the supplier contracts (README lines 717, 719, 728, 729) | EndoscopicTransferAndUnitaryTraceComparison: 2 (auxiliary-character-finite-avoidance, unitary-torus-igusa-trace). AutomorphicGaloisRepresentationsPartII: 2 (unitary-discrete-local-comparison, division-algebra-unitary-base-change). Total 4 | agrees |
| Description: "(whose PEL algebra is not simple)" | the datum of §11.9 | algebra `F × F` on `W₀ ⊕ V`, two simple factors (README lines 598, 665) | agrees |
| Description: "`Suggested.lean` states the two auxiliary-prime existence theorems" | declarations of the file | 2 definitions, 2 theorems (§8.8(a), (b)); the docstring names Layers 9–11, §11.9 and §8.7 as not statable | agrees |
| Description: "Roadmap folder … (README, `Suggested.lean`, `metadata.toml`)"; the title "roadmap" | files of the folder; the folder on main | 3 files at the head; the folder is absent from main, 919 lines added, 0 removed | agrees: the pull request adds the roadmap |

The rows of the earlier reviews for untouched statements stand as in the previous review, of b73d2bf.

- Folder change since b73d2bf: 0 lines; nothing changes outside the roadmap folder (the outside-folder diff is empty).
- Pull request text read against the head: the title; the summary block (3 paragraphs); 8 paragraphs of prose. The Layer 8 list against the headings of §§8.1–8.9; the trace-formula sentences against §§9.1, 9.3, 10.1, 10.3 (Matsushima's formula, README line 394); the last-layer sentences against §§11.5–11.9; the LTXZZ locators (Proposition D.1.3, Corollary D.1.4) against README lines 586 and 652; the four gaps. No sentence is contradicted and no change of the folder is left unstated.
- Cross-roadmap citations resolved for the passages the description cites: IgusaVarietiesAndTorsionConcentration §7.2 (open, earlier in the merge order), the two gap suppliers on main, SchemeAndStackFoundations on main. The automatic citation check lists one name found in neither pinned library, `LocallySymmetric.FrankeInput` (README lines 769, 779): it is cited as a hypothesis of ArithmeticLocallySymmetricSpaces, not of the libraries.
- Automatic checks at b73d2bf: every check passed. Dependency check, run again: `depcheck: 199 roadmaps, 2190 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `Suggested.lean`, run again: two `sorry` warnings (lines 89 and 104), nothing else. The file is unchanged, so the 4 elaborated types and the one-tactic probe stand as in the previous reviews.
- Declared gaps: the four slugs agree between the plan and the README, unchanged.
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
