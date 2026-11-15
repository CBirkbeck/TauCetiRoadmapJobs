# Review of EnhancedDerivedSheaves (pull request #1630 at 0514180)

**Verdict:** needs changes

## R01 (P3) — Disclose the removed repleteness acceptance statements

**Location:** PR description, `roadmap-summary` block, “What this revision changes” (`scratch/pull-request.md:15`); omitted removal of `IsReplete.over` and `IsReplete.of_over_epi` from `Suggested.lean`.
**Claim:** The summary describes repleteness becoming library material but does not disclose these two deleted Lean statements, whose results remain roadmap targets.
**Witness:** `TauCetiRoadmap/EnhancedDerivedSheaves/Suggested.lean:66` explicitly keeps slice/cover permanence only in the README; the base declares both theorems at lines 258 and 265. The head retains their targets at `README.md:2159` and `:2170`.
**Repair:** Add: “Suggested.lean also removes IsReplete.over and IsReplete.of_over_epi from its acceptance statements; both remain targets of README §E2.1.”

## Previous findings

- R01 — repaired: `TauCetiRoadmap/EnhancedDerivedSheaves/README.md:2258` retains `L_n ∈ D^{≥−n}` and the mapping-space adjunction, expressly distinguishing it from an identification of full derived Hom complexes. The previous report had no unresolved findings.

## Verified sound

| Statement | Instances | Left-hand value | Right-hand value | Result; change |
| --- | --- | --- | --- | --- |
| E2.1, slice permanence (R01) | Set; U = {0,1}; constant tower U × {0,1} over U | Limit has four elements; each projection is identity | Two fibres of size two; both projection maps are identities | Surjective in both descriptions; description only |
| E2.1, detection on a cover (R01) | U = {0,1} → 1; constant two-element tower | Limit projection 2 → 2 is identity | Pullback projection U × 2 → U × 2 is identity | Surjectivity agrees; description only |
| E5:spectra-comparison, module equivalence cited by PR text | R = ℤ; M = N = ℤ/2; resolution [ℤ →² ℤ] | Tensoring gives [ℤ/2 →⁰ ℤ/2]; H⁻¹ = H⁰ = ℤ/2 | π₁ = π₀ = ℤ/2 for the corresponding relative tensor product | Degrees and Tor agree; none |

Untouched mathematical rows stand as in the previous review of `0514180`.

- Changes: 0 roadmap lines since `0514180`; 0 files changed outside the folder; title and full quoted prose checked against the base diff and head.
- Sources: 4 locators checked—HA Remark 7.1.1.16, p. 1206 (line 46277), Theorem 7.1.2.13, p. 1212 (line 46530); BS-proet Lemmas 3.1.2–3.1.3, p. 16 (lines 704, 707). Seeded §§0.1–0.4 have 0 changed passages; prior checks stand.
- Pinned library: 3 declarations opened—`Mathlib/AlgebraicTopology/Quasicategory/Basic.lean:41`; `Mathlib/Algebra/Homology/DerivedCategory/Basic.lean:87` and `:169`.
- Lean: 0 changed declarations; previous signature and padding checks stand. Targeted build and direct elaboration both exit 0, with only 10 `sorry` warnings.
- Gate: worker and rerun pass, all reported counters 0; worker build=0 independently confirmed by the targeted build. Dependency output: `depcheck: 245 roadmaps, 2238 edges, 0 problem(s)`.
- Overlaps: 0 dropped citation ids; 0 ids requiring an open revision; #1330 shared-folder conflict has the stated second-merger rebase rule. Import search: 0 other roadmaps import this module.

Overlap check: read scopes of DerivedInfinityCategories, PresheavesAndCompletions, PresentableInfinityCategories, AnalyticStacks, SolidAnalyticRings, DerivedModuleAlgebra, StableHomotopyKTheory and BordismFormalGroups. Ordinary module algebra belongs to DerivedModuleAlgebra; generic spectral enhancement to BordismFormalGroups; concrete spectral adapters to StableHomotopyKTheory; enhanced sheaf and higher-algebra interfaces here supply AnalyticStacks and SolidAnalyticRings. Remark on untouched text: #2270's first three roadmaps also claim generic derived, Ind and presentability theory already planned here on main; this is outside the zero-line re-review.

Source independence: changed passages only; 0 changed roadmap passages, hence 0 new wording/reuse comparisons required. No layer was added, removed or reordered since `0514180`; the arrangement comparison is not reopened.

## Not verifiable

- No newly required source was unavailable; the previous report's unverified sources outside this incremental scope remain unverified.

## Source issues

- none

## For the human reviewers

- none
