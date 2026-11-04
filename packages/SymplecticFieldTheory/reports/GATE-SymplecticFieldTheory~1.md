# GATE-SymplecticFieldTheory~1: answers to human review

The review covers commit 2031ecb. Both of its required changes were already made at head 6700eed, which is the commit this round checks. The repair commit 28769f00 adds the library pointer (H03) and fixes the gate defects it found along the way.

## H01 (roed-math) — applied

The nonexact completed map now has an explicit Maurer–Cartan-twisted target, which follows the reviewer's "twisted nonexact theory" option. In `TauCetiRoadmap/SymplecticFieldTheory/README.md`:
- S8.NonexactRealization keeps the no-positive-end components.
- S9.QuantumMap sets `a_W=F_W|_(p+=0)` and defines `Q^(−,a)=exp(−a)Q−exp(a)` and `T_W=exp(−a)Z_W`. It derives `Q−(exp a)=0` from the potential equation.
- S9.RationalContactMap twists by `h^(−,b)=h−(q,p+κ∂_q b)`. It says that `φ_W` intertwines `d+` with `d^(−,b)`, not with `d−`, and keeps the untwisted map as a separately proved vanishing subcase.
- S9.CompositionAndChoices composes through the induced vacuum, `exp(a_21)=Z_2(exp a_1)`.

I recomputed the reviewer's witness, which is now a verification item under "Construction order and verification":
- `d+(x_2)=∂_(p_2)(θ(p_1+t)p_2)|_(p=0)=tθ`, while `d−(x_2)=θp_1|_(p=0)=0`.
- Substituting `p_1↦p_1+t` (from `b=t x_1`) turns `h−` into `θ(p_1+t)p_2=h+`.
- `|b|=2(n−3)=0` at n=3.

## H02 (roed-math) — applied

The Scope paragraph of the README now requires Ĵ to be ω̂-tame on the whole completion, compact core included: `ω̂(v,Ĵv)>0` for v≠0. Families require Ĵ_t to be tame for ω̂_t, with the same cylindrical ends, and global compatibility is allowed as a stronger choice.

The verification paragraph asks for tameness to be used together with exactness to exclude closed components. For a closed nonconstant component u, tameness gives `∫u*ω̂>0` and exactness gives `∫u*dλ=0`, so u cannot exist. Neither hypothesis does this alone.

## H03 (roed-math) — applied

