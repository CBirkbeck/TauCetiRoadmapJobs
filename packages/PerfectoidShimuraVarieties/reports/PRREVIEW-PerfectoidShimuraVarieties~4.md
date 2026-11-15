# Review of PerfectoidShimuraVarieties (pull request #1085 at 8842452)

**Verdict:** accepted

Incremental re-review of the 5 lines changed since `e6686d6` (the README's baseline sentence and the first paragraph of the `Suggested.lean` docstring), and of the pull request's title and description against this head. No finding.

## Previous findings

- R01 — repaired: `TauCetiRoadmap/PerfectoidShimuraVarieties/Suggested.lean` lines 6–7 now read "**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`."; the sentence about target signatures is gone.
- R02 — repaired: the description now says "`Suggested.lean` declares nothing: no headline theorem is statable …", "the targeted Lake build succeeds, with no `sorry` warning since the file has no declaration", and "The author's red-team repairs are included."

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| README line 33, baseline pins | `lake-manifest.json` entries `mathlib` and `TauCeti` | README: `1b1ccf4b…a81e1e`, `2fd255d9…444ce5`; manifest: the same two revisions, character for character | ok | none |
| Supplier declarations under the changed baseline sentence | all 22 distinct `mathlib:` / `tauceti:` names, opened in the named module at the new pins | all 22 present, e.g. `Matrix.J` `SymplecticGroup.lean:59`, `frobenius` `CharP/Lemmas.lean:325`, `MulAction.toPermHom` `Action/End.lean:184`, `TauCeti.exists_continuous_section` `Section.lean:230`, `adjugateGL_mul` `Adjugate.lean:79` | ok | none |
| `adjugateGL_mul` "reversed product law" (README line 57) | pinned statement, `Adjugate.lean:79` | `adjugateGL (g * h) = adjugateGL h * adjugateGL g`: reversed, as the README says | ok | none |
| `Suggested.lean` docstring, "No headline theorem is statable" | grep of both pins for `PerfectoidSpace`, `ShimuraDatum`, `ShimuraVariety`, a diamond structure | 0 files; Mathlib has perfectoid rings and `BDeRham` only (`Mathlib/RingTheory/Perfectoid/`), Tau Ceti has `AdicSpace/` | ok | none |
| README line 173 against the docstring and the description | the list of absent carriers in each | all three name Shimura models and towers, perfectoid spaces, diamonds, Hodge–Tate filtrations, coefficient torsors; no disagreement | ok | none |
| Description: "adds the roadmap folder … and changes nothing outside it" | diff against the base outside the folder; the worker's change summary | 0 files outside; 3 files added (README, `Suggested.lean`, `metadata.toml`), 2475 insertions, 0 Lean declarations | ok | none |

The rows for the untouched statements stand as in the previous review, of `e6686d6`.

- Gate at `8842452`: every check passes (`build=0 depcheck=0 stray-files=0 outside-folder=0 … OK`); my rerun prints the same checks, all 0.
- Dependency check: `depcheck: 246 roadmaps, 2253 edges, 0 problem(s)`; no UPWARD or CYCLE line (PerfectoidShimuraVarieties is line 188 of the merge order, after AutomorphicBundles 186 and HodgeTateAndCanonicalSubgroups 187).
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with no output; the file has no declaration, so no `#check` comparison and no padding probe apply.
- Library declarations opened at the new pins: 22 (the table's second row). Source locators: the diff changes none, and none of the 15 seeded targets lies in a changed passage.
- Cross-roadmap citations: the diff changes none; the worker's resolver finds no citation that resolves nowhere, and the overlap listing has no dropped id, no competing pull request and no second copy.
- Pull request text: the title equals the README's heading; the summary block and the prose (adds the folder, nothing stated in Lean and why, suppliers by name, build without warning, gate and dependency check clean) agree with this head.
- Overlap check: read HodgeTateAndCanonicalSubgroups, AutomorphicBundles, OverconvergentAutomorphicForms, ShimuraCompactifications, IgusaVarietiesAndTorsionConcentration, PerfectoidTowers, DiamondsAndVStacks, PerfectoidSpaces; nothing shared (unchanged since the review of `e6686d6`; the diff touches no ownership statement).

Source independence: changed passages only; 2 passages compared (the baseline sentence and the docstring paragraph), which cite no source and share nothing with one; largest share scholze-torsion-annals, 64 of 203 bracketed locators; the diff adds, removes or reorders no layer, so the contents were not compared again.

## Not verifiable

- Faltings–Chai, *Degeneration of Abelian Varieties*, V Theorem 2.5(4)–(6), pp. 152–153 (cited in the README for §1.22): no open copy; not read, as in the previous reviews.

## Source issues

- none

(No source was opened this round; the issues recorded by the reviews of `917a589` and `e6686d6` stand.)

## For the human reviewers

- **Licence.** [BP25] is the authors' revised manuscript of *Higher Coleman theory* on an author's homepage (PDF dated 3 March 2025), not a published version; 17 locators cite it (README References).
- **Licence.** [HJ] is cited in its arXiv v2 of 29 August 2025, a revision later than the published article, from which the pre-abelian period map was removed (README References); 25 locators.
