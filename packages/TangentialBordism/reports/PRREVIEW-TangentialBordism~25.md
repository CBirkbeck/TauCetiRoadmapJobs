# Review of TangentialBordism (pull request #942 at f212a45)

**Verdict:** needs changes

This is an incremental re-review of the 44 changed lines since 42329d2, all in `README.md`: a new Spin paragraph in the From Tau Ceti contracts, the 9.2 open-image route, the 9.2 *Needs:* line and the Layer 9 dependencies. `Suggested.lean` and `metadata.toml` are byte-identical to 42329d2. The gate passes. The dependency check reports no problem. `Suggested.lean` elaborates with its six `sorry` warnings and nothing else. Each of the five Tau Ceti declarations the change names exists at the pin with the stated meaning. Two findings remain, both P3:

- **R01:** the pull-request description, unchanged since the previous review.
- **R02:** a new "the pin lacks" sentence that a three-rewrite probe at the pin refutes, and a pinned input that the 9.2 route uses without naming it.

## R01 (P3) — The description still lists the closed #1663 and omits #886, whose numbering the README cites

**Location.** In the pull-request description:

- "- [ ] depends on: #1663";
- "Revisions of roadmaps on main whose numbering this roadmap cites, which merge first: #1652";
- the Depends-on block lists #1652, #1077 and #948, and not #886.

The README cites DifferentialGeometry 5.5b 23 times (`TauCetiRoadmap/TangentialBordism/README.md:88`, `:351–352`, `:484–497`, …).

**Claim.** The description names every open revision whose numbering the README cites, and names only open pull requests.

**Witness.** Main (1bea835) contains "5.5b" 0 times. #886 at 473c4df defines it (`TauCetiRoadmap/DifferentialGeometry/README.md:1480`, "5.5b Smooth faces, abstract boundary and corner Stokes"). The roadmap index of 2026-11-09 has no #1663. `scratch/overlaps.md` reports the same.

**Repair.** This is a change to the description only; nothing in the folder changes.

- Delete "depends on: #1663".
- Change the revision paragraph to "#886 (DifferentialGeometry 5.5b), #1652 (AlgebraicTopology Layers 2, 4, 6, 8 and 8.13)".
- Add #886 to the Depends-on block.
- Add one sentence: StringOrientation S1.5 owns OP² and F₄, which Layer 9 consumes. LieHighestWeight on main (`TauCetiRoadmap/RepresentationTheory/LieHighestWeight/README.md:1355–1356`) still assigns "automorphism transitivity on frames" to TangentialBordism B3. LieHighestWeight's own revision should redirect that pointer to S1.5.

## R02 (P3) — The new Spin contract says the pin computes neither Lie-algebra dimension, but the pin gives both by three rewrites; the 9.2 route also leaves the passage from `spinGroup` to its units range unnamed

**Location.**

- `README.md:361–363`: "The pin computes the dimension of neither Lie algebra; that the skew-symmetric n×n matrices have dimension n(n−1)/2 is proved in B3.7 for n=9."
- 9.2 `:2705–2719`: the route builds a homomorphism "from `spinGroup (TauCeti.realCliffordForm 9 0)`" (`:2706`), then applies automatic smoothness on "the range of `spinGroup.toUnits`" (`:2709`). It ends "of dimension 9·8/2=36" (`:2719`).
- *Needs:* `:2749`.

**Claim.** The pin does not compute either dimension, so B3.7 must prove it. The route's inputs are the four named Tau Ceti declarations.

**Witness.** A scratch probe under `lake env lean` proves `finrank ℝ (so (Fin n) ℝ) = n.choose 2` for all n by `rw [← (bivectorEquivSo n ℝ).toLinearEquiv.finrank_eq, exteriorPower.finrank_eq, Module.finrank_fin_fun]`. The quadratic side gives 36 at n=9, and 37 fails. The unnamed passage is pinned: `realCliffordSpinContinuousMulEquivUnitsRange` (`Projection.lean:93`).

**Repair.**

