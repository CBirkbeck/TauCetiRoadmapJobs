# Review of HeightsForLogSingularMetrics (pull request #2894 at 46d8e6e)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/HeightsForLogSingularMetrics/`
**Verdict:** accepted

**Summary.** Accepted on an incremental re-review of the 14 lines changed since `b34d4ea`: the Conventions sentence now excludes 4.3b (a) correctly, and the four new locators into the formal proof (0.4 (b), 4.3a (b) twice, References) were opened in the operator's copy of its source and each names a declaration that exists in the file given and says what the README attaches to it. There are two small corrections (the Conventions sentence still lists 0.4 (b) among the targets that name no formal-proof statement, which the same change made untrue; the description's paragraph on the family index describes sibling pull requests that are now closed) and one format note, none blocking. Left for a human: the scope and licence questions of the earlier rounds, the relation of this pull request to #2954, which carries the same folder, and the new section of the family index on reviewing contributions.

## C01 — The Conventions sentence lists 0.4 (b) among the targets that name no [FormalProof] statement, and 0.4 (b) now names one

A reader who applies Conventions (lines 22–26) to 0.4 (b) is told that it "names neither [FormalProof], nor a source with a locator, nor a section of another roadmap" ("for instance 0.4 (a), (b), …") and that "no source is claimed for it". The same change added to 0.4 (b) (line 44) the parenthesis "(the regularised form: … [FormalProof], `Development/AutomorphicSpectrum/Statements/GeometryStatements/CmpSt.lean` (`GlobalTheory.CompanionTheory.Ar.Cmp.CmpSt`))", so (b) does name the formal proof, for its comparison of two models. No stated result is affected: the existence, independence and multilinearity of the limit numbers remain this roadmap's own, as the first paragraph of Conventions already implies for a wider form stated beside a formal-proof form.

The smallest change: "for instance 0.4 (a), 14.1 (a), (b) and 14.2 (a)–(c), and 0.4 (b) apart from its comparison of two models, …".

## C02 — The description's paragraph on the family index describes sibling pull requests that are closed, and does not say that #2954 carries this folder

