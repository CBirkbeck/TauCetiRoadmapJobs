# Review of SchemeAndStackFoundations (pull request #2531 at cea30e1)

**Verdict:** accepted

**Summary.** An incremental re-review of the 9 lines changed since `3e72c55`. Accepted: the two added passages are correct. The sentence added to §1.1a's affine bullet names a Tau Ceti theorem that exists at the pin at the cited file and line with exactly the hypotheses the reduction ends in, and the sentence added to `## Downstream consumers` matches NeronModelsAndSemistableAbelianVarietiesPartII §1.9 on `main`. The previous report had no finding; its three small corrections and its format note are repaired. One small correction on the description, not blocking; nothing is left for a human to decide.

## C01 — The description still says that §1.1a reduces the locally finitely presented affine case to ModularCurves 0E, while the head ends that reduction at a Tau Ceti theorem

A reader of the description concludes that the fppf chain (§§1.1a, 1.2, 1.9a) waits on ModularCurves 0E; the head now says the opposite. The description has "§1.1a reduces the case of `p` locally of finite presentation to it by gluing over the base and refinement", where "it" is ModularCurves 0E; the affine bullet of §1.1a (lines 2376–2380) now ends the reduction at `TauCeti.DescentDatum.exists_isAffine_baseChange_hom_isIso` and says "this case does not wait for ModularCurves 0E". Text that would be right: "§1.1a reduces the case of `p` locally of finite presentation, by gluing over the base and refinement, to `S`, `S'` and `X` affine, where effectiveness is Tau Ceti's `TauCeti.DescentDatum.exists_isAffine_baseChange_hom_isIso`." The same paragraph's list of what Tau Ceti has at the pin could name that theorem beside `isIso_toBaseChangeDescended_hom`.

## Questions for the author

- Does Grothendieck's *Le groupe de Brauer III*, Théorème 11.7, cited in §2.10 for `smoothGroup_fppf_etale_comparison`, cover every smooth commutative group scheme, or does it carry a quasi-projectivity hypothesis? Česnavičius–Scholze, Theorem 5.2.6, covers affine smooth `G` only (cesnavicius-scholze line 2318). What stopped me: the text of *Brauer III* is not among the sources I can read. (Carried over; the change does not touch §2.10.)

## Previous findings

- The previous review, of `3e72c55`, had no finding (no R-numbered point).
- C01 (previous) — repaired: the description now says "The README is also put in the house layout by a reordering that changes no line of text" and "the two heads conflict in it: #2489 merges first, and this pull request is rebased onto it".
- C02 (previous) — repaired: the description now says PurityForFlatCohomology "agrees: its §0.2 takes the construction, `H⁰_Z`, the long exact sequence, open excision and the triple sequence from §2.9a".
- C03 (previous) — repaired: `## Downstream consumers` (lines 8748–8749) has "NeronModelsAndSemistableAbelianVarietiesPartII §1.9 uses the schemehood of separated locally quasi-finite algebraic spaces over a scheme (§1.9a)"; the description notes the edit owed on the other folder.
- N01 (previous) — repaired: §1.1a's affine bullet (lines 2376–2380) now ends "With `S`, `S'` and `X` affine, effectiveness is Tau Ceti's `TauCeti.DescentDatum.exists_isAffine_baseChange_hom_isIso`"; the description was not brought along (C01 above).
- D01 (previous) — resolved, as in the previous report.

## Verified sound

| Statement | Instances tried | Values on each side | Result; change |
|---|---|---|---|
| §1.1a affine morphisms, locally finitely presented case ends at `TauCeti.DescentDatum.exists_isAffine_baseChange_hom_isIso` (lines 2368–2380) | Hypotheses after the reduction; `S = Spec k`, `S' = ∐_ℕ Spec k`; `S' = ∅ = S` | Theorem at `Descent/Affine.lean:532` asks `IsAffine S`, `IsAffine S'`, `Flat p`, `IsAffine X.left`; reduction gives `S` affine, `T` finite union of affines, `X ×_{S'} T` affine over affine. One component: `q ≫ p = id`, model the fibre. Empty: model `∅` | Pass; namespace `TauCeti.DescentDatum` (file lines 69, 494), no `sorry` in the file |
| The parenthesis "for any flat `p` of affine schemes" | `Spec R_f → Spec R` (flat, not surjective); `Spec k → Spec k` | `R_f ⊗_R R_f = R_f`, so the datum on `B` is trivial and `B` over `R` is a model: `B ⊗_R R_f = B`; identity: model `X` | Pass; the theorem has no surjectivity hypothesis |
| The model is affine over `S` in that case | conclusion of the theorem | `∃ X₀ : Over S, IsAffine X₀.left ∧ …`; with `S` affine this is affine over `S`; gluing over the base keeps affineness (local on the target) | Pass |
| "this case does not wait for ModularCurves 0E" against "it reduces to that case" (line 2373) | the reduced `p` | flat, surjective, quasi-compact between affines: an instance of 0E that the pin proves; ModularCurves on `main` names the same declaration (its README, lines 588, 624, 5069) | Pass; no contradiction |
| `## Downstream consumers`: NeronModelsAndSemistableAbelianVarietiesPartII §1.9 uses §1.9a (lines 8748–8749) | that roadmap on `main` | heading "1.9 finite pinching in algebraic spaces" (line 453); the bullet with Stacks 67.50.2 at lines 632–634, used at line 584; here §1.9a is at line 2752 | Pass; that roadmap is later in the merge order, so a consumer |

