# Review of ArithmeticLocallySymmetricSpaces (pull request #871 at 9882c81)

**Verdict:** accepted

## Previous findings

- R01 — repaired: `lake-manifest.json` now pins Tau Ceti at `2fd255d`; `Suggested.lean:63–64` resolves `CommHopfAlgCat.innerConjugationIso`. The targeted build and direct elaboration succeed.
- R02 — repaired: the description names EnhancedDerivedSheaves §§0.1–0.2, 0.4 and SchemeAndStackFoundations §§2.1, 2.5; calls the arbitrary-stalk comparison and smooth triangulation targets rather than hypotheses; identifies EtaleCohomologyFoundations as on main; removes the misplaced “below”.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| `IsCartanInvolution.conj`, coordinate pullback at the repaired pin | `GL₂`, `g = diag(2,1)`, `x = [[1,1],[0,1]]`, `θ(x) = x⁻ᵀ`; set `S = ggᵀ` | `ad(g)θad(g)⁻¹(x) = Sx⁻ᵀS⁻¹ = [[1,0],[-1/4,1]]`; reversed conjugation gives `[[1,0],[-4,1]]`. | Both sides agree; reversed order fails. | None |

Rows for untouched statements stand as in the previous review, of `4f8e95a`.

- Incremental scope: 0 changed folder lines; both previous findings checked. All 7 seeded targets retain their wording and locators; 0 new source locators required verification.
- Pinned declarations opened: `CommHopfAlgCat.innerConjugationIso` and its point-action theorem, `TauCeti/Algebra/AlgebraicGroup/CommHopfAlgCat/InnerConjugation.lean:59,119`; reductivity's smoothness and geometric-connectedness clauses, `TauCeti/Algebra/AlgebraicGroup/Reductive/Basic.lean:79`.
- Supplier sections resolved: 7 across EnhancedDerivedSheaves §§0.1, 0.2, 0.4; SchemeAndStackFoundations §§2.1, 2.5; AdelicAlgebraicGroups §3.7; ComplexComparisonPartII §C6.1. The description's repaired contracts agree with these texts.
- Gate: every scanner 0, matching the worker's passing gate. Dependency output: `depcheck: 245 roadmaps, 2217 edges, 0 problem(s)`; no UPWARD or CYCLE.
- Targeted build: success. Direct `lake env lean`: exit 0, exactly 2 `sorry` warnings. Scratch `#check @` for all 3 declarations: README hypotheses retained, no lost binder. Lake additionally emits its module-system advisory.
- PR title and description checked against the added folder and repaired assumptions; 0 contradictory claims found. Outside-folder PR diff: 0 files; changes since `4f8e95a` outside the folder are inherited from the merge of main.
- Overlap check: read scope/ownership clauses of PotentialAutomorphyInfrastructure, AutomorphicFormsOnReductiveGroups, HilbertModularVarietiesAndShimuraCurves, CrystallineLocalGlobalCompatibilityCM, CompletedCohomologyPartII, AdelicAlgebraicGroups, SmoothRepresentationsOfLocalGroups and ReductiveGroupsPartII. ALS owns finite-level arithmetic cohomology and the real Cartan comparison; AdelicAlgebraicGroups owns rational Cartan data and adelic level geometry; SmoothRepresentationsOfLocalGroups owns smooth representations and local Hecke theory; ReductiveGroupsPartII owns parahoric/Iwahori structure; CompletedCohomologyPartII owns completion of towers. No ownership change or conflicting identifier reported.
- Source independence: changed passages only; 0 source passages changed, 0 comparisons with new sources. No layer added, removed or reordered; the previous wording/reuse and arrangement checks stand. Locator shares were not recounted.

## Not verifiable

- The previous review's limitation on published pagination for ACC+23 and NT16 remains; this change adds no source locator.

## Source issues

- none

## For the human reviewers

- none