At the Tau Ceti pin a91d3aaf, S0 cited three Mathlib pull requests (#42879, #42365, #39356) for gradings that the pinned library already has. They are replaced by the pinned declarations:
- `TauCeti.gradedTensorGrading`, `TauCeti.isInternal_gradedTensorGrading` and `TauCeti.gradedTensorLift` (`TauCeti/RingTheory/GradedAlgebra/TensorProduct.lean`, lines 71–192);
- `TauCeti.isDGAlgebra_gradedTensorGrading` and `TauCeti.dgTensorLift` (`TauCeti/Algebra/Homology/DG/Algebra/TensorProduct.lean`, lines 164 and 245);
- for the signed-quotient grading, `TauCeti.GradedAlgebra.quotientPiece` and `TauCeti.GradedAlgebra.isInternal_quotientPiece` (`TauCeti/RingTheory/GradedAlgebra/Homogeneous/Quotient.lean`, line 45).

The orbit, parity and quotient adapters stay targets of S0.

## Further repairs made while gating (not raised in the review)

- **`Suggested.lean`, imports.** The four `Mathlib.*` submodule imports and the unused import `TauCeti.Algebra.Homology.DG.Algebra.Defs` are replaced by `import Mathlib` plus `TauCeti.Algebra.Module.GradedModule.Internal`.
- **`Suggested.lean`, sorry'd data.** Three declarations had `sorry` as their body: `orbitGrading`, `signedSymGrading` and the `signedSymGradedAlgebra` instance.
  - `OrbitLines`, `OrbitModule` and `orbitGrading` are removed; no theorem used them.
  - `signedSymGrading` is replaced by `signedSymPiece`, which has a real body: the span of the images of homogeneous words of total degree p.
  - The instance is replaced by the theorem `nonempty_gradedAlgebra_signedSymPiece`.
  - `isDGAlgebra_of_generator_boundary` is removed as one-step assembly; the README says it in prose.
  - The module docstring now has the required form and names the headlines that cannot be stated at the pins: contact-homology invariance and functoriality, the SFT master and potential equations, and the S9 twisted maps. Mathlib has no contact structures or Reeb fields, and neither library has punctured holomorphic maps or virtual counts.
- **README S0 and the description of `Suggested.lean`.** S0 now names every Lean declaration. The opening paragraph now says what the Lean file states. One verification item was added for the sign convention of the signed algebra and for the generator criterion.
- **Citation links.** Pull-request links are replaced by links to roadmap paths:
  - ContactGeometry is on main at `TauCetiRoadmap/SymplecticGeometry/ContactGeometry`; it was linked as a closed pull request. CG1–CG5 are present there.
  - MorseNovikov is on main, and the link now goes to its N1 section.
  - HeegaardFloer is on main.
  - ImplicitAtlases (V0–V7) and GromovWittenTheory are open new-roadmap pull requests.

## Open item not repaired

The README cites "HeegaardFloer, F0 and F1.1–F1.5". HeegaardFloer on main has Lane F0 and a Lane F1 with three items only. F1.4 and F1.5 (determinant lines, weighted Riemann–Roch) exist only in the open revision pull request of that roadmap, and the rules forbid using such a pull request as a dependency. The contract therefore needs either those items moved down as targets here or a re-pointed supplier. That is beyond these review answers, and it is not repaired in this round.

## Adversarial pass on changed statements

| Statement | Instances | Values | Result |
|---|---|---|---|
| `signedSymPiece` | V=0; V=ℚx, \|x\|=1; V=ℚx, \|x\|=0 | V=0: piece 0=ℚ (empty word), piece p≠0=span{0}=⊥. \|x\|=1: x·x relates to −x·x, so 2x²=0 and piece 2=0. \|x\|=0: piece 0=ℚ[x] | Agrees with the exterior and polynomial algebras. Kept, and the odd case is now a verification item |
| `nonempty_gradedAlgebra_signedSymPiece` | Homogeneity of the relation for \|x\|=p, \|y\|=q | Both sides of the relation have degree p+q | True |
| `exists_unique_odd_extension` | Compatibility with the relation; δ=0 | d(xy)−(−1)^(pq)d(yx)=δx·y−(−1)^((p+1)q)y·δx=0; for x=y odd, d(x²)=δx·x−x·δx=0. δ=0 gives d=0 | True; the hypothesis hδ is needed for compatibility |
| `odd_square_zero_iff_generators` | \|x\|=0, \|y\|=1, \|z\|=2 | x↦y, y↦z gives d²x=z≠0 (both sides false); x↦y, y↦0 gives d²=0 (both sides true); d1=0 from 1∈piece 0 | True |
| S9 twisted rational target (H01) | Reviewer's witness, n=3 | d−=0, d+(x_2)=tθ, h^(−,b)=h+ | Consistent with S9.RationalContactMap |
| Global tameness (H02) | Closed nonconstant component | Area >0 from tameness, =0 from exactness | Exclusion holds only with both |

Signature check: every declaration in `Suggested.lean` carries all its binders explicitly and the file has no section `variable`, so each elaborated type is exactly its written signature. I did not elaborate a separate `#check` file, because the brief allows only the build command for Lean. The pre-computed signature file was unavailable because the elaboration failed. Each signature was compared with S0 of the README by hand.

Ownership: the free supercommutative orbit algebra is owned by S0 of this roadmap. `roadmaps resolve` reports no unresolved citations and no unresolved Lean names.

## Build and gate

- `lake build TauCetiRoadmap.SymplecticFieldTheory.Suggested`: Build completed successfully (8981 jobs), with three `declaration uses sorry` warnings, at lines 72, 80 and 93.
- Gate on commit 28769f00: `gate SymplecticFieldTheory: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=1 metadata=0 dirty=0 outside-folder=0 source-material=0 FAIL`.
- The only remaining failure is `depcheck: NOT IN ORDER: SymplecticFieldTheory (insert it after its last supplier)`. The roadmap is at the design stage and is not yet in the merge order, which the brief says is not a defect.
- Depcheck (`--movable`): `NOT IN ORDER: SymplecticFieldTheory (insert it after its last supplier)` / `depcheck: 148 roadmaps, 1006 edges, 1 problem(s)`. There are no UPWARD or CYCLE lines.

No new sources were fetched: the review answers needed none beyond the open arXiv references the reviewer gave, and no locator was added.
