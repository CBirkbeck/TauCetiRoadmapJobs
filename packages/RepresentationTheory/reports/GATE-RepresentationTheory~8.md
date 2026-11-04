# GATE-RepresentationTheory~8: answers to human review of the CompactGroups roadmap

Head before: `378d1df`. Repair commits: `09844384` (review points) and `590a7743` (missing family
`Suggested.lean`). Files changed: `TauCetiRoadmap/RepresentationTheory/CompactGroups/README.md`,
`TauCetiRoadmap/RepresentationTheory/CompactGroups/Suggested.lean` and the new
`TauCetiRoadmap/RepresentationTheory/Suggested.lean`.

## H01 (CBirkbeck) — applied

The overlap was real at `378d1df`: README Layer 5.1 already deferred ownership to
AutomorphicFormsOnReductiveGroups §2.1, but `Suggested.lean` still declared `IsGFinite`,
`gFiniteSubmodule`, `isGFinite_toRepresentation_iff`, `isGFinite_map`, `IsGFinite.intertwiner`,
`exists_uniform_operator_bound`, `exists_gFinite_near` and `dense_gFiniteSubmodule` (old lines
344–397). All of these are now removed. The README Layer 5.1 opening (old lines 395–406) now says that
§2.1 owns the predicate, submodule, elementary API and `gFiniteSubmodule_dense`, states what that
theorem says, and says none of them is restated here. This roadmap keeps only the explicit
approximation witnesses, the covariance `π(h)T_f v = T_(L_h f) v`, the norm estimates and the
uniform-on-compact-sets refinement (the split proposed in the comment).

## H02 (roed-math) — applied

Already repaired at `378d1df`; verified at the pin. Native `matrixCoeff π hπ v w g = ⟪π g v, w⟫`
(Tau Ceti `RepresentationTheory/Continuous/MatrixCoefficient.lean` line 72), so on `S¹` with
`π_n(z) = zⁿ` the block is `ℂ·z⁻ⁿ = ℂ·conj χ_n`. README Layer 6 (now lines 638–644) says that the
central line is spanned by `conj χ_π` and transfers completeness back by the inversion isometry
`TauCeti.ContRepresentation.invLpₗᵢ_characterLp` (Tau Ceti `Compact/Character/Basis.lean` line 186).
The other cited bridge is now written with its full name,
`toLp_star_character_mem_peterWeylBlock` → `TauCeti.toLp_star_character_mem_peterWeylBlock`
(Tau Ceti `Compact/IsotypicBlock/Basic.lean` line 298).

## H03 (roed-math) — applied

Already repaired at `378d1df`; verified by elaboration. `Suggested.lean` `peterWeylBasis` (line 328)
binds `G : Type u` and concludes `∃ (ι : Type u) …`, and `IsIrrepSkeleton`/`IsPeterWeylBasis` take
`{ι : Type v}`. The statement is now **proved**, not admitted, by
`TauCeti.IrrepClass ℂ G`, `TauCeti.isIrrepSkeleton_model`, `TauCeti.stdPeterWeylBasis` and
`TauCeti.coe_stdPeterWeylBasis` (Tau Ceti `Compact/PeterWeyl.lean` lines 664–722). The build
reports no `sorry` at that declaration. README Layer 5 (now lines 467–469) says that no universe-0
smallness or countability is imposed.

## H04 (roed-math) — applied

Same repair as H01. One owner is now chosen in both places: AutomorphicFormsOnReductiveGroups §2.1 (README
§2.1 table and `Suggested.lean` declaring `IsGFinite`, `gFiniteSubmodule`, `gFiniteSubmodule_dense`)
owns the core, and this roadmap neither declares nor proves it. The theorem-level order is stated in
README Layer 5.1's closing paragraph: topology-free prefix → Layer 5 matrix-coefficient density →
§2.1 Banach density → application adapters → SmoothBanachRepresentations SB4. The commit-pinned
GitHub links in that paragraph were replaced by roadmap-relative citations
(`../../AutomorphicFormsOnReductiveGroups/README.md#21-…`, `../../BanachAlgebras/README.md`). The
dead relative link `../SmoothBanachRepresentations/README.md` was replaced by the plain citation
"SmoothBanachRepresentations SB4".

## H05 (roed-math) — applied

Layer 2 (now lines 247–250) already named the continuous full subcategory. The same defect
remained in two other places and is repaired there. In the Conventions bullet (line 72 ff.),
"keep the mirror in step" → "the mirror is the full subcategory of `FDRep ℂ G` whose objects have
continuous parameter maps, not all of `FDRep ℂ G`". That bullet now carries a witness: a nonzero
additive `a : S¹ → ℂ` exists (it kills torsion and is ℚ-linear on `S¹/torsion`, so it is necessarily
discontinuous), and `g ↦ [[1,a(g)],[0,1]]` is an object of `FDRep ℂ S¹` whose invariant line `ℂe₁`
has no invariant complement. In the consume-map paragraph (lines 157–158), "forgetful correspondence with
`FDRep`" → "… with the full subcategory of `FDRep ℂ G` on continuous parameter maps".

## H06 (roed-math) — answered

No edit was needed. README `SU(2)` section (now lines 843–848) already says that the native
monomial-coordinate model `symPowerModel n` carries the Euclidean norm and is not unitary for
`n ≥ 2`, and that unitary coefficient and orthogonality results pass through
`exists_isUnitary_congr` (Tau Ceti `Compact/UnitaryModel.lean` line 88), while trace characters
transfer by equivalence invariance. No statement in `Suggested.lean` asserts unitarity of
`su2Irrep n`.

