# GATE-HilbertModules~1: answers to human review

Commit `f04a4bef` on top of `9aaab4d` (not pushed). Files changed: `TauCetiRoadmap/HilbertModules/README.md` and `TauCetiRoadmap/HilbertModules/Suggested.lean`.

## H01 (roed-math) — applied
The H7 separation theorem now reads "for a nonempty closed convex L⊆E and x∉L" (README line 561; the change dates from `0cd29293` and is still present at this head). The counterexample A=E=0, L=∅, x=0 is now excluded. The proper-submodule form keeps its scope because every submodule contains 0.

## H02 (roed-math) — applied
The VonNeumannAlgebras paragraph (README lines 48–62) changed from "interior tensoring with a GNS representation" to an explicit model: the Hilbert space `E⊗_M L²(M,τ)` for a finite factor M with faithful normal tracial state τ. Its commuting right M-action comes from tracial `L²(M,τ)` and is a normal representation of the opposite algebra, transported to V7's sidedness convention. The paragraph also says that a left action induced from an arbitrary left action on E is not asserted to be normal.

## H03 (roed-math) — applied
H5 consumes TopologicalSheafCohomology TS1.1–TS1.2 with coefficient ring ℤ. This appears in the dependency list (README line 75) and in the H5 classification paragraph (line 404 onward). H5 keeps only the coefficient-specific and operator-algebra work. TS1.1–TS1.2 are stated for arbitrary topological spaces: see the TopologicalSheafCohomology README at its open head, line 9.

## H04 (roed-math) — applied
The unitary-dual construction now cites CStarAlgebras C2 for the pure-state/irreducible-GNS correspondence (README line 372). C2 is "Irreducible representations, primitive ideals, and the bidual" in the CStarAlgebras README at its open head, line 198.

## H05 (roed-math) — answered
Three of the suppliers named in the review are now on main: BanachAlgebras (A4), TopologicalKTheory (T1) and CharacteristicClasses (C1.2). BanachSpaceTheory, PDE, AlgebraicTopology, ComplexKahlerGeometry, NoncommutativeGeometry and OperatorTheory/SelfAdjointSpectralTheory are also on main. CStarAlgebras, VonNeumannAlgebras, TopologicalSheafCohomology and SmoothBundlesConnections are still open pull requests that add new roadmap folders. All ten links that were pinned to commits are now relative links by roadmap name and section. The direction check reports no UPWARD or CYCLE line (output below).

## H06 (kim-em) — answered
At `9aaab4d` the nonempty hypothesis (H01) was present. The finite-factor model `E⊗_M L²(M,τ)` was not written in the README: the dependency paragraph only said "interior tensoring with a GNS representation". It is now explicit (H02).

## H07 (roed-math) — applied
All four repair items hold at this head:
1. The dependency list names TS1.1–TS1.2 (README line 75).
2. H5 consumes those layers instead of building a second generic Čech theory (lines 402–427).
3. H5 keeps the exponential sequence, partition-of-unity contraction, nonabelian H¹, the `U(H)→Aut(K(H))` lifting obstruction and the Dixmier–Douady/Brauer theory (lines 429–493).
4. The closing interface paragraph says it consumes TS1.1–TS1.2 (lines 680–685).

## H08 (roed-math) — answered
The handedness of `θ_(ξ⊗a,η⊗b) ↦ θ_(ξ,η)⊗ab*` (README line 179) is correct when the inner product is linear in its second variable. Both sides were computed on `ζ⊗c`:
- left side: `(ξ⊗a)⟨η⊗b,ζ⊗c⟩ = ⟨η,ζ⟩ ξ⊗ab*c`;
- right side: `θ_(ξ,η)ζ ⊗ ab*c = ⟨η,ζ⟩ ξ⊗ab*c`.

No change was needed.

## H09 (roed-math) — applied
This is the V0-versus-C2 locator again; see H04 (README line 372 cites CStarAlgebras C2).

## H10 (kim-em) — answered
The description of `9aaab4d` matches the README there (TS1.1–TS1.2 consumption, ℤ coefficients, point-neighbourhood covers, C2 locator), with two updates:
- The commit-pinned supplier links are now relative links (H05).
- The "eight-admission prototype" has been replaced: `Suggested.lean` now states three H2 headline theorems (see the notes below), so the build shows three `sorry` warnings.

## Build and gate

