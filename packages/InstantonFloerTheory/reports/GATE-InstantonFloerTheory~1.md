# GATE-InstantonFloerTheory~1: answers to the review of `c8af359`

The review is of `c8af359`. The branch head `5d973ec` already revises `TauCetiRoadmap/InstantonFloerTheory/README.md` (+121/−17) on every point the review makes. Each point below was checked against that head and against the primary sources. This round adds commit `f0af2535`, which fixes the gate failures: pinned blob links, LaTeX displays, and the Mathlib sub-imports and padding in `Suggested.lean`.

## H01 (roed-math) — applied

The filtered framed comparison now has its own subsections, IF10b and IF10c (README lines 180–210). They specify:
- period-cover lifts, with action `A_h` and an integer Floer lift;
- `U : (i, A_h) ↦ (i+4, A_h+1/2)` on `Z[U,U⁻¹] ⊗ o_α̃`, with the lifted differential and lifted mixed map;
- the forgetful quotients `C̄/(U−1) ≅ C_fold` (mod 4) and `C̄/(U²−1) ≅ C_det` (mod 8);
- the enriched category of perturbation sequences with losses `λ_n → 0`, and the triangular inverse `N_i = id + K_i`.

Checked against DFL21090703 line 3294: `deg_I(U α) − deg_I(α) = 1/2`. Line 3349: the map `N` is strictly filtered off the diagonal. Theorem 7.7 (line 3428) is over `Q[U^±1]`, and the README cites it as such.

## H02 (roed-math) — applied

IF7a (lines 99–128) now has:
- the integral counts `δ : C_1 → Z`, `δ' : Z → C_4`, `ν_Z : C_i → C_(i−4)` with `dν_Z − ν_Z d + 2δ'δ = 0`;
- the subquotient `Z(I)/B(I)`;
- the half-point `v = ν_Z/2` only after inverting 2.

The relation is Froyshov9903083 line 280 (Theorem 4(ii), `dv − vd + 2δ⊗δ' = 0`, cohomological). Transposing gives the homological relation exactly when `δ' = −a*`, and that is the adapter the README states. The reduced group matches Froyshov9903083 lines 546–559. The cobordism domain `H₁(W;Z) = 0` with negative-definite form matches lines 421–423.

IF7b (lines 130–136) pins Scaduto Theorem 1.3 (Scaduto14012093 lines 83–90): `ker(u²−64)` on four gradings, `⊗ H_*(S³) ⊕ H_*(pt)`. The README's `u = 2v` with `v² = 16` on T³ matches Scaduto14012093 lines 2608 and 2637–2657.

## H03 (roed-math) — applied

The README takes the first of the two endpoints the review offers. IF9a (lines 154–160) makes DFL's coherently oriented pair-strip complex the general integral target, and builds its orientation torsors `Λ^S_p` from gauge determinants through constant mixed caps. IF10a (lines 172–178) builds the raw mixed phase before any signed count.

IF9b (lines 162–168) keeps the decorated Fukaya identification, but only where its relative-spin, background and grading data are actually built (the framed `Σ_(g+1) ⊔ T²` splitting). The simply connected sign criterion is DFL21090703 line 642 (Remark 2.42). Remark 2.39 (line 590) is why no preferred spin lift is assumed in general.

## H04 (roed-math) — applied

The supplier table (rows for SmoothBundlesConnections, ComplexKahlerGeometry/PseudodifferentialOperators/IndexTheory and FourManifolds) and IF1 (lines 45–53) now consume FourManifolds F5's compact/local SU(2) core. IF4 (line 73) does the same. This roadmap owns:
- the SO(3) lift and transition comparison;
- `κ = c₂ − c₁²/4` against F5's `k = c₂`;
- the three-dimensional, cylindrical, perturbed and mixed extensions.