1. Replace `:361–363` with:

   > Both Lie algebras have dimension n(n−1)/2 at the pin. `CliffordAlgebra.bivectorEquivSo` (`TauCeti/LinearAlgebra/CliffordAlgebra/StandardBivector.lean`) identifies ⋀²ℝⁿ with the skew-symmetric matrices. `CliffordAlgebra.bivectorExteriorEquivQuadraticLieSubalgebra` (`TauCeti/LinearAlgebra/CliffordAlgebra/CliffordExteriorSquare.lean`) identifies it with the quadratic Clifford elements. Mathlib's `exteriorPower.finrank_eq` (`Mathlib/LinearAlgebra/ExteriorPower/Basis.lean`) gives ⋀²ℝⁿ dimension binom(n,2). `spinGroup (TauCeti.realCliffordForm n 0)` is isomorphic as a topological group to its units range (`TauCeti.CliffordAlgebra.realCliffordSpinContinuousMulEquivUnitsRange` in `TauCeti/Topology/Algebra/CliffordAlgebra/Spin/Real/Projection.lean`).

2. In 9.2:
   - cite the first three declarations at "of dimension 9·8/2=36";
   - say that the homomorphism is composed with the inverse of `realCliffordSpinContinuousMulEquivUnitsRange` before `ContinuousMonoidHom.toContMDiffMonoidMorphism` is applied;
   - add all four names to the *Needs:* line at `:2749`.

The repair was tested on the refuting instance: the first probe closes the dimension identity of so(n) for every n, and the second gives 36 for the Spin side at n=9.

## Previous findings

- R01 — not repaired: the description still reads "- [ ] depends on: #1663" and "Revisions of roadmaps on main whose numbering this roadmap cites, which merge first: #1652". #886, which alone defines the cited DifferentialGeometry 5.5b, appears nowhere in it. Carried forward as R01 above.

## Verified sound

### Gate, order, build

- **Gate** (`scratch/gate.md`, and rerun on this head): every check passes. The counts are set_option 0, blob 0, latex 0, prnum 0, sorry-data 0, statement-hygiene 0, readme-ids-missing 0, depcheck 0, stray-files 0, outside-folder 0, and build 0 in the worker's run. `git diff --stat origin/main...HEAD` outside the folder is empty. The folder holds `README.md`, `Suggested.lean` and `metadata.toml`.
- **Dependency check**, rerun with `--movable` against the merge order and main:

  ```
  depcheck: 235 roadmaps, 2261 edges, 0 problem(s)
  ```

  There is no UPWARD, CYCLE or `moved:` line. TangentialBordism is line 14 of the merge order, after IndexTheory (10) and StringOrientation (11). No roadmap on the never-cite list is cited: "HomotopySpheres" appears 0 times.
- **Elaboration.** `lake env lean TauCetiRoadmap/TangentialBordism/Suggested.lean` exits with exactly six warnings, `declaration uses sorry` at `:75`, `:96`, `:114`, `:130`, `:159` and `:177`. `git diff 42329d2 HEAD -- Suggested.lean` is empty. The `#check @` comparison, the padding probe (all six `simp` attempts fail) and the headline audit therefore carry over from the previous report unchanged. `scratch/signatures.md` lists the same six theorems; its "structure `,`" at line 157 is the `≃ₘ^∞⟮…⟯` notation mis-split by the tool.

### The changed passages: pinned declarations opened

