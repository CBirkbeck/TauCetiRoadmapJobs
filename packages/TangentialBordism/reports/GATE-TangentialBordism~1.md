# GATE-TangentialBordism~1: answers to the human review

The review was written against head `f669b9e`. This answer is against `bf9da30`, and the repairs
are in commit `553af8f5`. Only `TauCetiRoadmap/TangentialBordism/README.md` changed.

## H01 (roed-math) — applied differently

The real Clifford-graded supplier now exists on main. SpinGeometry G5.0 constructs `realCliffordSpinorBundle` as P×_Spin(n)Cl(0,n), with the negative tangent action, the positive external action and the signed grading. G6.0 constructs `realSpinDiracOperator`, `realSpinDiracClosedRealization` on the H¹ domain, `realSpinLichnerowiczFormula`, and `realSpinDiracIndexClass` in KO^(−n)=KO_n through GeneralizedCohomology G5.5's `realMixedCliffordIndexClassification`; GeneralizedCohomology G5.5 also has `realNegativeCliffordFamilyIndex`. So the README now cites main and does not own a second copy. The SpinGeometry supplier row (README line 34) changes from "pinned commit, G4/G5.0/G6.0/G6.7, ([specification], a pull-request link)" to `../SpinGeometry/README.md`, G4, G5.0 and G6.0, and the row now names those declarations, the module model and the KO degree. B3.0's real normal-Bott, excision and ABS comparison stay owned here, as the review asked.

## H02 (roed-math) — applied

This was already done before this round, in commit `4a5e27d`, after the reviewed head. B3.4 (README lines 349–356) no longer uses Index I7.5's `rokhlin_signature_dvd_sixteen`. It writes α(M)=k·a, uses c(a)=2u², Â₄=−p₁/24 and p₁=3σ (from B6.1–2's ΩSO_4), and gets `2k=−σ(M)/8`, so σ=−16k. In this round the G6.7 quaternionic-symmetry import, which nothing in the README consumes any more, was also dropped from the SpinGeometry supplier row.

## H03 (roed-math) — applied differently

The compact real supplier now exists on main, in LieHighestWeight Layer 8 ("The compact real algebra suppliers" and "The formally real Albert supplier"). It provides:
- `TauCeti.DivisionOctonionReal := TauCeti.CayleyDickson (Quaternion ℝ)`, with positive conjugation, N(a,b)=‖a‖²+‖b‖² and two-generator associativity;
- `compactAlbertAlgebra`, with its positive-definite trace form and Peirce decomposition, and the result that primitive idempotents are the trace-one idempotents;
- `compactAlbertDerivation_complexification` and `compactAlbertDerivation_killing_negDef`, with the split and compact real forms kept apart.

The LieHighestWeight row (README line 39) changes from "pinned commit, Layer8 compact algebra sublane ([specification], a pull-request link)" to `../RepresentationTheory/LieHighestWeight/README.md`, Layer 8, and the row now names these interfaces. The review's split counterexample is correct. With N(a)=a·star(a)=star(a)·a=0, the matrix square has entries (0,0)=1+t²N(a)=1, (0,1)=t·star(a), (1,0)=t·a and (1,1)=t²N(a)=0, so A_t∘A_t=A_t and tr A_t=1 for every real t. B3.6 now carries this as a negative control (README lines 383–387): on the compact carrier, tr(A∘A)=1+2t²N(a)=1 forces t·a=0.

## H04 (roed-math) — answered

The upstream singular-manifold bordism work is not described as available at the pin. README line 20 calls it a proposal "whose proposed proofs are not implemented prerequisites". The pull-request number has been dropped from that sentence, and from two other lines (377, 447) that named Mathlib's Cayley–Dickson proposal by number.

## Other repairs (same pattern: citations resolved against main)

