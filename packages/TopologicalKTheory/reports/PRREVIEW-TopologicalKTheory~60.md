# Review of TopologicalKTheory (pull request #1807 at ed37e7d)

**Verdict:** needs changes

## R01 (P2) — T1.6d compares RP∞/CP∞ on Mathlib's topology, but the carrier and its Hausdorffness come from Tau Ceti modules that cannot be imported with Mathlib's topology

**Location.** `TauCetiRoadmap/TopologicalKTheory/README.md` lines 1002–1007: "identify Gr_1(𝕜^(N+1)) with native Projectivization, with Mathlib's topology, … and, by T1.5's naturality for injective linear maps, the stage inclusions. Their weak CW union is the same RP∞/CP∞ carrier." Line 775 builds that carrier "along the native closed embeddings `ambientStabilization`".

**Claim.** RP∞/CP∞ is the union along `ambientStabilization` (`Stabilization.lean`). Its closed stage embeddings and its CW structure use the Hausdorff instance of `Plucker.lean`. The new lines 91–95 say neither module is imported together with Mathlib's instance. So T1.6d's comparison cannot be stated in one environment, and no target owns these facts on imports that are compatible with Mathlib's.

**Witness.** `import Mathlib` followed by `import TauCeti.Topology.Grassmannian.Stabilization` (or `.Plucker`) fails with "environment already contains 'Projectivization.instTopologicalSpace._aux_1'". Mathlib's `RelCWComplex.isClosed_closedCell` requires `[T2Space X]`. `Plucker.lean:89` is the only general Hausdorff instance.

**Repair.**
1. Lines 773–776: "Name the fixed-rank universal carrier `Gr_k∞(𝕜)` as the union of Tau Ceti's carriers `TauCeti.finiteGrassmannian 𝕜 k (N+k)` along `TauCeti.finiteGrassmannian.map` for `Function.ExtendByZero.linearMap 𝕜 𝕜 Fin.castSucc` (`Map.lean`), which is Tau Ceti's `ambientStabilization` by definition, with the final topology for those inclusions."
2. Line 98, after "T1.5 owns the rank-one comparison on Mathlib's instance", add: "; for the targets that also use that instance (T1.6d), T1.5 owns on compatible imports two facts. The first is the Hausdorffness of `TauCeti.finiteGrassmannian 𝕜 r N`, from the continuous injective map `V ↦ V.toEuclidean.starProjection` (Tau Ceti's `TauCeti.finiteGrassmannian.continuous_starProjection_toEuclidean` and `TauCeti.finiteGrassmannian.toEuclidean_injective`, Mathlib's `T2Space.of_injective_continuous`). The second is the closed embedding of `TauCeti.finiteGrassmannian.map` along `Fin.castSucc`."
3. Lines 1006–1007: "… the stage inclusions, using T1.5's Hausdorffness and closed ambient embeddings in place of `Plucker.lean` and `Stabilization.lean`. Their weak CW union is the same RP∞/CP∞ carrier."

Tested: a scratch file imports `Mathlib`, `TauCeti.Topology.Grassmannian.Map` and `TauCeti.Topology.Grassmannian.Tautological`, with Mathlib's `Projectivization.instTopologicalSpace` in scope. The `T2Space` instance and the `IsClosedEmbedding` of the ambient `map` both elaborate (exit 0).

## Previous findings

- R01 — repaired: lines 575–592 read "In rank one own the real and complex projective comparison homeomorphisms … with Mathlib's nonzero-vector quotient topology … carried out on Mathlib's instance", with naturality along `Map.lean`. T1.6d and T6.6 cite T1.5. The colimit residue is this report's R01.
- R02 — not repaired: deferred (D01)
- R03 — repaired: "it is not a homomorphism of the matrix groups and their group laws do not pass to its colimit; the determinant is also not compatible with it, since det diag(A,−1)=−det A."
- R04 — repaired: T4 item 6 now has three Checks: the d=1 companion pencil, the β-coefficients of z, z⁻¹, z² and constants, and the inside projector of a non-normal matrix.
- R05 — repaired: "the class `[V]−[det V]−1` … maps to `t₁+t₂−t₁t₂−1=−(t₁−1)(t₂−1)≠0` … restricted instead to the rank-one subtorus U(1)×1 it maps to `(t+1)−t−1=0`".
- R06 — not repaired: deferred (D02)
- R07 — repaired: the description now reads "Its Suggested.lean replaces 21 declarations, pinned in Tau Ceti or README targets (T3.1, T4.2, T4.4), by π_k(O(n)) for n ≥ k+2."
- R08 — repaired: line 253 reads "a closed-manifold index consumer must reuse this construction."

## Deferred findings

- D01 — stands
- D02 — stands

## Verified sound