The rows for untouched statements stand as in the previous review, of `3e72c55`.

- Library declarations opened at the pin: 2 (`TauCeti/AlgebraicGeometry/Descent/Affine.lean:532`, read with its private Spec case at line 505; `Descent/AffineMorphism.lean:405`, `isIso_toBaseChangeDescended_hom`, named by the description).
- Cross-roadmap citations resolved on `main`: NeronModelsAndSemistableAbelianVarietiesPartII §1.9; ModularCurves 0E = its Layer 0.5 (label table, line 4617).
- Source locators: the added sentences cite no source; the neighbouring Stacks locators (01UA, 0245, 02W0, 02W3) were read at the previous head and are unchanged.
- Seeded sample: none of the fifteen targets lies in a changed passage or cites one; §1.9 (in the sample) is untouched, the change names §1.9a only.
- Automatic checks: all passed at this head. Dependency check: `depcheck: 124 roadmaps, 1449 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `TauCetiRoadmap/SchemeAndStackFoundations/Suggested.lean` exits 0 with 48 warnings, all `sorry`; no error, no `set_option`. The file is unchanged against `main` and since `3e72c55`, so no `#check` comparison or one-tactic probe was redone and no headline changes.
- Record against the merge base: no layer or heading removed or retitled, four headings added, no Lean declaration changed; no file changed outside the folder.
- The pull request's text: read against this head; the move, the conflict with the cohomologically-affine revision and the new consumer line are stated; one sentence is out of date (C01).

Overlap check: read FunctorOfPoints, PurityForFlatCohomology, QuasicoherentSheavesOnPrestacks (open) and ModularCurves (main) for the object the change touches, effective descent of affine schemes along a flat map of affines; it is the pinned Tau Ceti's theorem, cited by ModularCurves on `main` and FunctorOfPoints as here, owned by no roadmap anew. The other shared objects stand as in the previous review: fppf cohomology with supports owned here (§2.9a); affine descent along flat surjective quasi-compact maps and the finite locally free affine quotient owned by ModularCurves §§0.5, 0.3; schemehood of separated locally quasi-finite algebraic spaces owned here (§1.9a), now recorded under Downstream consumers. The cohomologically-affine revision conflicts with this head; the description gives the order.

Source independence: changed passages only; 2 passages compared with 1 text (the docstring of the Tau Ceti theorem; the added sentences cite no source), none shared beyond the forced "of affine schemes"; largest share stacks-project, 862 tagged locators; contents not compared again (no layer added, removed or reordered).

Research link: §2.9a is the carrier of fppf cohomology with supports in Česnavičius–Scholze, *Purity for flat cohomology* (2019); §§1.1a, 1.9a feed Artin's bootstrap theorem (§1.17); §§4.15–4.20 are de Jong's alterations (1996); §5.11 the Weil bound. Rests on the README and on cesnavicius-scholze.

## Not verifiable

- Grothendieck, *Le groupe de Brauer III*, Théorème 11.7 (§2.10): text not available to me; hypotheses not read (see the question above).

## Source issues

- none

## For the human reviewers

- none
