# GATE-NoncommutativeIntegration~4

## H01 (mycaule) — applied differently

The two lemmas offered (`norm_sum_inner_le_sum_singularValues`, `sum_singularValues_add_le`) are the finite-dimensional Ky Fan maximum principle and triangle inequality, which `TauCetiRoadmap/OperatorTheory/Majorization/README.md` on main already owns as MAJ-A28 and MAJ-A31 (lines 179–186, `Kₖ(A)=∑_{i<k} σᵢ(A)`, the same zero-indexing as the I1 Check). So the proof belongs to that target, not to this roadmap. `TauCetiRoadmap/NoncommutativeIntegration/README.md` I1 Check: "(Fan 1951; see Moslehian, *Ky Fan inequalities*, §3)" → the same citation followed by "which OperatorTheory/Majorization owns as MAJ-A31 with the maximum principle MAJ-A28; the Check consumes it from there and does not reprove it". A new prerequisite bullet "OperatorTheory/Majorization MAJ-A28 and MAJ-A31" is added to the dependency list.

The file cannot "fill the I1 matrix Check as is", for three reasons. A README Check is a prose test and has no Lean counterpart. `Suggested.lean` may import only `Mathlib` and pinned `TauCeti.*` modules, never an external repository. And at our pin (Mathlib `6b7abb3`) neither name exists: a grep of the pinned Mathlib and Tau Ceti for `sum_singularValues_add_le`, `norm_sum_inner_le_sum_singularValues` and `singularValues_add` finds nothing, and `Mathlib/Analysis/InnerProductSpace/SingularValues.lean` has only the basic API (nonnegativity, antitonicity, support, `singularValues_zero`). Once it is built at the pin, it would naturally be contributed against MAJ-A28/MAJ-A31. The same two statements also appear in the open GrothendieckNotesLemmas roadmap. That roadmap is not in this roadmap's supplier list, so it is not cited here.

### Adversarial pass on the changed text

| statement | instance | values | result | change |
|---|---|---|---|---|
| MAJ-A31 `Kₖ(x+y) ≤ Kₖ(x)+Kₖ(y)` as consumed by the I1 Check | x=e₁₁, y=e₂₂ in M₂(ℂ), k=1,2 | k=1: K₁(x+y)=1, K₁(x)+K₁(y)=1+1=2; k=2: 2 ≤ 1+1=2 | holds, agrees with the existing Check values 1≤2 and 2≤2 | none |
| indexing agreement | Majorization `∑_{i<k} σᵢ` versus I1 `μ_t=s_⌊t⌋`, zero-indexed | k=0: empty sum 0 ≤ 0; k=1: σ₀=‖x‖ | consistent | none |
| pointwise non-example kept | s₁(x+y)=1, s₁(x)+s₁(y)=0 | 1 > 0 | still fails, as the Check states | none |

`Suggested.lean` is unchanged, so its 15 elaborated signatures in the scratch `signatures.md` still apply. I did not repeat the `#check` comparison.

Ownership: Majorization is on main, so it is a legal supplier. Ownership was checked against the open pull requests with `roadmaps grep -i 'ky fan'`: the hits are OperatorTheory, SpectralManifolds, GrothendieckNotesLemmas and ManifoldOptimization. None of them is a supplier this change needs.

## Build

`lake build TauCetiRoadmap.NoncommutativeIntegration.Suggested`: Build completed successfully (8976 jobs). The only warnings are the expected "declaration uses `sorry`" ones.

## Gate

Commit `b8cc926f` "NoncommutativeIntegration: review repairs (cite Majorization MAJ-A28/A31 as owner of finite Ky Fan)" (not pushed).

`gate NoncommutativeIntegration: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`

Depcheck (`--movable`): `depcheck: 163 roadmaps, 1163 edges, 0 problem(s)`. There are no UPWARD or CYCLE lines.

No sources were fetched and no texts are missing.
