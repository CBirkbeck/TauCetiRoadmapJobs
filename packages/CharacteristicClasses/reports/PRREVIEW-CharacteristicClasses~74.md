# Review of CharacteristicClasses (pull request #1807 at 8d8b243)

**Verdict:** accepted

## Previous findings

- R01 — repaired: C7.6 `:3306–3308` now reads "then by the inverse of K7.1's Riemann-sphere diffeomorphism from `OnePoint ℂ` to `Projectivization ℂ (Fin 2 → ℂ)` on Mathlib's topology". The scope bullet `:274–278`, the Tau Ceti and ComplexKahlerGeometry supplier rows, the C7 dependencies `:3357–3360` and the description all match it.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
| --- | --- | --- | --- | --- |
| C7.6 composite p:S³→S² | (1,0), (0,1), (1/√2, i/√2), and λ-multiples with \|λ\|=1 | [1:0]: v₁=0 gives ∞, the pole; [0:1]: t=1⁻¹·0=0; [1:i]: t=i⁻¹=−i; (λz₂)⁻¹λz₁=z₁/z₂, so each fibre is one circle | holds | none |
| C7.6 stereographic step | `onePointEquivSphereOfFinrankEq` hypothesis on ℂ, `Fin 3` | finrank ℝ ℂ + 1 = 2 + 1 = 3 = card (Fin 3) | hypothesis met | none |
| Scope `:276–278`, the import claim | `import Mathlib` with `import TauCeti.Topology.Algebra.Projectivization` | error: "environment already contains 'Projectivization.instTopologicalSpace._aux_1'"; the pinned diffeomorphism imports that module through `Instances.Projectivization` | claim true | none |
| C7.6's supplier, K7.1 | ComplexKahlerGeometry `:2779–2789`, `:2800–2805` at this head | the pinned map is on Tau Ceti's topology; K7.1 restates it "on Mathlib's instance by the same proof"; `OnePoint.instChartedSpace` imports only Mathlib | owned by K7.1 | none |
| C7.6 → AT8.16 hypotheses | Hopf p; constant map S³→S² | Hopf: fibre S¹, H₃(S¹;ℤ)=0, meets AT8.16; constant: fibre S³, H₃=ℤ, excluded | holds | none |
| C7.6 locator (seeded sample) | Hatcher §4.2, Exercise 34, p. 392 | `hatcher-at` line 17020 has Exercise 34; line 17001 shows printed p. 392; §4.2 exercises begin line 16851, and §4.3 starts p. 393 | holds | none |
| Description, CharacteristicClasses paragraph | against the head | "takes ComplexKahlerGeometry K7.1's Riemann-sphere diffeomorphism on Mathlib's topology (C7.6)" matches; the Tau Ceti list no longer names the diffeomorphism | matches | none |

Rows for untouched statements stand as in the previous review, of 78bda3b. That covers the rest of the seeded sample: C1.0, C1.1b, C1.3, C1.5, C1.6, C2.0, C2.3, C2.4, C3.4, C5.4, C6.3, C6.4, C7.2 and C7.3a.

- **Source locators: 1 checked against the text,** `hatcher-at` lines 17001 and 17020.
- **Pinned declarations opened: 8.**
  - `OnePoint.diffeomorphProjectivization` (Tau Ceti `Geometry/Manifold/Instances/OnePoint/Projectivization.lean:140`, namespace `OnePoint`, from `OnePoint 𝕜` to `ℙ 𝕜 (Fin 2 → 𝕜)`).
  - `Projectivization.instTopologicalSpace` in Tau Ceti (`Topology/Algebra/Projectivization.lean:90`) and in Mathlib (`:44`).
  - `OnePoint.equivProjectivization` (Mathlib `Topology/Compactification/OnePoint/ProjectiveLine.lean:84`).
  - `onePointEquivSphereOfFinrankEq` (Mathlib `Topology/Compactification/OnePoint/Sphere.lean:34`).
  - `Diffeomorph.toHomeomorph` (Mathlib `Geometry/Manifold/Diffeomorph.lean:267`).
  - `TauCeti.TopCat.mem_serreFibrations_of_exists_trivialization` (`Topology/Homotopy/SerreFibration/FiberBundle.lean:365`).
  - `TauCeti.ComplexProjectiveSpace` (`Topology/ComplexProjectiveSpace/Basic.lean:58`).
- **Cross-roadmap citations resolved:** ComplexKahlerGeometry K7.1 (this head, `:2779–2805`), AlgebraicTopology 8.16 (this head, `:5254`) and 2.5 (`:1171`). The resolver lists nothing unresolved.
- **Gate.**
  - The worker's gate at 8d8b243 passes, `build=0` included.
  - My rerun reports only `outside-folder=24`. Every hit is in the PR's own sibling folders, and the diff outside the 13 folders is empty.
  - Dependency check: `depcheck: 206 roadmaps, 1920 edges, 0 problem(s)`.
- **Lean.** `Suggested.lean` is unchanged since 78bda3b. `lake env lean` gives six `declaration uses sorry` warnings (lines 161, 185, 201, 225, 257, 281) and nothing else.
- **Overlap check:**
  - Read: TopologicalKTheory, AlgebraicTopology and GeneralizedCohomology (open); AlgebraicTopology, TangentialBordism and TopologicalKTheory (main). The third list is empty.
  - The Riemann-sphere diffeomorphism on Mathlib's topology has one owner, ComplexKahlerGeometry K7.1: a search finds it only there and in this README. BelyiMaps (main, `:546`) uses only Mathlib's equivalence.
  - #1808 and #1854 revise this folder after this pull request, as the merge-order block states.
- **Remark, no change asked here:** ComplexKahlerGeometry's consumer sentence (`ComplexKahlerGeometry/README.md:3557–3558`) names only the model comparison for C7.6, not the Riemann-sphere diffeomorphism it now also consumes.

## Not verifiable

- Nothing in the changed passages. The uncertified works (Milnor–Stasheff, Milnor's *Topology from the Differentiable Viewpoint*, Bott–Tu, Milnor's *Construction of Universal Bundles, II*) stand as recorded in earlier reviews.

## Source issues

- none