| README claim | Pinned declaration, file:line | Agrees |
| --- | --- | --- |
| Native Spin carrier is a Lie group by the closed-subgroup structure | `TauCeti.CliffordAlgebra.realCliffordSpinUnitsRangeLieGroup`, an instance `LieGroup 𝓘(ℝ, SpinLieModel n) ∞ (range spinGroup.toUnits)`, `TauCeti/Geometry/Lie/CliffordAlgebra/Spin/Projection.lean:171`, from `nonempty_embeddedLieSubgroupData_lieSubalgebraOfSubgroup_of_isClosed` (`:83–91`) | yes |
| Special-orthogonal range carrier has closed-subgroup Lie structure, operator-norm topology | `realCliffordSpecialOrthogonalUnitsRangeLieGroup` `:183`; `attribute [local instance] Matrix.linftyOpTopologicalSpace` `:63`; the LocalDiffeomorph docstring `:21–22` says "not the default Pi topology" | yes |
| Lie algebra of the SO carrier ≅ skew-symmetric matrices | `realCliffordSpecialOrthogonalLieEquivSo n : LeftInvariantDerivation … ≃ₗ⁅ℝ⁆ LieAlgebra.Orthogonal.so (Fin n) ℝ` `:228` | yes |
| Lie algebra of the Spin carrier ≅ quadratic Clifford elements | `realCliffordSpinLieEquivQuadratic n` `:188` | yes |
| "for every n, dimensions zero and one included" | all take `(n : ℕ)` with no hypothesis; `LocalDiffeomorph.lean:23–24` and `:125` | yes |
| Projection is a local diffeomorphism | `isLocalDiffeomorph_realCliffordSpinToSpecialOrthogonalSmoothRange` `TauCeti/Geometry/Lie/CliffordAlgebra/Spin/LocalDiffeomorph.lean:126` | yes |
| Continuous homomorphisms of finite-dimensional real Lie groups are smooth | `ContinuousMonoidHom.toContMDiffMonoidMorphism` `TauCeti/Geometry/Lie/AutomaticSmoothness.lean:156` (`[FiniteDimensional ℝ E] [FiniteDimensional ℝ E'] [LieGroup I ∞ G] [LieGroup I' ∞ G']`); the source model is finite-dimensional by `realCliffordSpinLieModelFiniteDimensional` `Projection.lean:148` | yes |
| `TauCeti.realCliffordForm 9 0`, `spinGroup.toUnits` | `TauCeti.realCliffordForm` `TauCeti/LinearAlgebra/CliffordAlgebra/RealForm/Basic.lean:113` (namespace `TauCeti`); Mathlib `spinGroup.toUnits` `Mathlib/LinearAlgebra/CliffordAlgebra/SpinGroup.lean:404` | yes |
| "The pin computes the dimension of neither Lie algebra" | `CliffordAlgebra.bivectorEquivSo` `StandardBivector.lean:407`, `CliffordAlgebra.bivectorExteriorEquivQuadraticLieSubalgebra` `CliffordExteriorSquare.lean:47`, Mathlib `exteriorPower.finrank_eq` `ExteriorPower/Basis.lean:174`; also `Matrix.finrank_skewAdjointMatricesSubmodule_le_choose_two` `TauCeti/LinearAlgebra/Matrix/Involution.lean:114` and `TauCeti.finrank_so_three` `Algebra/Lie/Orthogonal/CrossProduct.lean:162` | no: R02 |
| Hom from `spinGroup` vs. the range carrier | `TauCeti.CliffordAlgebra.realCliffordSpinContinuousMulEquivUnitsRange` `TauCeti/Topology/Algebra/CliffordAlgebra/Spin/Real/Projection.lean:93` | unnamed: R02 |

For the probes, `TauCeti.LinearAlgebra.CliffordAlgebra.StandardBivector` was first built with `lake build <module>`; its dependencies were already built. The probe files are in the scratch directory.

### Adversarial mathematics table