The description says the index "is line for line the one at the heads of the MultiplierIdealsOfPairsAndPointSeparation, ProjectiveModelsAndPeriodBoundsOnShimuraVarieties and ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties pull requests" and differs at seven others. Those pull requests are closed, unmerged (#2911, #2923, #2891, #2884 and #2880 were checked; each closed on 22 November in favour of #2954), and since `b34d4ea` the index itself changed by 48 lines (the formal proof's source is pinned at its first commit, and a section "When a roadmap is wrong" is added), which the description does not mention. #2954 is open and its head `abeed69` carries this folder's `README.md` and `Suggested.lean` and the family index with 0 differing lines from this head, together with the three family suppliers this README cites (SlopesOfHermitianVectorBundles, ChowFormsAndHeightsOfSubvarieties, SingularHermitianMetricsAndL2Methods). A reader of the description cannot tell which of the two pull requests is meant to merge this folder, nor where the suppliers now are.

Text that would be right: "The family index here is identical to the one at the head of #2954, which carries this folder with the same files and the family's other sub-roadmaps, including the suppliers SlopesOfHermitianVectorBundles, ChowFormsAndHeightsOfSubvarieties and SingularHermitianMetricsAndL2Methods; [this pull request merges after it / is superseded by it]." ArakelovGeometryAndAbelianHeightsPartII is now on main and belongs in the list of suppliers on main.

## N01 — The generated supplier blocks of the description name closed pull requests

The `depends-on` and `merge-order` blocks list #2891, #2884 and #2880 (closed; their roadmaps are in #2954), #1833 (ArakelovGeometryAndAbelianHeightsPartII, now on main) and #1017 (HeightsRationalPointsAndObstructions, on main). The blocks are refreshed by their tool; nothing in the author's text needs to change beyond C02.

## Previous findings

The previous report (of `b34d4ea`) had no finding; its small correction and format note are accounted for here.

- C01 (the Conventions sentence covered 4.3b (a)) — repaired: "nor a section of another roadmap as its statement (… but not 4.3b (a), which is ChowFormsAndHeightsOfSubvarieties §6.2 (a7) for the dual of `Ē`)"; the instance list beside it is C01 above.
- N01 (generated supplier blocks out of date) — not repaired: the blocks now also name three closed pull requests; N01 above.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 0.4 (b), comparison of two models, regularised form, against `CmpSt` (CmpSt.lean lines 11–27) | `f_1 = f_2 = id`; `f_1` of degree 2, `f_2 = id` with `L^{(2)} = f_1^*L^{(1)}` | `1·I_t − 1·I′_t → 0` (independence of the regularisation); `2·L^d − (f^*L)^d = 0` by the projection formula of (b). `CmpSt`: degree-weighted difference of the two regularised numbers tends to `0` as `t → 0⁺` | README form agrees with the declaration; it is proved there (`cmpSt_holds`) | none |
| 4.3a (b), `vol^ ≥ L̄^d` for a smooth metric, against `GlobalTheory.Published.VolGe` (VolGe.lean lines 12–13) | `Spec ℤ`, `O(c)`, `c = −1, 0, 1` | `max(c,0) ≥ c`: `0 ≥ −1`, `0 ≥ 0`, `1 ≥ 1`. `VolGe`: nef on vertical curves over finite fields, semipositive, self-intersection `a` ⟹ `a ≤ arVol` | same hypotheses and conclusion | none |
| 4.3a (b), equality for nef, against `GlobalTheory.Published.VolNef` (VolHomog.lean lines 12–13) | `O(c)` on `Spec ℤ`, `c = 1` nef, `c = −1` not nef | `vol^ = 1 = c`; for `c = −1`, `vol^ = 0 ≠ −1`, and `O(−1)` is not nef, so no contradiction. `VolNef`: nef and self-intersection `a` ⟹ `arVol = a` | agrees; declaration is in VolHomog.lean as cited | none |
| References, antisymmetry along compact roots, against `SquareStatements.good_tower_antisymmetry` (GoodTowerAntisymmetry.lean line 20) | the conclusion `T.I8` unfolded (Proportional.lean lines 108–112) | `I8`: for adjacent `a`, `b = a + 1` with `b ≠ T.j`, swapping gives minus the value of (limit number − volume × flag term) on `(D+1)`-st powers of linear forms; hypotheses include `CmpSt` and two bundled input statements | supports "antisymmetry of their limit numbers along the compact roots"; conditional on inputs as the theorem states | none |
| Conventions sentence, instance list | 0.4 (a), (b); 14.1 (a), (b); 14.2 (a)–(c); 4.3b (a) | 0.4 (b) line 44 names [FormalProof] (`CmpSt`); the other six name none; 4.3b (a) excluded, and ChowFormsAndHeightsOfSubvarieties §6.2 (a7) at the head of #2954 (line 307) is the whole-space height, with line 521 giving 4.3b (a) as (a7) for `J̄ = Ē^∨` | true except for 0.4 (b) | C01 |
| Description, family index against sibling heads | #2911, #2923, #2891, #2884, #2880; #2954 | all five closed unmerged in favour of #2954; index, README and `Suggested.lean` at `abeed69` differ from this head in 0 lines | paragraph out of date | C02 |

The rows for the statements the change does not touch stand as in the previous review, of `b34d4ea`.

- Source locators checked against the text: 4 new ([FormalProof]: `CmpSt`, `VolGe`, `VolNef`, `good_tower_antisymmetry`), each at the path and declaration name given; all four support the statement as written. The seeded sample falls in the changed passages at 0.4 (b) and 4.3a (b), covered by these.
- Library declarations opened at the pins: none; the changed text names no Mathlib or Tau Ceti declaration.
- Cross-roadmap citations resolved in the changed passages: ChowFormsAndHeightsOfSubvarieties §6.2 (a7) at the head of #2954; ArakelovGeometryAndAbelianHeightsPartII §§0.1, 0.3, 1.2, 1.3, 3.1, 4.3 on main (headings at README lines 49, 106, 158, 184, 490, 653); HeightsRationalPointsAndObstructions on main.
- Dependency check: `depcheck: 136 roadmaps, 1521 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with no message. The file is unchanged and declares nothing, so there is no signature to compare and no one-tactic probe to run.
- Headlines: unchanged, (1) 0.4 (b)–(c); (2) 4.3b (b); (3) 14.1 (a), (c); (4) 16.1 (a); none statable at the pins, each named in the docstring with what it lacks.
- Changes outside the folder: only the three files of the family index, the pull request's own; its `README.md` changed by 48 lines since `b34d4ea` (see C02 and the human reviewers' section). The worker's automatic checks all passed at this head.
- Pull request text: title and each paragraph read against this head; the family-index paragraph and the supplier lists are C02 and N01; the rest agrees.

Overlap check: read ChowFormsAndHeightsOfSubvarieties (at the head of #2954), ArakelovGeometryAndAbelianHeightsPartII, ArakelovGeometryAndAbelianHeights and FaltingsFinitenessAndIsogenyTheoremsPartII (on main) for the changed passages; the height of the projective space of a Hermitian vector bundle: owner ChowFormsAndHeightsOfSubvarieties §6.2 (a7), cited here; arithmetic volumes on projective models and their equality with the self-intersection for nef bundles: owner ArakelovGeometryAndAbelianHeightsPartII §0.3, cited here; nothing owned twice. #2954 carries this same folder with identical files (C02); it is the same text, not a second plan.

Source independence: changed passages only: 4 passages compared with 1 source (the Conventions sentence; the parenthesis of 0.4 (b) beside CmpSt.lean lines 11–27; the two clauses of 4.3a (b) beside VolGe.lean lines 12–13 and VolHomog.lean lines 12–13; the References sentence beside GoodTowerAntisymmetry.lean line 20), none shared (the source is Lean code, the README prose with path and declaration names); largest share [FormalProof], 46 of 53 locators after this change; the change adds, removes and reorders no layer, so the arrangement was not compared again.

Research link: Layer 4 extends Moriwaki's generalised Hodge index theorem (2009) and Zhang's theorem of successive minima (1995) to log-log singular metrics; Layer 16 complements Bost's linear slope bound (1996) using Moret-Bailly's key formula (1990); Layers 0, 14, 16 are inputs of Alpöge's formal proof (2026). Rests on the README and the sources read.

## Not verifiable

- [FormalProof]: the four new locators were read in the operator's local copy of the repository's `src/`, which is at commit `e50d098`; the family index (lines 12–19) says the files are to be looked up at the first commit `40e56ba`, which was not read. The locators untouched by this change (0.4 (c), 4.3a (d), 4.3b, 14.2 (d), 16.1 (b), the rest of References) were not compared in this incremental round.
- Whether the hypotheses `Given` and `Out.WeilSt` of `good_tower_antisymmetry` are all discharged inside the formal proof was not traced; the README's "proves" for 14.1 (c) rests on that.
- 16.1 (a) with an absolute constant: the two questions of the earlier reviews on step (3) of the route are untouched by this change and remain open.
- The sibling pull requests and #2954 are not in the index of open roadmap pull requests used for the citation and overlap tools; their state and the files of #2954 were read from the repository directly. Ownership against the other 40 sub-roadmaps of #2954 was not searched.

## Source issues

- none

## For the human reviewers

- Scope: 16.1 (a) is "not attributed to a published source" (README line 218); by Conventions (lines 22–26) 0.4 (a), 14.1 (a), (b) and 14.2 (a)–(c) claim no source; the Announcement (lines 45–49) says no written account of the proof exists yet.
- Licence: the family index (lines 12–19) reports that the repository of [FormalProof] says the proof was published without a licence and is mirrored for verification only; this README names 40 of its file paths with declaration names.
- Licence: the Announcement is recorded as read from its author's own page (`alpo.ge`); please confirm the host.
- Not tested: [FormalProof] carries 46 of 53 locators; only the four added by this change were compared with it (operator's local copy at `e50d098`); its arrangement and the origin of the ids 0.4, 4.3a, 4.3b, 14.1, 14.2, 16.1 were not compared.
- Pull requests: #2954 (open, draft) carries this folder with identical files and the three family suppliers; the sibling pull requests were closed in its favour and #2894 was not. Which of the two merges this folder is to be decided.
- Policy: the family index (`TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/README.md`, section "When a roadmap is wrong", lines 45–75) now states how reviews of contributions that depart from these roadmaps should proceed; whether a roadmap index sets review policy is a project decision.
