# Review of TotallyDistributiveTopoi (pull request #1927 at d009274)

**Verdict:** accepted

No finding. The folder is unchanged since 888b789; the description now agrees with the head.

## Previous findings

- R01 — repaired: the description's Layer 2 now reads "a Check on `SingleObj (Multiplicative ℕ)`, the monoid `(ℕ, +)`, shows the hypothesis is needed", as README 363 and 393 do.
- R02 — repaired: the description now reads "It builds on GrothendieckTopoi 1.1, 1.2, 1.4, 2.3, 5.2, 5.6, 6.5 and 7.1", and Layer 3 says "the localic forms" with no parenthesis.
- R03 — repaired: Layer 4 now states the basis criterion with "the Cantor space, its clopen instance"; AI assistance names "the enough-projectives criterion of 4.2" among the statements given with proofs here.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| Description, Layer 2: the Check of 2.4 on `SingleObj (Multiplicative ℕ)` (README 363–365, 393–397) | `ofAdd 2 ≫ ofAdd 3`; the ideals `{m ≥ n}`; the same composite in `SingleObj ℕ` | `ofAdd 2 ≫ ofAdd 3 = ofAdd 5` by `rfl`; `⋂ₙ {m ≥ n} = ∅` (witness `m + 1`); in `SingleObj ℕ`, `2 ≫ 3 = 6` | description and README agree | none |
| Description's supplier sentence against the contract (README 127–138) and the *Needs:* line of 2.2 (320) | each of the 8 sections at GrothendieckTopoi head 46fa6f3 | 1.1 at 287, 1.2 at 309, 1.4 at 357, 2.3 at 459, 5.2 at 816, 5.6 at 900, 6.5 at 1053, 7.1 at 1192; description names 8 of 8 | agree | none |
| Description, Layer 4 and AI assistance, against 4.2 (README 592–609) | `U = ∅`; Cantor clopens; `ℝ` | empty family refines a cover of `∅`, union `∅`; Cantor: clopen covers have finite disjoint clopen refinements; `ℝ`: connected intervals admit no disjoint refinement of a two-set cover | agree; "(own argument)" at 597 matches | none |
| Description, **Checks run.** | declaration count, gate, elaboration | 30 declarations; gate 0 on every check; `lake env lean`: exit 0, 20 `sorry` warnings, nothing else | true | none |

Rows for statements this round does not touch stand as in the previous review, of 888b789.

- **What changed:** the folder changed by 0 lines since 888b789; `git diff --stat origin/main...HEAD` outside the folder is empty (the nine files listed as changed since 888b789 come from merging main); `lake-manifest.json` and `lean-toolchain` are unchanged, so the pins are those of the previous review.
- **Gate and elaboration:** the gate on this head (`--base origin/main`) reports 0 on every check, OK; the worker's gate reports `build=0`; `lake env lean` on `Suggested.lean` exits 0 with 20 `sorry` warnings and nothing else. The earlier `#check @name` comparison and one-tactic probe stand, the file being byte-identical.
- **Dependency check:** `depcheck: 245 roadmaps, 2229 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line. The roadmap is at line 412 of the merge order; its one supplier, GrothendieckTopoi, is an open new-roadmap pull request named in the description's depends-on block.
- **Supplier citations resolved at GrothendieckTopoi 46fa6f3 (8 sections, 6 declarations):** `isGrothendieckTopos_iff_giraudAxioms` (Suggested 168), `GeometricMorphism.isEssential_iff_preservesProducts` (438), `exists_equiv_presheaf_iff_essential_points` (470), `epi_piMap_presheaf` (482), `isIso_sigma_pi_presheaf` (488), `Frame.grothendieckTopology` (554); 5.2 still states the case `F = Type u` and `Sh(X)` locally connected iff `X` is (816–827); its Scope (78) and Downstream consumers (1625–1629) still name this roadmap as owner of (A) and (B). The two names of `citations.md` are accounted for: the first is the supplier's (438), the second a generated Mathlib instance name passed in the previous review.
- **Library declarations opened at the pin (2):** `CategoryTheory.SingleObj` and `SingleObj.comp_as_mul` (`Mathlib/CategoryTheory/SingleObj.lean:52`, `:75`), through a scratch probe that elaborates the three computed values of the first row.
- **Overlap check:** read GrothendieckTopoi, ClassifyingTopoi, ToposTheoreticBridges; nothing shared. `overlaps.md` lists no other pull request changing this roadmap, no dropped id, no id only an open revision defines, and no roadmap on main close in vocabulary.
- **Source independence:** changed passages only; the folder changed by 0 lines, so no passage was compared and no layer was added, removed or reordered; the comparison of the earlier full review stands, and the seeded sample falls in no changed passage.
- **Remark on untouched text:** README 396 writes "presheaves on `SingleObj ℤ`" for sets with an automorphism; in Mathlib that is the monoid `(ℤ, ·)`, and `SingleObj (Multiplicative ℤ)` is the category meant.

## Not verifiable

- **Published Lucyshyn-Wright.** JPAA 216 (2012), doi:10.1016/j.jpaa.2012.03.018, resolves only to a paywalled page; earlier rounds checked its locators against arXiv:1108.4032v3.
- **SGA 4 IV, Exercice 7.6.** Reached only through GrothendieckTopoi's citations; not opened.
- **Statements without a literature locator.** 2.3, the first statement of 2.4, 3.4 and the general statement of 4.2 were checked only through their routes and the instances in the tables.

## Source issues

- none

## For the human reviewers

- Four targets have no literature locator and rest on the roadmap's own proofs: 2.3 (README 344), the first statement of 2.4 (369), 3.4 (494) and the general statement of 4.2 (595–597, "own argument"). The description's AI-assistance paragraph now says so of all four.
- The question the roadmap answers is cited to a 1973 lecture recording on YouTube (README 653–658, 688–690). No target rests on it, and its licence status was not checked.
