# Review of HigherHidaAndColemanTheory (pull request #2342 at b82e0be)

**Verdict:** accepted

No finding. Incremental re-review of 0 changed lines since `b82e0be`; this round read the pull request's title and description against the head. The acceptance is conditional on the ten declared supplier gaps (`gap:solid-localization-kernel`, `gap:discrete-adic-solid-comparison`, `gap:siegel-ordinary-igusa`, `gap:klingen-height-one-igusa`, `gap:abelian-affinoid-basis`, `gap:projective-banach-cohomology`, `gap:banach-support-duality`, `gap:coherent-correspondences`, `gap:abelian-subcanonical-vanishing`, `gap:klingen-lci-model`), each stated in `TauCetiRoadmap/HigherHidaAndColemanTheory/README.md` under its supplier with the same slug.

## Previous findings

- none: the previous report, of `b82e0be`, was an acceptance and listed no finding.

## Verified sound

The folder did not change, so no statement changed; the rows below are for statements the description cites.

| Statement | Instances tried | Values computed (README side / recomputed side) | Result |
| --- | --- | --- | --- |
| §4.9, §8.4 amplitude ("integral amplitude in genera one and two", "rational amplitude in every genus") | g=1, 2, 3; `ℓ(w)=1` at g=2; duality i ↔ d−i | `d=g(g+1)/2=1,3,6`; Kostant representatives 2, 4, 8; g=2, ℓ=1: `[1,3]` and `[0,1]`; dual of `[ℓ,d]` is `[0,d−ℓ]`, i.e. `[0,2]`; g=3 only after inverting p | agrees |
| §9.8 Klingen control ("two-term … for singular genus-two weights") | r=2, k=0; p=2; p=3 with `(1,1,9,9)` | threshold `k+2r−3=1`: slope 0 inside, slope 1 outside; `k>p+1` starts at k=4; eigenvalues 20; 2, 10, 10, 18 with 3-adic valuations 0; 0, 0, 0, 2 | agrees |
| Description, validation and dependency sentences | the head, the gate, the supplier subsections | 26 supplier roadmaps in `README.md`: 7 on main, 19 open, the 19 of the `depends-on` block; outside-folder diff empty; `Suggested.lean` has 0 declarations | agrees |

The rows of the previous review, of `b82e0be`, stand for every other statement.

- Pull request text: every sentence of the title, the summary block and the prose was set beside `README.md` (Summary, Scope and ownership, How to read the build, §§4.6, 4.9, 8.4, 9.8, Downstream consumers) and `Suggested.lean`; none is contradicted, and the text says that the pull request adds the roadmap and that no headline is stated in Lean.
- Remark: "with `sorry` as the only warning" and "the Lean states only real-bodied definitions and theorems" hold vacuously, since the file declares nothing and the build emits no warning; the description says so itself two sentences earlier.
- The description's round counts (17 review rounds, 2 red-team rounds) match the reports kept with the package.
- Gate rerun on this head: every check 0, `OK`; the worker's gate has `build=0`. `Suggested.lean` elaborates with no error and no warning; it declares nothing, so there is no `#check` comparison and no padding probe.
- Dependency check: `depcheck: 245 roadmaps, 2241 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Cross-roadmap citations: the resolver reports none unresolved; reread at their heads this round: PerfectoidShimuraVarieties §§6.13, 6.13a, 6.14, 6.15 (present), LieHighestWeight (on main under `TauCetiRoadmap/RepresentationTheory/LieHighestWeight`), and the seven suppliers on main.
- Overlap check: read PadicFamiliesPartII, AutomorphicBundlesPartII, OverconvergentAutomorphicForms, GSp4NonregularModularityLifting, PerfectoidShimuraVarieties, SmoothRepresentationsOfLocalGroups; nothing shared. PadicFamiliesPartII and PerfectoidShimuraVarieties name this roadmap as supplier and consumer respectively, in the direction of the merge order; GSp4NonregularModularityLifting imports the chambers through PadicFamiliesPartII.

Source independence: changed passages only: 0 passages compared, the folder being unchanged; the previous review's result stands (24 passages compared with 3 sources, none shared; largest share BP-Coleman, 83 of 183 locators; contents compared with BP-Coleman: independent).

## Not verifiable

- Humphreys-BGG, §§6.1–6.3, pp. 108–111 (cited in §6.5(0)): recorded as uncertified; the text was not read.
- No source locator was reopened this round: the folder is unchanged and the seeded sample falls in no changed passage; the 63 locators of the previous review stand.
- The generated `depends-on` and `merge-order` blocks were compared with the supplier subsections by name only; their order was not recomputed.
- Ownership against open pull requests was checked through the roadmap search and the six closest roadmaps, not against all 477 heads.

## Source issues

- none (no source was reopened this round; the seven entries of the previous review, of `b82e0be`, stand).

## For the human reviewers

- **Scope.** The source with the largest share of locators, BP-Coleman, is cited from a revised author-page edition and arXiv:2110.10251v1; `README.md` (References) gives no journal reference for it. BP-Hida and Pilloni-Singular are published (Inventiones 2026, Duke 2020).
- **Scope.** Several targets state forms that differ from the printed sources, listed under "Source issues and conventions" in `README.md` (E1–E18); §§5.2, 6.2 (E13, E18), §2.8(c) (E15), §6.6b (E17) and §9.6(4) (E10) change a hypothesis or a formula.
- **Scope.** Some targets go beyond the cited statements with routes of the roadmap's own: §6.1a(2) (projectivity), §6.6b (arbitrary complete coefficient field), §9.5 (principal-series criterion), §§3.8 and 6.10 (Hecke algebra actions), §6.5(0) (the algebraic BGG resolution, stated here for want of another owner).
- **Licence.** The three main sources are read from author-page PDFs on the host of one author's institution; their licence class is the manifest's to confirm.