| Statement | Instances | Values computed on each side | Result |
|---|---|---|---|
| T1.5 rank-one comparison (changed) | n=0; ℝ, n=1 along castSucc; wrong model | ℙ(𝕜¹) is a point and Gr_1(𝕜¹) is `Subsingleton`. `[(1,2)]↦span(1,2)↦span(1,2,0)` = image of `[(1,2,0)]`. V↦V⊥ lands in Gr_(N−1) and is excluded by `equivSubmodule` | natural; all six names resolve |
| Supplier sentence, lines 91–98 (new) | `import Mathlib` with Stabilization, Plucker, Map, Tautological, Instances.Projectivization | fail, fail, load, load, fail, each failure on "…instTopologicalSpace._aux_1" | accurate |
| T1.6d stage comparison (changed; R01) | RP∞ along `ambientStabilization` beside Mathlib's ℙ | import fails; Mathlib's file (lines 44–83) has no T2 instance on ℙ; CW closedness needs T2 | not statable in one environment |
| R01 repair probe | `starProjection` injectivity; `map` along castSucc | `T2Space.of_injective_continuous` and `Continuous.isClosedEmbedding` elaborate, Mathlib's ℙ instance in scope | exit 0 |
| T4 Check, pencil d=1 (new) | `p=p₁z+p₀`; upper row (1,z) | `[[1,−z],[p₁,p₀]]→diag(1,p₀+p₁z)`; the wrong row gives `p₀−p₁z=p(−z)` | agrees with item 3 |
| T4 Check, β-coefficients (new) | z, z⁻¹, z², c over a point | ranks of V: 1, 0, 2, 0; coefficients 1, −1, 2, 0; classes 1+β, 1−β, 1+2β, 1; `(1+β)(1−β)=1` | agrees with item 6's sign |
| T4 Check, projector (new) | `diag(0,2)`; `[[1/2,1],[0,2]]` | `diag(1,0)`; eigenvector (2,3) for 2; `P=[[1,−2/3],[0,0]]`, `P²=P`, `PB=BP=[[1/2,−1/3],[0,0]]`; `diag(1,0)` does not commute with B | agrees with item 4 |
| T6.6 Check (changed) | T⊂U(2); U(1)×1 | `V−det V−1↦t₁+t₂−t₁t₂−1=−(t₁−1)(t₂−1)≠0`; on U(1)×1 it maps to `(t+1)−t−1=0` | discriminating |
| T7.1 Check (changed) | n=1, A=(1) | `j(I)=diag(1,−1)≠I`; `det diag(A,−1)=−det A=−1≠det A` | correct |

The rows for untouched statements (the seeded T2.0 and T7.0, the headline `nonempty_homotopyGroup_orthogonalGroup_mulEquiv`, the coefficient and Bott rows) stand as in the previous review, of 2faed4d.

- **Gate.** Re-run with `--base origin/main`. Every check is 0 except `outside-folder=24`, which is the two files of each of the 12 folders the brief names as this pull request's own. The filtered `git diff --stat` is empty, and the worker's gate passed, `build=0` included.
- **Dependency check.** `depcheck: 206 roadmaps, 1907 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- **Elaboration.** `lake env lean` on `TauCetiRoadmap/TopologicalKTheory/Suggested.lean` exits 0 in 9.7 s, with only `sorry` at 58:8. The file is unchanged since 2faed4d.
- **Library declarations: 15 opened at the pins.**
  - Mathlib: `Projectivization.continuous_iff`, `continuous_mk`, `equivSubmodule`, `map`; `T2Space.of_injective_continuous` (`Separation/Hausdorff.lean:369`); `Submodule.range_starProjection` (`Projection/Basic.lean:302`).
  - Tau Ceti: `finiteGrassmannian.isQuotientMap_frameSpan`; `map`, `coe_map`, `continuous_map` (`Map.lean:51–88`); `ambientStabilization` (`Stabilization.lean:116`, defined as `map` along `ExtendByZero.linearMap … Fin.castSucc`); `projectivizationHomeomorph` (`Projectivization.lean:46`); the T2 instance (`Plucker.lean:89`); `continuous_starProjection_toEuclidean` (`Tautological.lean:110`).
- **Cross-roadmap citations: 6 resolved.** ComplexKahlerGeometry K7.1 (lines 2711–2816; it owns T2 and the atlas on Mathlib's ℙℂ) and K7.2; AlgebraicTopology §4.6 (line 1827); GeneralizedCohomology G4.0b at this head (lines 3050–3058); CharacteristicClasses C7.3a (lines 3125–3131) consumes T1.5's comparison. No other folder of this pull request cites `projectivizationHomeomorph`.
- **Overlap check.** Read CharacteristicClasses (main, #1808, #1854), GeneralizedCohomology (#1808, #1854), DGFloerPartII and IndexTheory. Two objects are shared:
  - The rank-one projective comparison: its owner is T1.5. CharacteristicClasses C7.3a and GeneralizedCohomology G4.0b consume it. #1808's GeneralizedCohomology line 2565 still upgrades `equivSubmodule`; it is rebased onto this pull request.
  - O and SO: their owner is T7.1 (D01).
- **Remark (untouched text, outside this folder).** T1.5's diffeomorphism to AlgebraicTopology §4.6's real projective structure (line 592) meets §4.6's use of Tau Ceti's `Projectivization.instChartedSpace`. That atlas also fails to import with Mathlib (probe). AlgebraicTopology has to settle it.

## Not verifiable

- The seeded targets T2.0 and T7.0 lie in untouched text, and their locators stand as checked at 2faed4d. `sibson-1969` (T7.0) is uncertified and was not read.
- Atiyah, *K-theory and reality* (1966): no legal copy, as recorded in the previous review.
- Ownership against open pull requests was checked through the sibling checkouts and `roadmaps grep` only.

## Source issues

- none
