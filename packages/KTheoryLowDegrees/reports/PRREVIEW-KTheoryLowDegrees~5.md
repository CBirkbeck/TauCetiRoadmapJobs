# Review of KTheoryLowDegrees (pull request #1248 at 4d2f327)

**Verdict:** needs changes

## R01 (P3) — Name the existential Steinitz statement explicitly

**Location:** `TauCetiRoadmap/KTheoryLowDegrees/Suggested.lean:84–88`: `steinitz_decomposition` concludes `Nonempty (P.obj ≃ₗ[R] ((Fin r → R) × (⋀[R]^(r + 1) P.obj)))`.
**Claim:** The theorem name violates the gate's requirement that an isomorphism-existence corollary concluding `Nonempty` be named `nonempty_*`.
**Witness:** The supplied gate and independent rerun both report `statement-hygiene=1`, identifying this declaration at line 87; all other scanners pass.
**Repair:** Rename it `nonempty_steinitz_decomposition`, retaining the statement and `sorry`; update its references in `README.md:159,545` and the description's `roadmap-summary` block. The renamed scratch copy elaborates successfully with the same hypotheses.

## Previous findings

The preceding review accepted this head with no open findings. Its two recorded repairs remain in place:

- R01 — repaired: `TauCetiRoadmap/KTheoryLowDegrees/README.md:9,323,565` imports ClassicalArithmeticCompletion §§7.84 and 7.94; the local work is the explicit retraction, determinant comparison and ring enhancement.
- R02 — repaired: `TauCetiRoadmap/KTheoryLowDegrees/README.md:1789,1794` uses (det,rank), with the free rank-two class (O,2), negative line (L⁻¹,−1), and sum (L⁻¹,1).

## Verified sound

:robot: Incremental AI re-review of 0 changed lines since 4d2f327, including the current pull-request title and description.

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Steinitz existence, rank one | R=ℚ, P=ℚ, r=0 | Left ℚ; right 0×Λ¹ℚ=0×ℚ; a↦(0,a), inverse (0,a)↦a | Both composites send a to a | R01 changes only the name |
| Steinitz existence, rank two | R=ℚ, P=ℚ², r=1 | Left rank 2; right rank 1+1=2; (a,b)↦(a,b(e₁∧e₂)) | Inverse recovers (a,b) | R01 changes only the name |
| Steinitz positive-rank hypothesis | R=ℚ, P=0, r=0 | Hypothesis 0=1 is false; hypothetical right side 0×Λ¹0=0 | Excluded by the stated hypothesis | No hypothesis change |

Untouched adversarial rows stand as in the previous review of 4d2f327; they are not reproduced here.

- 0 folder lines changed; 0 outside-folder changes; the PR adds 3 files and 2199 lines against its base, with 0 removed headings or declarations.
- 1 title, the description prose and its `roadmap-summary` block checked against the head: no contradiction or omitted revision found; the other generated blocks are outside this text check.
- 0 changed seeded-source targets and 0 newly checked source locators; the settled source sample and headline inventory are carried from the preceding review.
- 2 pinned declarations reopened: `TauCeti/Algebra/Category/ModuleCat/CartanMap/Basic.lean:124` requires finite generation and projectivity; `Mathlib/RingTheory/DedekindDomain/Basic.lean:149` includes `IsDomain`.
- 0 unresolved cross-roadmap citations in the fresh resolver; ClassicalArithmeticCompletion §§7.84 and 7.94 reopened on main at `TauCetiRoadmap/ClassicalArithmeticCompletion/README.md:15873,16075`.
- Gate: 1 P3 failure, `statement-hygiene`; 0 other scanner failures, 0 upward edges and 0 cycles.
- Targeted build and direct elaboration both exit 0; each reports 13 warnings, all `sorry`.
- Renamed scratch copy: 25 declarations checked with `#check @name`; elaboration exits 0, with no lost hypotheses or type changes from the rename.

Dependency-check output:

```text
depcheck: 245 roadmaps, 2217 edges, 0 problem(s)
```

Overlap check: read SchemeKTheoryOperations, GeneralAlgebraicKTheory, K2SymbolsBrauer, ArithmeticKTheory, KTheoryFiniteLocalFields, AlgebraicKTheory, StableHomotopyKTheory and ClassicalArithmeticCompletion; owners are SchemeKTheoryOperations for projective operations and supported scheme K-theory, GeneralAlgebraicKTheory for categorical K-theory, AlgebraicKTheory for stable matrix/Steinberg objects, StableHomotopyKTheory for homotopy comparisons, and ClassicalArithmeticCompletion for additive Dedekind classification; KTheoryLowDegrees owns the concrete comparisons and graded determinant consumed by K2SymbolsBrauer, ArithmeticKTheory and KTheoryFiniteLocalFields. No changed ownership or conflicting-head issue is reported.

Source independence: changed passages only; 0 passages compared with 0 sources, 0 changed source locators and no changed material to test for wording or reuse; largest changed-locator share: none. Arrangement not reopened because no layer was added, removed or reordered.

## Not verifiable

- none within this incremental scope.

## Source issues

- none

## For the human reviewers

- none.
