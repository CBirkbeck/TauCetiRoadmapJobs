# Review of SchemeAndStackFoundations (pull request #2531 at cea30e1)

**Verdict:** accepted

**Summary.** An incremental re-review of 0 changed lines since `cea30e1`: the folder is unchanged, and this round read the pull request's title and description against the head. Accepted: the previous report had no finding, and its one small correction is repaired, since the description now ends the locally finitely presented affine case of §1.1a at Tau Ceti's theorem as the README does. No sentence of the title or description is contradicted by the head and no change of the folder is left unstated. No small correction and no format note; one question to the author is carried over, and nothing is left for a human to decide.

## Questions for the author

- Does Grothendieck's *Le groupe de Brauer III*, Théorème 11.7, cited in §2.10 for `smoothGroup_fppf_etale_comparison`, cover every smooth commutative group scheme, or does it carry a quasi-projectivity hypothesis? Česnavičius–Scholze, Theorem 5.2.6, covers affine smooth `G` only (cesnavicius-scholze line 2318). What stopped me: the text of *Brauer III* is not among the sources I can read. (Carried over; nothing changed in §2.10.)

## Previous findings

- The previous review, of `cea30e1`, had no finding (no R-numbered point).
- C01 (previous) — repaired: the description now says §1.1a reduces that case "to `S`, `S'` and `X` affine, where effectiveness is Tau Ceti's `TauCeti.DescentDatum.exists_isAffine_baseChange_hom_isIso`, so that case does not wait for ModularCurves 0E", as README lines 2376–2380 do.

## Verified sound

| Statement | Instances tried | Values on each side | Result; change |
|---|---|---|---|
| Description: the locally finitely presented affine case of §1.1a ends at `TauCeti.DescentDatum.exists_isAffine_baseChange_hom_isIso` (README lines 2368–2380) | hypotheses at the pin; `Spec R_f → Spec R`; `S' = ∅ = S` | `Descent/Affine.lean:532`: `[IsAffine S] [IsAffine S'] [Flat p] [IsAffine X.left]`, no surjectivity. `R_f ⊗_R R_f = R_f`, model `B` itself; empty: model `∅` | Pass; description and README agree |
| Description: Tau Ceti has effective descent "only along an affine flat morphism" and for `S`, `S'`, `X` affine | the two declarations | `Descent/AffineMorphism.lean:405` `isIso_toBaseChangeDescended_hom [Flat p]`; `Descent/Affine.lean:532`; pins `2fd255d`, `1b1ccf4b` in the manifest | Pass |
| Description: §0.7 second clause is base-change invariance (02FY), retrocompactness (02G0), boundedness (0A3V) (README lines 587–593) | `𝔸¹ → pt`; blow-up of `𝔸²` at 0 | `𝔸¹`: fibre dimension 1 everywhere, `{≤ 0} = ∅` open. Blow-up: 1 on the exceptional curve, 0 elsewhere, `{≤ 0}` its open complement; bound 1 | Pass |
| Description: `artinBootstrap` does not depend on §1.15 (README lines 3216–3220) | the *Needs:* line | for `artinBootstrap`: §§1.4–1.6, 1.8–1.9, 1.14, §1.2 `quasiFiniteDescent`, §1.9a, "and not §1.15"; §1.2 needs §1.17 only for `spaceFppfDescent` (line 2494) | Pass; no cycle |
| Description: section order now and at the merge base | headings at both | head: build guide (46), Conventions (64), Layers 0–5, Downstream (8723), Scope (8761), contracts (9081), References (9353); base: Scope (46), Conventions (358), contracts (401), build guide (656) | Pass |
| Description: PurityForFlatCohomology §0.2 takes the construction, `H⁰_Z`, long exact sequence, open excision, triple sequence from §2.9a | that open roadmap's README at its head, lines 886–895 | "Fppf cohomology with supports is SchemeAndStackFoundations §2.9a's", lists exactly those five items | Pass |
| Description: NeronModelsAndSemistableAbelianVarietiesPartII §1.9 on `main` states Stacks 67.50.2 and uses it | that README on `main` | heading 1.9 at line 453; 67.50.2 at lines 480, 584, 632; here Downstream consumers lines 8748–8749 | Pass |

The rows for untouched statements stand as in the previous review, of `cea30e1`.

- The pull request's text: title, summary block and prose read sentence by sentence against the head; 4 added headings (0.2a, 1.1a, 1.9a, 2.9a), 0 removed, `Suggested.lean` unchanged against `main`, no file changed outside the folder: all as the description says.
- README names and locators the description cites, found at the head: 16 of 16 (among them 01SK at line 231, 03N0, 02W0, 02W3, 0AP4, 02W5, 0247, 02W8, 03XX, 0418, 032H at line 1457, Théorème 11.7 and Theorem 5.2.6 at lines 4533–4534).
- Library declarations opened at the pin: 5 (`Descent/Affine.lean:532`, `Descent/AffineMorphism.lean:405`, `RelativeSpec/UniversalProperty.lean:138` `relativeSpecLift`, `Sites/SheafCohomology/Relative.lean:265` `relativeH'` on `AddCommGrpCat.{v}`, `pushforwardStructureAlgebra` in use at `FiniteEtale/Quotient.lean:91`).
- Cross-roadmap statements resolved: PurityForFlatCohomology §0.2 and SchemeAndStackFoundationsPartII (lines 155, 189, 211) at their open heads; NeronModelsAndSemistableAbelianVarietiesPartII §1.9 on `main`.
- Seeded sample: no passage changed, so none of the fifteen targets lies in a changed passage; not re-read.
- Automatic checks: all passed at this head. Dependency check: `depcheck: 122 roadmaps, 1430 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `TauCetiRoadmap/SchemeAndStackFoundations/Suggested.lean` exits 0 with 48 warnings, all `sorry`; no error, no `set_option`; one `import Mathlib` and 25 `TauCeti.*` modules. The file is unchanged, so no `#check` comparison or one-tactic probe was redone.
- Record against the merge base: 6 layers kept with their titles, no heading removed.

Overlap check: read PurityForFlatCohomology, SchemeAndStackFoundationsPartII (open) and NeronModelsAndSemistableAbelianVarietiesPartII, ModularCurves (main) for the objects the description names; fppf cohomology with supports is owned here (§2.9a) and cited by the first two; schemehood of separated locally quasi-finite algebraic spaces is owned here (§1.9a), the edit owed on the Néron folder being stated in the description; affine descent along flat surjective quasi-compact maps and the finite locally free affine quotient are ModularCurves' (0E, 0C). The other shared objects stand as in the previous review. The open cohomologically-affine revision conflicts with this head in the README; the description gives the order (that revision first, this one rebased).

Source independence: changed passages only; no passage changed, so 0 passages compared; largest share stacks-project, 862 tagged locators; contents not compared again (no layer added, removed or reordered).

Research link: §2.9a is the carrier of fppf cohomology with supports in Česnavičius–Scholze, *Purity for flat cohomology* (2019); §§1.1a, 1.9a feed Artin's bootstrap theorem (§1.17); §§4.15–4.20 are de Jong's alterations (1996); §5.11 the Weil bound. Rests on the README and on cesnavicius-scholze.

## Not verifiable

- Grothendieck, *Le groupe de Brauer III*, Théorème 11.7 (§2.10): text not available to me; hypotheses not read (see the question above).
- The two census pages of the Annals definitions that the description links: outside the repository, not read; no statement of the roadmap rests on them.

## Source issues

- none

## For the human reviewers

- none