The F5 theorem consumed is in FourManifolds at its open head, lines 1066–1071 (unit 4-ball, `‖a‖_W¹,² + ‖a‖_L⁴ ≤ C‖F_A‖_L²`).

## H05 (roed-math) — applied

IF8 (line 146) now states the exact exponent `2⌈g/2⌉ − 1` on `Σ_g × S¹` and the upper bound for any odd genus-g detector, with genus 2 having `u² = 64`. IF6 (line 93) no longer reads as requiring a nonzero correction. This matches ChenScaduto16120869 lines 31–32 (Theorem 1) and lines 44–47 (Corollary 1). The bound for any detecting surface of genus g follows because the exponent is monotone in g.

## H06 (roed-math) — applied

IF1 (lines 45 and 53) cites K5a's `BundleSobolev`/`RealBundleSobolev` as specified supplier targets, not pinned declarations. These are defined in ComplexKahlerGeometry K5a on main, lines 728 and 785. Neither name occurs in the pinned Tau Ceti.

## H07 (roed-math) — applied

The order paragraph (line 214) now places IF10a's raw mixed phase before IF9a's paired monotonicity and orientations, and puts the signed strip complex and mixed counts after it.

## Changes made this round (commit `f0af2535`)

- **README.** The supplier-table and inline links pinned to roadmap blob commits (lines 13–19, 49 and 210) became plain citations by roadmap name and section (e.g. "FourManifolds F5"). The six `\[ … \]` LaTeX displays became Unicode code blocks (IF7a ×3, IF7b, IF10b ×2), and two `overline C` became `C̄`. Line 7 now says that `Suggested.lean` records the headlines that cannot be stated.
- **`Suggested.lean`.**
  - **Imports.** The three `Mathlib.*` sub-imports became `import Mathlib`.
  - **Declarations.** All 7 declarations were deleted: `plusSector`, `mem_plusSector`, `restrictToPlus`, `restrictToPlus_coe`, `restrictToPlus_comp`, `plusProjection` and `plusProjection_on_sector`. They are linear algebra on an arbitrary complex module and endomorphism, and name none of the roadmap's objects. `mem_plusSector` is `Module.End.mem_eigenspace_iff`, and `restrictToPlus_comp` is `rfl`.
  - **Docstring.** The new docstring lists the headlines (IF5, IF6, IF7a/b, IF8, IF9/10) and the carrier each one lacks.
  - **Pin check.** Mathlib at the pin has `Geometry/Manifold/VectorBundle` with `CovariantDerivative`, but no principal bundles or curvature (grep for `PrincipalBundle` and `curvature` under `Geometry/Manifold` finds nothing). Tau Ceti has no gauge-theory carrier: its "Floer" hits are all grid homology in `KnotTheory/Grid`.
  - **Signature check.** With no declarations left, there are no `#check @name` comparisons to make.

## Adversarial pass (statements verified or touched)

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| IF7a `dν−νd+2δ'δ=0` from Frøyshov via transpose | `a:C⁴→Z`, `a':Z→C¹`, `V:Cⁱ→C^(i+4)`, transpose of `dV−Vd+2a'a` | `V*d*−d*V*+2a*a'* = 0` ⇒ `dν−νd−2a*(a')* = 0`; with `δ'=−a*`, `δ=(a')*`: `+2δ'δ` | holds | none |
| `δ_j=δν^j` descends; `δν^kδ'=0` | degrees mod 8: `ν^kδ'(1)` in degree `4−4k ∈ {0,4}`, δ lives on degree 1 | `δν^jd = δν^(j−1)dν + 2δν^(j−1)δ'δ = 0` inductively | holds | none |
| Scaduto Thm 1.3 normalisation `u=2v=4μ` | T³: `τ` = multiplication by 4 (Scaduto line 2608) | `v²=16`, `u²=64`, `μ²=4` | consistent | none |
| `I#(S³)` calibration | `Î(S³)=0` | `I# = 0⊗H_*(S³) ⊕ H_*(pt) = C` in degree 0 | consistent | none |
| Nilpotence exponent `2⌈g/2⌉−1` | g = 1, 2, 3, 4 | 1, 1, 3, 3 | g = 2 gives exact square, matches IF8 text | none |
| IF10b `U:(i,A)↦(i+4,A+1/2)`, `U²=T⁻¹` | T: index +8, action −1, so `Tα̃` has grade `i−8`; J: half | `U=J⁻¹`: (+4, +1/2); `U²`: (+8, +1) = `T⁻¹` | consistent | none |
| `C̄/(U²−1) ≅ C_det` | two J-lifts over each folded generator, modulo `T=U⁻²` | rank 2 per folded generator, mod 8 grade preserved | consistent | none |
| `K_i` nilpotent in each degree | fixed integer degree i: each folded α has at most one `U^k` lift of degree i | finite rank and strictly action-lowering ⇒ nilpotent | holds | none |
| Excision/IF6 genus-one `u²−64=0` | g = 1 | exponent 1 | holds | none |