New rows, for the statements the diff changes:

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| Contract `:344–360`: native Spin and SO range carriers, every n | n=0, 1, 9 | n=0: Cl=ℝ, no unit lies in range ι={0}, so the Lipschitz group and spinGroup are {1}; SO(0) is trivial; both models have dimension 0. n=1: spinGroup={±1}, SO(1)={1}, the 0-dimensional local diffeomorphism {±1}→{1}. n=9: so(9) has dimension 36. | pass |
| Contract `:361–363`: "pin computes neither dimension" | probe for all n; n=9; negative controls | finrank so(Fin n)=n.choose 2 closes by three rewrites; 9.choose 2=36; quadratic side at n=9 gives (9+0).choose 2=36; with 37 or n.choose 2+1 it fails | fail: R02 |
| 9.2 dimension 36 `:2713–2719` | local diffeomorphism and so(9); wrong models | dim Spin carrier = dim SO carrier = 9·8/2 = 36. Wrong candidates are excluded by the local diffeomorphism: the whole Cl(9,0) (2⁹=512), its even part (256), Spin(8) (28, S1.5's Check at #948 `:494`). | pass |
| 9.2 automatic smoothness `:2709–2713` | hypotheses of `toContMDiffMonoidMorphism` | Source: `SpinLieModel 9` is finite-dimensional (`Projection.lean:148`), with the `LieGroup … ∞` instance at `:171`. Target: S1.5's isotropy at E_0 is a point stabilizer of the continuous F₄-action on the 27-dimensional carrier, so it is closed in the compact Lie group F₄ (#948 `:466`) and is a Lie group by LieGroups Layer 2. The homomorphism's source is `spinGroup`, not the range, so the passage needs `realCliffordSpinContinuousMulEquivUnitsRange`. | pass, citation gap R02 |
| 9.2 open image `:2719–2722` | dimensions; SO(2)⊂SO(3) | injective dφ: ℝ³⁶→ℝ³⁶ is bijective, so φ is a local diffeomorphism at 1 (pinned `ContMDiffMonoidMorphism.isLocalDiffeomorphAt_of_lieMap_bijective`, `TauCeti/Geometry/Lie/Functor.lean:376`) and everywhere (`MonoidHom.isLocalDiffeomorph_iff_isLocalDiffeomorphAt`, `LocalDiffeomorph/Monoid.lean:37`); the image is open, and the isotropy is connected, so they are equal. Control: the injective SO(2)→SO(3) has dimensions 1<3, and its image is not open, so the equality of dimensions is needed. | pass |
| S1.5 count used by 9.2 | 52−36 | dim F₄ − dim Spin(9) = 16 = dim OP² (#948 `:494`) | pass |

Rows carried from the previous report (PRREVIEW-TangentialBordism~24, "Adversarial mathematics table") for statements the diff leaves untouched, each with the values recorded there:

| Statement | Values (r24) | Result |
| --- | --- | --- |
| `exists_contMDiff_homotopicRel` | empty source; point target, D=univ; identity of S¹ against g(z)=−z at distance 2, excluded | pass (r24) |
| smoothing route `:611–620` | uniform ε from compact P; segment in ε-ball ⊆ W; F=f on C | pass (r24) |
| relative transversality `:621–640` | D₁∘D₁⊆D; β=ψ² has dβ=0 where β=0 | pass (r24) |
| non-compact target `:640–647` | D=(W°×W°)∪(P_N×(P_N∖f(M))) open, contains the diagonal | pass (r24) |
| `isNullSet_image_criticalPoints_of_boundaryless` | t↦(t,0) image null; projection ℝ²→ℝ, no critical point | pass (r24) |
| Lindelöf needed `:691–692` | ℝ²_δ×[0,∞): critical values ℝ²; ℝ_δ bad set ℝ, ℤ bad set null | pass (r24) |
| parametric Check `:690` | bad set {0} | pass (r24) |
| depth strata `:686–688` | quadrant 1,2,1 components; cube 1,6,12,8; half-space M₂=∅ | pass (r24) |
| cone model, exhaustion, half-space Checks `:693–695` | cone convex with interior; f(x)=‖x‖², every c>0 regular; t², t | pass (r24) |
| 2.2 cylinder faces, u₁=−1, point signs, oriented atlas | −1=(−1)^(dim I); [−1]−[1] vs [1]−[−1]; two rays; [0,1] transition negative | pass (r24) |
| 2.4, 3.1–3.4 Checks | counts 0; (−1)^(1·1)=−1; [pt]≠0 in ΩO₀ via RP² | pass (r24) |
| 4.1, 4.2, 4.4 | AW homotopy; Sq¹a=a²; d₂ (1,2)↦(3,3); binary digits; degree 7→8 at p=3 | pass (r24) |
| 5.2, 5.4 | aba⁻¹b⁻¹ vs aa⁻¹bb⁻¹; block rotation of (cos θ e, sin θ e) is (e,0) | pass (r24) |
| 6.1, 6.3–6.6 | multiplicities 1,0,1,0,2; binom(6,2)=15; stems 4, 8; s₂=−10, gcd 5; ∂₂²σ(4)=1; 1−ρ=2 | pass (r24) |
| 7.1–7.2 | Â(K3)=2; α(K3×K3)=4b; σ=−16 | pass (r24) |
| 8.1, 8.3, 8.4, 8.5 | Arf(Lie torus)=1; 12ν of order 2 in ℤ/24; (w₄,w₂²) table; fibre degree −1, total (−1)^n | pass (r24) |
| 9.1 charts, 9.2 Clifford module, 9.3/9.4 classes | v=(1,i,j) gives (−i,k); C₀⋯C₈(1,0)=(−1,0), with −C₈ (1,0); L₄(OP²)=1, p(HP²)=1+2u+7u² | pass (r24) |
| 10.1–10.4 | d₅, d₆; H₆(Bℤ/m)=0; closed-fibre exclusion; −1∉S₃; s₃=−28, Scal ≥ 56 | pass (r24) |
| Scope: owner of η³=12ν | only here, FourManifolds #936 and K3BlochGroups #1430, both later | pass (r24) |

### Seeded sample

None of the fifteen seeded targets is 9.2 or the From Tau Ceti paragraph. 9.1 (`:2628`) and 9.4 (*Needs:* `:2791` "B3.6–B3.7") cite B3.7, but only for its quotient comparison and identifications, which the change leaves unchanged. Under the incremental rule they were not re-verified. Two locators of 8.3 were spot-checked:

- Freed, *Bordism: old and new*, (5.57) on page 45 (`freedBordism` lines 1787, 1814–1817): it lists the circle T as the Lie group representing the degree-one generator.
- Beaudry–Campbell, Figure 31, p.41 (`beaudryCampbell` lines 1722, 1741, 1752): its MSpin row has π₃=0.

The README flags no locator as unverified.

### Cross-roadmap citations resolved this round

- StringOrientation #948 (07f0981) S1.5 `:458–512`:
  - F₄ is a compact connected Lie group of dimension 52 (`:466`);
  - the stabilizer of diag(1,0,0) is a subgroup isomorphic to Spin(9), acting by the real spin representation (`:478–480`);
  - the dimension Check is at `:494`.
- DifferentialGeometry #886 (473c4df) 5.5b `:1480`; main (1bea835) has none.
- AlgebraicTopology #1652 (971f80a): Layers 2, 4, 6, 8 at `:969`, `:1229`, `:2082`, `:3158`; 6.3 at `:2437`; 8.13 at `:4109`.
- LieHighestWeight on main `:1355–1356`.
- **Overlaps** (`scratch/overlaps.md`, 5 items):
  - no open pull request changes this roadmap;
  - no cited id is dropped;
  - of the ids only an open revision defines, the AlgebraicTopology layers come from #1652, which the description names, and DifferentialGeometry 5.5b from #886, which it does not (R01);
  - of the vocabulary neighbours, HomotopySpheres is not cited, StringOrientation is a supplier earlier in the merge order, and FourManifolds and GeneralizedCohomology are consumers or suppliers in the stated direction.

### Remarks on untouched text (no change requested)

- S1.5 states "a subgroup isomorphic to Spin(9)" without saying as which kind of group. 9.2's "and so compact, connected and of dimension 36" (`:2721`) reads this as a Lie-group isomorphism, which S1.5's "OP² is a closed smooth 16-manifold F₄/Spin(9)" supports.

## Not verifiable

- As in the previous report: Lee, *Introduction to Smooth Manifolds*; Milnor–Stasheff Chapters 8, 16, 17; Milnor 1960; Wall 1960; Atiyah–Bott–Shapiro (uncertified); Kreck–Stolz (uncertified); Munkres; Stolz 1992; Anderson–Brown–Peterson; McCleary; Stong; Gompf–Stipsicz. They are paywalled or are books not readable here, and none is cited by the changed passages.

## Source issues

- none