- **Links to main.** Links to GeometricTopology, GeneralizedCohomology, TopologicalKTheory and CharacteristicClasses pointed at old pinned blobs. They are now repository-relative links to main. The GeometricTopology anchor is corrected to `#the-smoothing-and-triangulation-comparison-far-horizon`, which matches the heading on main.
- **Links to open roadmaps.** Links to HomotopySpheres, FourManifolds, StringOrientation, IndexTheory and PseudodifferentialOperators, which are still open roadmaps, are now relative links by roadmap name. The sections they cite were checked at those roadmaps' heads: HomotopySpheres "Stage 5: stable framings and Pontryagin--Thom"; FourManifolds `quarticKThree` and `ellipticEOneFiberComplement_boundarySpin_eq_lie`; StringOrientation §S1; IndexTheory I1–I7.

## Adversarial pass on changed statements

| Statement | Instances tried | Values | Result | Change |
| --- | --- | --- | --- | --- |
| Split null octonion gives unbounded trace-one idempotents | a nonzero, N(a)=0, t ∈ ℝ | (A²)₀₀=1+t²N(a)=1; (A²)₀₁=t·star(a); (A²)₁₁=t²N(a)=0; tr=1 | holds for all t | added as a control |
| Compact carrier bounds the subtype | same A_t on the compact carrier, a≠0 | tr(A∘A)=1+2t²N(a), with N(a)>0; =1 iff t·a=0 | bounded | wording fixed |
| SpinGeometry row: real module, KO degree | n=0 and n=4 on main | n=0: Cl(0,0)=ℝ with grading ε_σ=σ·Id (G5.0); n=4: `realSpinDiracIndexClass = α·a` in KO₄ (G6.7, not consumed) | consistent with B3.4's α=−(σ/16)a | row rewritten |
| LieHighestWeight row: Killing form sign | D≠0 in the compact derivations | Killing(D,D)=−‖ad D‖²<0, from zero centre | negative definite, as B3.7 consumes | row rewritten |

## Repair: imports and the HomotopySpheres cycle

- **Imports.** `TauCetiRoadmap/TangentialBordism/Suggested.lean` lines 1–12 (eleven `Mathlib.<submodule>` lines and the Tau Ceti line) → `import Mathlib` followed by `import TauCeti.LinearAlgebra.BilinearForm.SymplecticBasis` (present at the pinned Tau Ceti). The failure seen before under full Mathlib was diagnosed: at the pin, `AddCommGroup (ZMod 2)` resolves first to `instAddCommGroupOfIsSimpleAddGroupOfIsNilpotent` (pinned Mathlib `Mathlib/GroupTheory/Nilpotent.lean:1182`, the `[IsSimpleGroup G] [IsNilpotent G] : CommGroup G` instance, additivised), whose `AddCommMonoid` is not syntactically the one in `Module (ZMod 2) (ZMod 2)`, so `q.polarBilin` had no `FunLike` instance. The section `FiniteQuadraticArf` now opens with `attribute [local instance 2000] Ring.toAddCommGroup` and a comment saying why, the same repair the pinned Tau Ceti uses for this diamond (`TauCeti/Algebra/Lie/F4/ShortRoot/Represented/Carrier/Basic.lean:209–215`). No statement, binder or body changed.
- **Cycle.** HomotopySpheres is an open new-roadmap pull request. It is not in the merge order, so it is not an admissible supplier, and it consumes this roadmap's B3.2 finite Arf invariant (its README lines 733 and 1119–1124). So this roadmap is the supplier, and the citation of HomotopySpheres Stage 5 is the edge that has to go. The finite framed construction moves down into this roadmap:
  - README supplier table, row "HomotopySpheres, finite and stable Stage5" → deleted. The convenient pointed spaces it also listed are already supplied by the AlgebraicTopology and GeneralizedCohomology rows.
  - B5.2, "Require HomotopySpheres to construct its separate finite-rank interface" → "Construct here the finite-rank framed interface used by this specialization". The interface statement itself (r≥1, d≥0, marked `S^(d+r)`, ordered normal rank-r frames, collared embedded bordisms, inverse witnesses, pinch addition, no stable premise, r=0 separate) is unchanged. It is now proved from B5.2's own general ξ construction with `B_r` a point.
  - B5.2, "consume HS Stage5.0's … theorem" / "transport HS Stage5.0's bijection" → "use that … theorem" / "transport that bijection". The ownership sentence "HS Stage5.0 owns … DGFloer1.5 consumes it" → "This B5 owns the finite-rank framed-sphere construction, the ξ-structured carrier comparison and its general finite/stable extension."
  - B5.5, "Compare the stable framed special case with HomotopySpheres' stable PT" → "Identify the stable framed special case (B a point, ξ trivial) of item4 with the stable framed PT map and its augmentation".
  - Moved notion: the honest-rank unstable framed Pontryagin–Thom bijection and the stable framed PT comparison, from HomotopySpheres Stage 5 down to TangentialBordism B5.2/B5.5. HomotopySpheres can consume them from here.

