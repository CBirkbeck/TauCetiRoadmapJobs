# Review of EnhancedDerivedSheaves (pull request #1630 at 0514180)

**Verdict:** needs changes

## R01 (P3) — Disclose the added tower-theory supplier

**Location:** PR description, `roadmap-summary` block, “What this revision changes” (`scratch/pull-request.md:15`); omitted addition of AlgebraicTopology as a supplier.
**Claim:** The description mentions consuming pinned module towers but omits the change of roadmap supplier for elementary tower theory.
**Witness:** `TauCetiRoadmap/EnhancedDerivedSheaves/README.md:208` adds AlgebraicTopology Stage 6, item 0; the base's supplier table at line 152 instead assigns elementary towers and ML/Milnor to DerivedModuleAlgebra §1.T.1.
**Repair:** Add: “The elementary tower-theory contract moves from DerivedModuleAlgebra §1.T.1 to AlgebraicTopology Stage 6, item 0, using the pinned Tau Ceti module-tower and complex-tower declarations.”

## Previous findings

- R01 — repaired: The description's `roadmap-summary` block now explicitly names the removed `IsReplete.over` and `IsReplete.of_over_epi` acceptance statements and retains both as README §E2.1 targets, agreeing with `Suggested.lean:66` and `README.md:2159`, `:2170`.

## Verified sound

| Statement | Instances | Left-hand value | Right-hand value | Result; change |
| --- | --- | --- | --- | --- |
| E2.1 slice permanence, cited by repaired description | Set; U = {0,1}; tower U×3 → U×2 by reduction modulo 2, constant above stage 1 | Limit U×3 has 6 elements; stage-zero projection hits all 4 elements | Each slice fibre has limit 3; projection 3 → 2 has fibre sizes 2 and 1 | Surjective in both fibres; description repaired |
| E2.1 detection on a cover, cited by repaired description | U = {0,1} → 1; tower 3 → 2 by reduction modulo 2, constant above stage 1 | Limit projection 3 → 2 has image {0,1} | Pullback projection U×3 → U×2 has image U×{0,1}, size 4 | Surjectivity agrees; description repaired |
| Module-tower limit and ML vanishing, supplier contract touched by R01 | ℤ/3 at every stage; transition multiplication by 2 | Compatible sequences xₙ = 2ⁿa; lim ≅ ℤ/3, with three elements | δx = y solved by x₀ = 0, xₙ₊₁ = 2(xₙ−yₙ); coker δ = 0 | ML images equal ℤ/3; lim¹ = 0; description only |

Untouched mathematical rows stand as in the previous review of `0514180`.

- Changes: 0 roadmap lines since `0514180`; 0 outside-folder changes; title and quoted prose compared with the base diff and head.
- Sources: 4 locators reopened—BS-proet Lemmas 3.1.2–3.1.3, p. 16 (lines 704, 707); HA Remark 7.1.1.16, p. 1206 (line 46277), Theorem 7.1.2.13, p. 1212 (line 46530). Seeded §§0.1–0.4 have 0 changed passages; previous checks stand.
- Pins: 6 declarations opened—`Mathlib/AlgebraicTopology/Quasicategory/Basic.lean:41`; `Mathlib/Algebra/Homology/DerivedCategory/Basic.lean:87`, `:169`; `TauCeti/Algebra/Category/ModuleCat/Tower/Basic.lean:160`, `:170`, and `Tower/MittagLeffler.lean:191`; the cokernel definition at `Basic.lean:174` was also read.
- Supplier citation: AlgebraicTopology Stage 6, item 0 resolves through its numbering map at `TauCetiRoadmap/AlgebraicTopology/README.md:879` to §6.0 and pinned tower declarations.
- Lean: 17 actual declarations checked with `#check @name` in a scratch copy; no lost standing hypotheses. Scanner docstring false positives excluded; 0 changed declarations, so previous padding checks stand.
- Gate: worker and rerun pass, every reported counter 0; targeted build and direct elaboration exit 0 with only 10 `sorry` warnings. Signature probe exits 0.
- Dependency output: `depcheck: 245 roadmaps, 2238 edges, 0 problem(s)`.
- Overlaps: 0 dropped citation ids and 0 ids requiring an open revision; #1330's conflict has the stated second-merger rebase rule; import search finds 0 other roadmap importers.

Overlap check: the previous scope audit of DerivedInfinityCategories, PresheavesAndCompletions, PresentableInfinityCategories, AnalyticStacks, SolidAnalyticRings, DerivedModuleAlgebra, StableHomotopyKTheory and BordismFormalGroups stands. Ordinary module algebra belongs to DerivedModuleAlgebra; generic spectral enhancement to BordismFormalGroups; concrete spectral adapters to StableHomotopyKTheory; enhanced sheaf interfaces here supply AnalyticStacks and SolidAnalyticRings. The added AlgebraicTopology citation resolves to its numbering map and Tau Ceti's tower theory.

Source independence: changed passages only; 0 changed roadmap passages, hence 0 new wording/reuse comparisons required. No layer was added, removed or reordered since `0514180`; the arrangement comparison is not reopened.

## Not verifiable

- No newly required source was unavailable; sources outside this incremental scope retain their previous verification status.

## Source issues

- none

## For the human reviewers

- none