## Ownership and citations

- **Suppliers, in place or not.** SmoothBundlesConnections, PseudodifferentialOperators, IndexTheory, FukayaTheory, FourManifolds and GaugeQuiltFieldTheory are not on main. They are new-roadmap open pull requests, and the README cites them by name and section. DifferentialGeometry, AlgebraicTopology, CharacteristicClasses, GeometricTopology, ComplexKahlerGeometry, HeegaardFloer, SymplecticGeometry/HamiltonianReduction, SpinGeometry, SeibergWittenTheory and Orbifolds are on main.
- **Sections checked.** FourManifolds F5 (line 872 at its open head), FukayaTheory FK1 (line 68), HamiltonianReduction R5 (line 305) and K5a were checked.
- **Duplication.** The roadmap's own targets were not re-searched beyond the review's points. `Suggested.lean` now declares nothing, so no name collides.
- **Same author.** The open-PR suppliers are by the same author as this pull request (`kim-em`). Whether they count as "other authors' open pull requests" under the merge-order rule is for the worker to decide.
- **Sources manifest.** There is no `sources.toml` in the folder, and this job may not create one. The four texts read this round were fetched through the sources service: Froyshov9903083 (arXiv math/9903083), Scaduto14012093 (arXiv 1401.2093), ChenScaduto16120869 (arXiv 1612.08690) and DFL21090703 (arXiv 2109.07032). They are not yet recorded in a manifest.

## Not addressed (outside the review's scope)

- **README shape.** The README is not in the house shape:
  - the title is not `# Roadmap: …`;
  - it has no Scope and ownership, Conventions, How to read the build or Downstream consumers sections;
  - its layers are `IF0`–`IF10` without `### Examples`/`### Dependencies`;
  - it has no `**Checks.**` bullet lists, and the supplier table has no Exact supplier contracts section.

  Reshaping it would widen this job beyond the review. The gate does not flag it.
- **Suspicious text.** The review contains no embedded instructions.

## Build and gate

- `lake build TauCetiRoadmap.InstantonFloerTheory.Suggested`: `Build completed successfully (8976 jobs).`
- Gate summary line: `gate InstantonFloerTheory: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=1 metadata=0 dirty=0 outside-folder=0 source-material=0 FAIL`. The only failure is `depcheck: NOT IN ORDER: InstantonFloerTheory (insert it after its last supplier)`. Before this round the gate also had blob=16, latex=6, tex=31, imports=1, mathlib-subimports=3 and no-import-mathlib=1.
- Depcheck (`--movable`):
  ```
  NOT IN ORDER: InstantonFloerTheory (insert it after its last supplier)
  depcheck: 148 roadmaps, 1006 edges, 1 problem(s)
  ```
  There is no UPWARD or CYCLE line. "Not in the merge order" is the design-stage placement the brief describes, not a defect.