## Adversarial pass on changed statements

| Statement | Instances tried | Values | Result | Change |
|---|---|---|---|---|
| FDRep mirror is the continuous full subcategory (README Conventions, consume map) | `G = S¹`, `ρ(g) = [[1,a(g)],[0,1]]` with additive `a ≠ 0` | Invariant lines: `ℂe₁`, plus `ℂ(x,1)` iff `a(g)=0 ∀g`, which is false. A continuous additive `a` has compact image in `(ℂ,+)`, hence `a = 0` | the full `FDRep ℂ S¹` is not semisimple; the continuous subcategory excludes this object | added as witness |
| Same, trivial group | `G = 1` | every `FDRep` object is continuous; both categories agree | consistent | none |
| `gFiniteSubmodule_dense` as restated in Layer 5.1 (supplier's statement) | `E = 0`; `K = 1`; rotations on `C(S¹)` | `E=0`: `{0}` is dense. `K=1`: every orbit is one point, so the submodule is `E`. `C(S¹)`: trigonometric polynomials are dense although `‖R(θ)−I‖ = 2` for `θ ≠ 0` | true; strong continuity is the right hypothesis | none |
| Witness estimate `‖T_p v − T_u v‖ ≤ C_π‖p−u‖₁‖v‖` (Layer 5.1, unchanged; context re-read) | `v = 0`; `K` finite with counting probability | `0 ≤ 0`. Finite `K`: `‖Σ(p−u)(k)π(k)v‖/|K| ≤ C_π‖v‖·Σ|p−u|/|K|` | holds | none |
| Central line `ℂ·conj χ_π` (H02) | `S¹`, `π_n(z)=zⁿ`, `n = 1` | coefficient `⟪zv,w⟫ = z̄⟪v,w⟫ = z⁻¹⟪v,w⟫`; `χ_1 = z`; `⟪z, z⁻¹⟫_{L²} = ∫ z̄·z̄ = ∫ z⁻² = 0` | the block is `conj χ`, orthogonal to `χ` | already correct |
| `peterWeylBasis` universe (H03) | `G : Type u` | elaborates and is proved with `ι := TauCeti.IrrepClass ℂ G : Type u` | true at the pin | already correct |

Mechanical `#check` scratch: not run. The only Lean change deletes the Layer 5.1 section and edits
the module docstring, so no remaining declaration's signature or `variable` context changed. The
build below elaborates every remaining declaration.

Ownership: the G-finite core is AutomorphicFormsOnReductiveGroups §2.1, verified with
`roadmaps show AutomorphicFormsOnReductiveGroups` at its current PR head, README lines 289–311 and
`Suggested.lean` `IsGFinite`, `gFiniteSubmodule` and `gFiniteSubmodule_dense`. That roadmap is
earlier in the merge order, so it can supply this one. Its §2.1 consumes only CompactGroups Layers 0
and 5 as already on main (through pinned Tau Ceti declarations), not Layer 5.1, so there is no cycle.
No declaration of `Suggested.lean` now shares a name with a declaration of that roadmap.

Outside the review points and left unchanged (scope): `Suggested.lean` still has a file-level
`set_option backward.isDefEq.respectTransparency false`, a docstring not in the "target signatures"
form, and the side files `AbelianFourierTargets.lean`, `CountabilityTargets.lean`,
`InvariantMetricTargets.lean` and `ProductDualTargets.lean`. These conflict with the acceptance-test
rules and should be handled in a separate round.

## Missing family `Suggested.lean`

The umbrella folder `TauCetiRoadmap/RepresentationTheory/` had no top-level `Suggested.lean`, so the
module `TauCetiRoadmap.RepresentationTheory.Suggested` did not exist. It now exists (commit `590a7743`)
as the family index acceptance test. It has a single `import Mathlib`, the "Representation theory:
target signatures" module docstring, and the namespace `TauCetiRoadmap.RepresentationTheory`, and it
declares nothing. The docstring says why: the family page owns no theorem of its own, and every headline
(Wedderburn, the orthogonality relations, Mackey/Clifford, the highest-weight classification and the Weyl
character formula, the classical groups, Schur–Weyl, Peter–Weyl, …) is stated in its sub-roadmap's own
`Suggested.lean`. The text is identical to the family index file added on the sibling
LieGroups branch of this family. The umbrella `README.md` is unchanged and names no Lean declaration
of the family page, so README and Lean agree. With no declarations, there is nothing to `#check` and
no adversarial row to add.

## Build

- `lake build TauCetiRoadmap.RepresentationTheory.Suggested`: **Build completed successfully
  (8976 jobs)**, no warnings (the file declares nothing).
- `lake build TauCetiRoadmap.RepresentationTheory.CompactGroups.Suggested` (the module the review
  points changed): **Build completed successfully (9118 jobs)**, with 18 `declaration uses sorry`
  warnings and no errors.

## Gate

    gate RepresentationTheory: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK

Depcheck (`--movable`, umbrella README; also run on `CompactGroups/README.md`):

    depcheck: 176 roadmaps, 1177 edges, 0 problem(s)

No UPWARD or CYCLE line. `roadmaps resolve` on `CompactGroups/README.md` reports no unresolved
cross-roadmap citations and no unresolved Lean names.
