# Review of LieHighestWeightPartII (pull request #2277 at 26297a5)

**Verdict:** accepted

No finding. Incremental re-review of 0 changed lines since 26297a5; this round read the pull request's title and description against the head.

## Previous findings

- none: the previous report, of this same head `26297a5`, raised no finding (its R01–R05 bullets recorded repairs of an earlier report and all read "repaired"; the folder has not changed since).

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| Description: "nine headline theorems", "two headlines that are not statable" | `Suggested.lean` at head | 9 `theorem`s (1 recovery, 4 classical, 1 exceptional, 1 semisimple, 1 half-integrality, 1 positive part), 5 definitions, total 14; docstring names exactly 2 unstatable headlines | Text agrees with head | None |
| Description: "except for very even partitions in type `D`, where one half-spin module separates" (§2.3) | so(8), partition `(4,4)`, `h=(3,3,1,1)` and `h′=(3,3,1,−1)` | Standard: eigenvalues `±3, ±1` twice each on both. `S⁺`: `4,2,0⁴,−2,−4` versus `3²,1²,(−1)²,(−3)²`; top index 4 versus 3, both dimension 8 | Standard fails, `S⁺` separates | None |
| Summary block: half-integrality "covers infinite-dimensional irreducible highest-weight modules" (§5.2) | sl₂, `ν(α)=½`; Verma `λ(H)=−2` and `λ(H)=−1` | `E·Fᵏv = −k(k+1)Fᵏ⁻¹v` resp. `−k²Fᵏ⁻¹v`, both nonzero: irreducible. `2ν(λ−kα) = −(k+1)` (all integers, `2ν(λ)=−1`) resp. `−(k+½)` (none, `2ν(λ)=−½`) | Both sides true; both sides false | None |
| Summary block: "the group results allow a central torus", "for q > 1" (§5.5) | GL₂, `q=4`, `s=diag(2i,1)`, `s′=diag(1,2)` | Standard pattern: 1 at `i=1`, 1 at `i=0` on both; positive parts `diag(2,1)`, `diag(1,2)`, conjugate by the swap; centre of GL₂ is a torus | Statement holds with non-finite centre | None |
| Description: LieHighestWeight "Layer 7, its target `serreLift_injective_of_base`" and "Layer 8", same on main and in the open revision | LieHighestWeight README on main and at the open revision's head | Main: Layer 7 heading line 1744, target line 2073, Layer 8 line 2220. Open revision: lines 961, 1043, 1101 | Citation resolves at both | None |
| Description: "three other roadmaps, none of them a prerequisite" | Every roadmap name in the README | Suppliers with a contract section: 6 (5 on main, ReductiveGroupsPartIII open). Others named: 3 (two consumers, NoncompactQuantumSymmetry Layer 3 as owner, README line 16) | Text agrees with head | None |

Rows for the statements of the folder stand as in the previous review, of `26297a5`.

- Pull-request text: title, the `roadmap-summary` block and every sentence of the prose checked against the head; none contradicted. The change is a new folder (47 headings, 14 declarations, none removed), which the description states ("Adds LieHighestWeightPartII"); no change outside the folder.
- Cross-roadmap citations resolved: 6. LieHighestWeight Layers 7 and 8 (main and open revision); NoncompactQuantumSymmetry Layer 3 (`Ad(G)=Int(𝔤)=Aut(𝔤)₀` at its README line 1038, inside Layer 3); ReductiveGroupsPartIII §0.3 and §0.5 (lines 433, 467); GlobalShtukasAndFunctionFieldLanglandsPartII §8.0 (line 1183).
- Pinned declarations opened: `TauCeti/Algebra/Lie/AdjointAction/InnerAutomorphismGroup.lean:70` (`intLieAlgebra`); modules `Algebra/Lie/AdjointAction/CartanConjugacy.lean`, `Algebra/Lie/Sl2/WeightedDiagram/Dominant.lean`, `Algebra/Lie/HighestWeight/ChevalleyRestriction.lean` exist, as the description's "pinned … declarations" says.
- Gate rerun at this head: every scanner 0, `OK`. Dependency check: `depcheck: 244 roadmaps, 2229 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `Suggested.lean`: 9 warnings, all `declaration uses sorry`, no error. The worker's elaborated signatures list 14 declarations, none with a lost binder; the file is unchanged since the `#check @name` pass of the previous review.
- No source locator was reopened this round (no passage changed); the seeded sample falls in no changed passage.
- Overlap check: read LieHighestWeight (main and open revision), ReductiveGroupsPartIII, NoncompactQuantumSymmetry, GlobalShtukasAndFunctionFieldLanglandsPartII, SmoothRepresentationsOfLocalGroupsPartII, and searched every open head and main for `weightFiltration`, `weightPattern`, `IsSl2TripleOrZero`, `IsPositiveRealPart`, `IsGeometricPoint`; nothing shared (the two Part II roadmaps consume §§5.2–5.5; no other roadmap declares these names).
- Source independence: changed passages only; 0 passages changed, so none compared; largest share CH, 26 of 41 explicit line-locator occurrences; no layer added, removed or reordered, so the arrangement comparison of the earlier review stands.

## Not verifiable

- Published CH, DG and KIR versions remain uncollated with the arXiv versions and author-page draft the README cites; nothing checked this round depends on them.
- The description's sentence on AI assistance and on later author-side passes describes process, not the head; it was not checked.

## Source issues

- none

## For the human reviewers

- **Scope.** The four end theorems are Lemmas 2.4, 6.30, 10.9 and Proposition 10.2 of CH, read at arXiv v1; CH supplies 26 of the README's 41 explicit line-locator occurrences.
- **Scope.** §3.3 asserts injectivity on 7, 28, 34, 274, 245 candidate profiles. CH reports a computer calculation without a proof; an earlier review reproduced those counts by script.
- **Licence.** SOM is unpublished, unfinished notes (§3.2 unfinished, §4.1 empty), hosted on another mathematician's university page; the manifest classifies the copy as institutional.
- **Licence.** KIR is the author-page draft of a Cambridge University Press book; the manifest classifies the copy as author-page.
