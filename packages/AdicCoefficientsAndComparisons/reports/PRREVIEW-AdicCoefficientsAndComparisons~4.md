# Review of AdicCoefficientsAndComparisons (pull request #965 at c8f8961)

**Verdict:** accepted

Incremental re-review of 4 changed lines since 000e3d5 (the two pin hashes of `TauCetiRoadmap/AdicCoefficientsAndComparisons/README.md`, lines 355 and 1168), and of the pull request's title and description against this head. No finding.

## Previous findings

- R01 — repaired: the description has no "Validation" sentence; it now reads "The other backticked names of the layers (`AdicEtale.…`, `AdicSix.…`, `SchemeSupport.…` and the like, …) name README targets and tests; `Suggested.lean` does not declare them."

## Verified sound

**Adversarial table: the statement the changed text cites, and the changed passages (computed at this head).**

| Statement | Instances tried | Values | Result |
| --- | --- | --- | --- |
| README line 355: "Mathlib `1b1ccf4` and Tau Ceti `2fd255d`" | `lake-manifest.json` and the two package checkouts | manifest: mathlib `1b1ccf4b088b…`, TauCeti `2fd255d997f4…`; both checkouts at those commits; old hashes `6b7abb3`, `a91d3aa` occur nowhere in the folder | agrees |
| README line 1168: `IsEffectiveCartier` at Tau Ceti `2fd255d`, and the six lemma names of lines 1160–1163 | `TauCeti/AlgebraicGeometry/EffectiveCartierDivisor/Basic.lean` at the pin | definition line 78; `exists_eq_span_singleton_le` 89, `isEffectiveCartier_top` 106, `…_ofIdealTop_span_singleton` 116, `…_iff_exists_comap` 128, `…_iff_exists_isOpenImmersion` 153, `IsEffectiveCartier.comap` 196 | all resolve at the new pin |
| `cartierBoundary_strictRefinement` (cites the predicate of line 1168) | Y = ∅; j an isomorphism (Y proper over S); I = ⊥ on a nonempty C' | Y = ∅: C' = ∅, I = ⊤, support ∅ = (∅)ᶜ in ∅, g⁻¹(∅) = ∅: holds. j iso: C' = C, I = ⊤ (a = 1 regular), support ∅ = (range j)ᶜ: holds. I = ⊥: a = 0 not regular, so the boundary is never all of a nonempty C' | consistent with the pinned definition (local generator `IsSMulRegular`, no nonemptiness clause) |
| §3 "uses the following declarations as they are" at the new pins | 28 names of README lines 358–421 | Mathlib `AffineTransitionLimit.lean` lines 230, 289, 355, 361, 677, 1208; `IdealSheaf/Subscheme.lean` 658, 711, 768; `Sites/ElladicCohomology.lean` 64, 76; Tau Ceti `AdicSpace/Spa/Basic.lean` 105, 130, 146; `VectorBundle/FiniteLocallyFree.lean` 37, 108 | none missing after the pin change |
| Description: "adds the roadmap folder … (`README.md`, `Suggested.lean`, `metadata.toml`) and changes nothing outside it" | folder listing; diff against the merge base outside the folder | three files; outside diff empty | agrees |
| Description: "`Suggested.lean` declares the five names listed in README §8 … three Layer L2 theorems … each stated with `sorry`" | README lines 2043–2046; `Suggested.lean` lines 39, 43, 50, 75, 86 | 2 `def` with bodies on `IsOpenImmersion`, `QuasiCompact`, `IsProper`, `Set.range`; 3 theorems, 3 `sorry` warnings | agrees |
| Summary block: "locally of finite type over a complete DVR O with perfect residue field"; "Λ need not be noetherian"; "Characteristic-p schemes carry no finiteness hypothesis" | README lines 19–21, 156, 794 | line 156 "No noetherian hypothesis on `Λ` is made"; line 794 "No finiteness hypothesis"; lines 197–199 perfect residue field, locally of finite type | agrees |
| Summary block, consumers ("Étale duality and perverse sheaves … geometric Satake, lisse categories, Hecke stacks, Fargues–Fontaine diamond … analytic comparisons, weights and K-theory") | README §9, lines 2073–2081 | the four L0 consumers and EtaleDualityAndPerverseSheaves named there; L2 refinements "analytic comparison, weights, differential equations and K-theory" | agrees |

The rows of the previous reviews for the untouched statements of the folder stand as in the previous review, of `000e3d5`.

- Gate, rerun on this head: `gate AdicCoefficientsAndComparisons: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`; the worker's gate agrees (build=0).
- Dependency check: `depcheck: 247 roadmaps, 2240 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. Merge-order lines: DiamondsAndVStacks 21, EtaleCohomologyFoundations 44, ClassicalAdicEtaleCohomology 76, DiamondEtaleCohomology 77, DiamondSixOperations 78, this roadmap 108.
- Elaboration: `lake env lean` on `TauCetiRoadmap/AdicCoefficientsAndComparisons/Suggested.lean` gives three `declaration uses sorry` warnings (lines 50, 75, 86) and nothing else; both `TauCeti.*` imports exist at the pin. The five elaborated signatures keep every binder of the README statements; the file did not change.
- Description against the head: 16 sentences and the summary block checked, none contradicted; the pull request adds the roadmap (70 headings, 5 declarations, none removed), and the description says so. The pin change needs no statement in the description, which names no pin.
- Library declarations opened at the pins: 28 (files and lines in the table). Cross-roadmap citations reopened: none changed; suppliers on main (DiamondsAndVStacks, EtaleCohomologyFoundations, EnhancedDerivedSheaves, SchemeAndStackFoundations, StableReduction) are present there.
- Sample of §§2.1–2.9: no line of these sections changed and no source locator falls in the changed passages; none reopened.
- Overlap check: read DiamondSixOperations, VStackSheavesAndLisseCategories, FarguesFontaineDiamonds, ClassicalAdicEtaleCohomology (open), EtaleCohomologyFoundations, DiamondsAndVStacks, EnhancedDerivedSheaves (main); nothing shared: the first three hand adic coefficients (L0) and the scheme comparison to this roadmap by name, and no other `Suggested.lean`, open or on main, declares any of the five names.
- Source independence: changed passages only; 2 passages compared (both are commit hashes of the pinned libraries, with no source wording), none shared; arrangement and locator shares not recomputed (no layer added, removed or reordered).

## Not verifiable

- none this round: no source locator was reopened.

## Source issues

- none

## For the human reviewers

- **Licence.** The source cited most, [ECD], is read from an author version dated 14 April 2026 on the author's page and from arXiv:1709.07343v4 (README §10), [BP] from an author version, [Abe] from arXiv only.
- **Not tested.** This round compared no wording and no arrangement with [ECD]: the only change to the folder since the reviewed head is the two pin hashes, and the comparison was not repeated.