- `lake build TauCetiRoadmap.HilbertModules.Suggested`: `Build completed successfully (8976 jobs).` There are three `declaration uses sorry` warnings, at lines 50, 63 and 75.
- Gate summary line: `gate HilbertModules: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=1 metadata=0 dirty=0 outside-folder=0 source-material=0 FAIL`
- The only failure is `depcheck: NOT IN ORDER: HilbertModules (insert it after its last supplier)`. The roadmap is not yet in the merge order, which the brief says is not a defect at this stage.
- At `9aaab4d` the gate failed on: blob=10, prnum=2, imports=1, mathlib-subimports=3, no-import-mathlib=1. All are now 0.
- Direction check output:

```
NOT IN ORDER: HilbertModules (insert it after its last supplier)
depcheck: 148 roadmaps, 999 edges, 1 problem(s)
```

## Notes on the repairs

- **Gate repairs in the README.** Commit-pinned GitHub links became relative links. The two Mathlib pull-request references now name Mathlib's unbundled `CStarAlgebra`/`NonUnitalCStarAlgebra` classes and its `cechComplexFunctor`.
- **Rewritten `Suggested.lean`.** The old file broke the acceptance-test rules in four ways: Mathlib sub-imports; `rankOne` defined by `.choose` of a `sorry`'d existence theorem (data that depends on `sorry`); one-line API lemmas such as `adjoint_unique`, `adjointPair_symm` and `norm_adjoint`; and no `TauCetiRoadmap.HilbertModules` namespace. The new file has `import Mathlib`, the required module docstring listing which headlines are not statable and what each lacks at the pins, one definition `IsAdjointPair` with a real body, and three theorems:
  - `adjointPair_exists_continuousLinearMaps`: now also asserts module linearity, replacing `adjointable_map_smul`.
  - `norm_adjoint_comp_self`.
  - `exists_parseval_frame_iff_finite_projective`: new; the README's H2 frame criterion, stated without `K_A(E)`. The README names all three (lines 150, 159, 198).
- **Binders.** Every declaration carries all of its binders explicitly; there are no section `variable`s, so nothing can be dropped. I did not run a separate `#check @name` scratch elaboration, because the brief allows only the two Lean commands above. The full build elaborates each signature as written.
- **Adversarial pass on the changed statements:**

| statement | instances | values | result |
|---|---|---|---|
| `adjointPair_exists_continuousLinearMaps` | A=0; additivity defect `D=T(x+x')−Tx−Tx'`; `T(xa)` | A=0 forces E=F=0 since `‖x‖²=‖⟨x,x⟩‖=0`; `⟨D,y⟩=⟨x+x',Sy⟩−⟨x,Sy⟩−⟨x',Sy⟩=0` for all y, so D=0; `⟨w,T(xa)⟩=⟨Sw,x⟩a=⟨w,(Tx)a⟩` | holds; completeness kept for the closed graph step |
| `norm_adjoint_comp_self` | A=ℂ, `T=[[0,1],[0,0]]`, `S=Tᵀ`; `T=2·id`; `T=0` | `ST=diag(0,1)`, norms 1 = 1²; 4 = 2²; 0 = 0 | holds |
| `exists_parseval_frame_iff_finite_projective` | A=ℂ, E=ℂ²; A=ℂ, E=ℓ²; A=C([0,1]), E=J={f(0)=0}; A=ℂ⊕ℂ, E=pA; E=0; A=0 | frame e₁,e₂ and fgp: both true; no finite frame and not f.g.: both false; J not f.g. (`g=√(Σ|f_i|)` is not in `Σ f_i A`): both false; frame x=p gives `p p* z = z`, projective: both true; n=0: both true; A=0 forces E=0: both true | holds; `x_i⟨x_i,z⟩` matches `inner Aᵐᵒᵖ (x i) z • x i` under the README's convention |
| README finite-factor model (H02) | right action `(ξ⊗h)m = ξ⊗hm` on `E⊗_M L²(M,τ)` | balancing uses the left GNS action on `L²(M,τ)`; the right action commutes with it and is normal for Mᵒᵖ | consistent with V7 as written |

- **Locators.** The `Suggested.lean` docstrings cite only locators the README already carries: Raeburn–Williams Definition 2.17, Blackadar II.7 and Roe Proposition 10.2. I added no new source and fetched nothing, so `needs-references.toml` was not written.
- **Ownership.** No new construction was added. The ownership checks against main and the open heads named in the brief (CStarAlgebras, VonNeumannAlgebras, TopologicalSheafCohomology, SmoothBundlesConnections) are as described under H05 and H07.