| Statement | Instances tried | Values | Result | Change |
| --- | --- | --- | --- | --- |
| B5.2 finite framed interface, now owned here | r=1, d=0 | signed framed points in marked S¹ ↔ π₁(S¹)=ℤ by signed count; empty cycle ↦ 0; +pt ⊔ −pt ↦ 0 via the arc bordism | bijection and group law agree | none (statement unchanged) |
| same | r=2, d=1 | framed circles in S³ ↔ π₃(S²)=ℤ; a fibre of the Hopf map with its pulled-back framing ↦ Hopf invariant 1; twisting the frame once changes the class by ±1 | consistent | none |
| same, excluded case | r=0, d=0 | a closed 0-submanifold of the marked S⁰ missing ∞ is ∅ or one point: two elements, a based set with no inverse for the point | r=0 stays a separate based-set carrier, as stated | none |
| B5.5 stable framed special case | B=pt, n=0 and n=1 | n=0: Ω^fr₀=ℤ ↔ π₀ˢ=ℤ, augmentation = signed count; n=1: S¹ with Lie framing ↦ η, 2η=0 in π₁ˢ=ℤ/2 | agrees with item4 at B=pt | wording only |
| `quadraticPolar_isAlt` and the Arf section under full Mathlib | x ∈ V over ZMod 2 | polar(x,x)=q(2x)−2q(x)=4q(x)−2q(x)=2q(x)=0 in ZMod 2 | proof elaborates under the instance fix | instance attribute only |

## Build and gate

- `lake build TauCetiRoadmap.TangentialBordism.Suggested`: **Build completed successfully (8980 jobs)**, with one warning: `declaration uses sorry` at Suggested.lean:72.
- Gate summary line: `gate TangentialBordism: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=1 metadata=0 dirty=0 outside-folder=0 source-material=0 FAIL`
  - The remaining depcheck item is `NOT IN ORDER: TangentialBordism (insert it after its last supplier)`. The brief says this is not a defect at the design stage.
- Depcheck (`--order … --movable`) output after the edits:

```
depcheck: 148 roadmaps, 1001 edges, 0 problem(s)
```

  - There is no UPWARD and no CYCLE line. The HomotopySpheres edge is gone: 1002 → 1001 edges.

## Notes

- **Ownership.** Ownership against open work was checked only for the objects H01 and H03 concern (real Clifford spinors and the real Dirac index; division octonions and the compact Albert algebra; both owners on main and cited) and for the finite framed Pontryagin–Thom construction moved down above (HomotopySpheres, an open pull request, is its consumer, not its owner).
- **Signatures.** The `Suggested.lean` declarations are unchanged except for the import block and the local instance-priority attribute. The `#check` comparison was not re-run separately; the successful build elaborates every declaration with the same binders.
- **Sources.** No source was fetched. The repairs concern supplier citations, imports and the computations above.
- **Untrusted text.** The review contains no instructions to run commands or act outside the job.
