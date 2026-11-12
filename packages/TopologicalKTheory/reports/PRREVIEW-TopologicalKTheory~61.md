# Review of TopologicalKTheory (pull request #1807 at 8d8b243)

**Verdict:** accepted

No findings.

## Previous findings

- R01 — repaired: lines 594–607 now read "On imports compatible with Mathlib's instance, without `Plucker.lean` or `Stabilization.lean`, prove every `TauCeti.finiteGrassmannian 𝕜 r N` Hausdorff … and prove the stage inclusion `TauCeti.finiteGrassmannian.map` along `Function.ExtendByZero.linearMap 𝕜 𝕜 Fin.castSucc` a closed embedding". Lines 789–796 and 1026–1028 use these facts.

## Deferred findings

- D01 — stands
- D02 — stands

## Verified sound

| Statement | Instances | Values computed on each side | Result |
|---|---|---|---|
| T1.5: Hausdorffness of `finiteGrassmannian 𝕜 r N` (new, lines 594–601) | ℝ, r=1, N=2; r=0; r=3>N=2; wrong model | span(e₀)↦diag(1,0), span(e₁)↦diag(0,1), span(1,1)↦½[[1,1],[1,1]], so distinct. The range of P is V. r=0: P=0 on a point. r>N: empty. V↦tr P=r is constant | holds; probe exit 0 |
| T1.5: closed stage inclusion (new, lines 601–607) | ℝ, r=1, N=2→3; N=0→1, r=0; non-compact control | Image of RP¹ is {[x:y:0]}, closed. Point→point. x↦[x:1], ℝ→RP¹, is a continuous injection that misses [1:0], so it is not closed: compactness (`Orthonormal.lean:225`) is needed | holds; probe exit 0 |
| T1.6a: carrier `Gr_k∞(𝕜)` along `map` (changed, lines 789–796) | span(1,2)⊂ℝ²; rank one | `map` along castSucc gives span(1,2,0). `ambientStabilization V := map (ExtendByZero.linearMap 𝕜 𝕜 Fin.castSucc) …` (`Stabilization.lean:116`), so they agree by rfl. Stages RP¹⊂RP²⊂⋯ | "by definition" is accurate |
| T1.6d: stage comparison on Mathlib's ℙ (changed, lines 1021–1029) | `import Mathlib` with each Grassmannian module; naturality | Map, Tautological and Orthonormal load (exit 0). Stabilization and Plucker fail on `Projectivization.instTopologicalSpace._aux_1`. `[(1,2)]↦span(1,2)↦span(1,2,0)` is the image of `[(1,2,0)]` | statable in one environment |
| Supplier contract, lines 98–101 (changed) | the T1.6a and T1.6d references | The fixed-rank carrier is at line 789, inside T1.6a (lines 623–831). The rank-one comparison is at line 1021, inside T1.6d (from line 1001) | resolves |

The rows for untouched statements (the seeded T2.0 and T7.0, the headline `nonempty_homotopyGroup_orthogonalGroup_mulEquiv`, the T4, T6.6 and T7.1 Checks) stand as in the previous review, of `ed37e7d`.

- **Gate.** The worker's gate passed, with every check 0 and `build=0`. My re-run with `--base origin/main` gives `outside-folder=24` and every other check 0. The 24 files are the two files of each of the 12 folders the brief names as this pull request's own. The filtered `git diff --stat` is empty.
- **Dependency check.** `depcheck: 206 roadmaps, 1907 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- **Elaboration and probe.**
  - `lake env lean` on `TauCetiRoadmap/TopologicalKTheory/Suggested.lean` exits 0, with only `sorry` at 58:8. The file is unchanged since `ed37e7d`. The one declaration's elaborated type has lost no binder.
  - A scratch file imports `Mathlib` and Tau Ceti's `Topology.Grassmannian.Map` and `.Tautological`, with Mathlib's `Projectivization.instTopologicalSpace` in scope. It proves `T2Space (finiteGrassmannian 𝕜 r N)` and the `IsClosedEmbedding` of `map` along castSucc, by exactly the route of lines 596–607 (exit 0).
- **Library declarations: 12 opened at the pins.**
  - Tau Ceti: `toEuclidean_injective` (`Tautological.lean:80`), `continuous_starProjection_toEuclidean` (`:110`), `finiteGrassmannian.map` (`Map.lean:51`), `map_injective` (`:81`), `continuous_map` (`:88`), `CompactSpace` (`Orthonormal.lean:225`), `ambientStabilization` (`Stabilization.lean:116`).
  - Mathlib: `T2Space.of_injective_continuous` (`Separation/Hausdorff.lean:369`), `Continuous.isClosedEmbedding` (`:685`), `Submodule.range_starProjection` (`InnerProductSpace/Projection/Basic.lean:302`), `Function.ExtendByZero.linearMap` (`LinearAlgebra/Pi.lean:594`, arguments `R M s`), `Projectivization.instTopologicalSpace`.
- **Cross-roadmap citations: 6 resolved.**
  - AlgebraicTopology §4.6 (line 1827). It proves T2 only for Mathlib's ℝPⁿ (line 909): another carrier, not a second owner.
  - ComplexKahlerGeometry K7.1 and GeneralizedCohomology G4.0b (line 2836), at this head.
  - CharacteristicClasses, changed since `ed37e7d`, cites T1.5 and T1.6a. It does not rely on `Plucker.lean` or `Stabilization.lean`.
  - For D01, DGFloerPartII (#1799) 4.2a–4.2c still own O and SO. For D02, AlgebraicTopology lines 2547 and 5363 still name only T1.5.
- **Seeded sample and pull-request text.**
  - T2.0 (line 1044) and T7.0 (line 1876) lie outside the diff. T7.0 consumes T1.6a's BO, whose stages the diff names by `map`, equal by rfl.
  - The title and description, including the TopologicalKTheory paragraph and the G4.0b → T1.5 move, still match this head. The change adds no supplier, section or declaration they would have to state.
- **Remark (untouched text).** In line 799, "native rank/ambient stabilizations" reads as `map` for the ambient part (line 794). The rank stabilization from `Stabilization.lean` serves only BO/BU, which no statement on Mathlib's ℙ here uses.

Overlap check: read CharacteristicClasses (#1854, #1808, main), GeneralizedCohomology (#1808, #1854, main), DGFloerPartII (#1799) and IndexTheory (main). Four objects are shared, each with one owner:
- Hausdorffness of `TauCeti.finiteGrassmannian` and its closed ambient stage inclusions belong to T1.5, and none of the eight claims them. On Mathlib's ℙ, AlgebraicTopology §4.6 owns ℝ and ComplexKahlerGeometry K7.1 owns ℂ.
- The smooth real and complex Grassmannian upgrade belongs to T1.5. Main's GeneralizedCohomology line 1149 owns it, and this pull request's own GeneralizedCohomology moves it; #1854's line 2747 consumes T1.5. #1808's G4.0b (lines 78–79) still owns it but is rebased onto this pull request, by the stated order this → #1808 → #1854.
- O and SO belong to T7.1 (D01).
- Equivariant K-theory Thom isomorphisms and the sphere Koszul reflection belong to T6 and T7.5, as IndexTheory line 67 states.

## Not verifiable

- `sibson-1969` (T7.0) is uncertified and was not read. The other T2.0 and T7.0 locators stand as checked at 2faed4d.
- Atiyah, *K-theory and reality* (1966): no legal copy, as recorded in earlier reviews.
- Ownership against open pull requests was checked only through the sibling checkouts and `roadmaps grep`.

## Source issues

- none
