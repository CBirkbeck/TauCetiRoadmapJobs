# Review of NeronModelsAndSemistableAbelianVarietiesPartII (pull request #870 at bfb3830)

**Verdict:** accepted

Incremental re-review of 0 changed lines in the folder since 9027cc3, and a check of the pull request's title and description as they stand now. No finding.

## Previous findings

- R01 — repaired: the description now reads "Roadmaps already on main that the README cites (StableReduction, SchemeAndStackFoundations, EllipticCurves, ReductiveGroupsPartII, JacobianChallenge, EtaleCohomologyFoundations, AlgebraicCurves, IntegralLattices, ModularCurves, ZigzagPreprojective) are consumed from main and are not prerequisites."; the consumer clause is gone.

## Verified sound

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| Description: "fourteen models: eleven with nonzero j, three with j=0", "completing his printed eleven models with three twisted semistable ones" (§6.1, §7.7) | models 12, 13, 14 in characteristic 2, where a₄=a₆=0 gives Δ=b₂²b₈+b₆²+b₂b₄b₆, j=a₁¹²/Δ | 12: t¹⁰+t¹²+t¹²=t¹⁰, j=t². 13: t¹¹, j=t. 14: t¹⁰+t⁹+t⁸=t⁸(t²+t+1), j=t⁴/(t²+t+1). All nonzero j; 8+3 nonzero, 3 zero; printed 8+3=11 | Pass; agrees with `README.md` §6.1 table rows 12–14 and §7.7 |
| `F2Model`, `genusOne_F2_classification` (§2.22; the description's "smooth binary tuples checked arithmetically") | the five tuples over F₂, affine solutions at x=0, 1 plus infinity | counts 1, 2, 3, 4, 5 in index order; Δ=1 for each (b₂²b₈=1 for indices 1, 3; b₆²=1 for 0, 2, 4); Hasse range at q=2 is 1..5 | Pass |
| Description: the ten main roadmaps the README cites | every roadmap name in `README.md` against the folders on main | exactly the ten named (occurrences 98, 54, 34, 8, 7, 6, 5, 3, 1, 1); none missing, none extra | Pass |
| Description: open suppliers | roadmap names in `README.md` not on main | AlgebraicModuliForArithmeticGeometry (17), ComplexComparisonPartII (11), NeronModelsAndSemistableAbelianVarieties (5), InverseGaloisAndArithmeticFundamentalGroups (4): the four of the depends-on block, all open new-roadmap pull requests, all earlier in the merge order | Pass |

The rows of the previous review, of 9027cc3, stand for every untouched statement.

- Pull request text against the head: the title equals the README's title; the summary block agrees with §2.1 (smooth proper curve base), §§1.9–1.11 (pinching in algebraic spaces, scheme criterion; "No Noetherian, quasi-separated, reduced …" at `README.md:312`, `609`), `README.md:102–104` (Mathlib's monogenic `conductor R x`), §§4.1–4.2 and §4.8 (Shioda–Tate with a section O), §6.1 and §7.4 (the family's hypotheses), §7.7 (eleven and three), Downstream consumers (the three Enriques inputs), `README.md:50–52`, `120–122` (Tau Ceti point counts reused). The folder line (README, `Suggested.lean`, `metadata.toml`) and "adds a roadmap" agree with the change: 3 files, 6 Lean declarations added, none removed.
- Source locators checked against the text: 3 (those the description's "printed eleven models" rests on). schroer line 1306, Theorem 10.4, p. 29; schroer line 1397, Theorem 10.5, p. 31; schroer line 1451, Proposition 11.1, p. 32 with its table on p. 33. The fifteen sample targets fall in no changed passage.
- Gate: the worker's run at bfb3830 passes every check, including `build`. Dependency check re-run: `depcheck: 245 roadmaps, 2216 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `TauCetiRoadmap/NeronModelsAndSemistableAbelianVarietiesPartII/Suggested.lean` at the branch's pins: exit 0, five `declaration uses sorry` warnings (lines 43, 53, 67, 83, 95), nothing else.
- Signatures: the six elaborated types compared with the README statements; no binder lost, no change since 9027cc3 (the file is identical).
- Changes outside the roadmap folder against `origin/main`: none. Overlap facts: no other open pull request changes this roadmap, no cited id dropped, no id defined only by an open revision, no citation or Lean name unresolved.
- Remark on untouched text: the stale attribution in StableReductionPartII's Scope noted in the previous review is in that pull request, not in this folder.

Overlap check: read EnriquesSurfacesAndIntegralNonexistence, FunctionFieldArithmeticPartII, StableReductionPartII, RelativeJacobiansAndIntegralCurveModels, AlgebraicModuliForArithmeticGeometryPartII, SchemeAndStackFoundations, ModularCurves, StableReduction as in the review of 9027cc3; the folder did not change, so nothing new is shared; genus-one fibration theory (§§2.1, 2.5, 4.1–4.2, 4.7–4.8, 4.17): owner this roadmap.

Source independence: changed passages only; the folder has no changed passage, 0 passages compared; largest share schroer, as in the review of fec9eae; contents not compared again, no layer added, removed or reordered.

## Not verifiable

- Ferrand §§4.1, 5.1, 5.4, 7.1 for §1.5: not re-read this round; no passage citing them changed.

## Source issues

- none

## For the human reviewers

- none
