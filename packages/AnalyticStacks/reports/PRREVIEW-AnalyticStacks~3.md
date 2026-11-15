# Review of AnalyticStacks (pull request #1687 at dd5bc83)

**Verdict:** accepted

Incremental re-review of the 118 lines changed since ba511f7 (the sixteen `### k.n` headings restored, one phrase of the Summary, the two pins and fifteen library line numbers of the supplier contracts), and of the pull request's title and description. No finding.

## Previous findings

- R01 — repaired: the 90 headings of `TauCetiRoadmap/AnalyticStacks/README.md` are those of 7caeef3 line for line, 60 of them `### k.n`; no "This section provides" sentence remains; line 1094 is "### 6.4 The solid affine line and cohomological smoothness".
- R02 — repaired: the description reads "Claude Fable 5.1 and Claude Opus 5.5 made the later edits on this branch (a source locator in 0.9; the Summary's wording and the pins and line numbers of the supplier contracts)".

## Verified sound

| Statement | Instances | Values | Result | Change |
|---|---|---|---|---|
| Supplier contract for 2.10 (README line 52): `TopologicalSpace.CompactOpens` at the pin has two semilattice structures and a bounded order, no distributive lattice | Compacts.lean lines 777, 827, 851, 877 at Mathlib 1b1ccf4; grep for `DistribLattice (CompactOpens` in both pins | 777 structure; 827 `SemilatticeSup`; 851 `instSemilatticeInf`; 877 `instBoundedOrder`; grep: 0 hits (line 103 is for `Compacts`, T2 only) | as stated; `compactOpensDistribLattice` duplicates nothing | none |
| `spectralStoneDuality` (2.10), re-elaborated at the new pins | X = ∅; X = point; Sierpiński space; X discrete on 2 points | compact opens: {∅} (0 = 1, the terminal lattice); {∅, X} (the 2-chain); 3-chain; 2 × 2. Spectral maps point → Sierpiński: 2; lattice maps 3-chain → 2-chain: 2 | consistent with an equivalence to `BddDistLat`ᵒᵖ | none |
| Pins (README lines 44, 58) against `lake-manifest.json` and the description | manifest at this head and on main | Mathlib 1b1ccf4b088b…, Tau Ceti 2fd255d997f4… in all four places | agree | none |
| Library line numbers of the supplier contracts (lines 46–58) | all 43 file:line citations opened at the pins | 43 of 43 land on the named declaration (e.g. `MonoidalClosed.pre` 241, `HasPullbacks` 551, `MorphismProperty.diagonal` 782, `LightProfinite` 44 and 405, `Huber.Pair` 153, `spa` 105, `cartierDuality` 262) | correct | none |
| Restored units against 7caeef3 | whole-folder diff 7caeef3 → dd5bc83 | 10 lines differ: the Summary phrase, the two pins, the line numbers, and the 0.9 locator repaired at 8b3b4cb; every other line identical | no statement changed | none |
| Summary, line 3 | removed phrase "in the account of Rodríguez Camargo" | sentence now "the geometry of light analytic rings of Clausen and Scholze: …"; the six end theorems it lists (0.6, 3.3, 3.8, 4.2, 6.6, 7.6) are headings at this head | true | none |
| Description against the head | each sentence of the summary block and the prose | consumers and their sections: README lines 1302–1304; "not only solid ones": line 11; `CategoryTheory.Bicategory`: line 9; essentially small C₀: line 24; folder files README.md, Suggested.lean, metadata.toml; 13 declarations, 3 with `sorry`; outside-folder diff 0 paths; AnalyticStacks absent from main | title and description hold | none |

The rows of the earlier reports for untouched statements stand as in the previous review, of `ba511f7`.

- Gate at dd5bc83 (the worker's run and this review's): every check 0, `build=0 OK`. Dependency check: `depcheck: 245 roadmaps, 2241 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Elaboration: `lake env lean` on `TauCetiRoadmap/AnalyticStacks/Suggested.lean` at the new pins, 3 warnings, all "declaration uses `sorry`" (lines 114, 160, 229); the file is unchanged since 7caeef3, so the signatures and one-tactic probes of that review stand.
- Library declarations opened at the pins: 43 (40 in Mathlib, 3 in Tau Ceti), plus the definition of `SpectralSpace` (Mathlib/Topology/Spectral/Basic.lean:38: T0, compact, quasi-sober, quasi-separated, prespectral). Neither pin states the duality of 2.10 or bundles spectral spaces.
- Source locators: the diff changes none. Seeded sample: seven of its targets (0.5, 2.1, 2.2, 2.10, 6.1, 6.3, 6.4) have a restored heading; their titles are the sample's and their bodies are unchanged.
- Cross-roadmap citations: none added or changed. The supplier headings resolve: EnhancedDerivedSheaves, DerivedModuleAlgebra, SchemeAndStackFoundations, EtaleCohomologyFoundations, AdicSpaces (Completed), AdicSpacesPartII and SmoothRepresentationsOfLocalGroups on main; DerivedDeRhamCohomology, LocallyAnalyticDistributions, SolidAnalyticRings, RefinedTraceMethods and VStackSheavesAndLisseCategories open and earlier in the merge order. The two declared gaps (`gap:nuclear-hom-criterion`, `gap:integral-closure-tests`) are untouched; the acceptance is conditional on them. `scratch/overlaps.md`: no dropped id, no other pull request changes this folder, no second copy. No other roadmap cites a section of AnalyticStacks.
- Overlap check: read SolidAnalyticRings, EnhancedDerivedSheaves, DiamondsAndVStacks; nothing shared beyond the supplier sections already cited.
- Remark, no change asked: the open roadmap VStackSheavesAndLisseCategoriesPartII declares `gap:vs-pii-restricted-nerves`, asking EnhancedDerivedSheaves §E3.4 for the Liu–Zheng comparison of restricted nerves that 0.3 owns here (its README line 99). EnhancedDerivedSheaves on main states no restricted nerve, so 0.3 has one owner today.
- Source independence: changed passages only: 61 passages (60 restored headings, 1 Summary sentence) compared with 3 sources (RCSolid, HM, RC26a); three headings ("Geometric setups", "Suave and prim objects", "Exceptional descent") equal HM section titles of two to four words, standard names; nothing else shared; largest share RCSolid, 260 of 576 locators; contents not compared again (no layer added, removed or reordered since ba511f7; the headings are those of 7caeef3).

## Not verifiable

- none.

## Source issues

- none

## For the human reviewers

- **Scope.** The four most-cited sources are arXiv preprints or lecture notes: RCSolid (seminar notes, 260 of 576 locators), HM (75), RC26a (64), SixFF (49); the README's References give a journal only for ABFJ22.
- **Licence.** ALRS, Sch24 and Gest are cited from author pages as preprint, draft and lecture notes (the README's References); no licence is stated for them.
- **Not tested.** No round has compared the README's arrangement with a source's contents. Observed earlier: units 0.1–0.2, 0.4–0.11 run in the order of HM §§2.1–2.2, 3.1–3.4, 4.1–4.7; Layers 5–6 in that of RCSolid §§7.4–7.7. The `*Needs:*` lines chain 0.4 → 0.5, 0.6 → 0.7 → 0.8 → 0.9 → 0.10, 0.11.
