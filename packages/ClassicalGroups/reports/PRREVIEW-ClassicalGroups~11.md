# Review of ClassicalGroups (pull request #1192 at 47ca68e)
Folder: `TauCetiRoadmap/RepresentationTheory/ClassicalGroups/`

**Verdict:** accepted

No finding. This is an incremental re-review of the 8 changed lines since `3eb0c3a` (4 insertions, 4 deletions, all in `README.md`): the seven Mathlib file-and-line locators that r10's R01 asked for, and nothing else. `Suggested.lean` is byte-identical to the head r10 read (`git diff 3eb0c3a HEAD` on the folder lists only `README.md`). Every changed locator was opened at the pull request's Mathlib pin `6b7abb3c` (the `.lake/packages/mathlib` of the worktree, checked against `lake-manifest.json`; Tau Ceti pin `a91d3aaf`, toolchain `v4.35.0-rc3`). Files inside the folder are named by basename.

## Previous findings

- R01 — repaired: `README.md:136` "`LinearAlgebra/SymplecticGroup.lean:58,101,132,148`"; `:152` "`LinearAlgebra/ExteriorPower/Basis.lean:94`"; `:168` "`LinearAlgebra/RootSystem/CartanMatrix.lean:106`"; `:186` "`LinearAlgebra/PiTensorProduct/Basis.lean:33`". At the pin those lines are the headers `def J`, `def symplecticGroup`, `def symJ`, `theorem symplectic_det`, `noncomputable def _root_.Module.Basis.exteriorPower`, `abbrev cartanMatrix` and `noncomputable def Basis.piTensorProduct`; `grep -n` for each of the seven names returns exactly these lines. The repair changed nothing but the four integers, so it introduced no new problem.

## Verified sound

### Mechanical checks

- **Worker's gate.** `gate.md` on this head sets every counter to zero, `build=0`, and ends `OK`.
- **My gate rerun.** The prescribed gate command on the worktree exited 0 with every text counter zero, `depcheck=0`, `dirty=0`, `outside-folder=0`, `stray-files=0`, `OK` (this invocation prints no build field; the elaboration below covers it).
- **Dependency check.** The prescribed `--depcheck --movable` run printed exactly:

  ```text
  depcheck: 236 roadmaps, 2419 edges, 0 problem(s)
  ```

  No UPWARD, CYCLE or moved line.
- **Files outside the folder.** `git diff --stat origin/main...HEAD` excluding the folder and the family index prints nothing; `changes.md` lists none; the folder holds only `README.md` and `Suggested.lean`.
- **Elaboration.** All seven imported `TauCeti.*` modules have their object files at `a91d3aaf`. `lake env lean` on `Suggested.lean` exits 0 with exactly eleven `declaration uses sorry` warnings, at lines 51, 60, 65, 74, 87, 102, 110, 180, 198, 209 and 216, and nothing else: the same eleven as at `3eb0c3a` and `c8d3edd`.
- **Signatures, probe and padding.** The Lean file is unchanged, so the r9 `#check @name` pass over all 22 declarations, the r8 one-tactic probe (none of the eleven admitted theorems closes) and the r8 padding audit stand; the r10 name probe of the eleven Mathlib names in these contract bullets (all elaborate) stands too, since the names did not change.

### Changed passages against the pin

| Changed text (`README.md`) | Line at Mathlib `6b7abb3c` |
| --- | --- |
| `:136` `SymplecticGroup.lean:58` for `Matrix.J` | `:58` `def J : Matrix (l ⊕ l) (l ⊕ l) R :=` |
| `:136` `SymplecticGroup.lean:101` for `Matrix.symplecticGroup` | `:101` `def symplecticGroup : Submonoid (Matrix (l ⊕ l) (l ⊕ l) R) where` |
| `:136` `SymplecticGroup.lean:132` for `SymplecticGroup.symJ` | `:132` `def symJ : symplecticGroup l R :=` |
| `:136` `SymplecticGroup.lean:148` for `SymplecticGroup.symplectic_det` | `:148` `theorem symplectic_det (hA : A ∈ symplecticGroup l R) : IsUnit <| det A` |
| `:152` `ExteriorPower/Basis.lean:94` for `Module.Basis.exteriorPower` | `:94` `noncomputable def _root_.Module.Basis.exteriorPower :` |
| `:168` `RootSystem/CartanMatrix.lean:106` for `RootPairing.Base.cartanMatrix` | `:106` `abbrev cartanMatrix :` |
| `:186` `PiTensorProduct/Basis.lean:33` for `Basis.piTensorProduct` | `:33` `noncomputable def Basis.piTensorProduct [Finite ι] (b : Π i, Basis (κ i) R (M i)) :` |

The sentences around the locators are unchanged from `3eb0c3a` and were verified against the pin in r10 (the `Submonoid` carrier, the `Set.powersetCard` index of the exterior-power basis, the crystallographic hypothesis of the Cartan matrix, the `Fin d → Fin n` index of the tensor-power basis). The README passages that consume these names (`:80`, `:253`, `:341`, `:624`, `:806` for `Matrix.J`/`symplecticGroup`, `b.cartanMatrix` and the symplectic embedding) are untouched and cite the names, not the line numbers.

The seeded sample for this round (0.1, 0.3, 1.1, 1.3, 2.1, 2.2, 3.2, 3.3, 3.4, 3.5, 4.2, 4.3, 6.2, 6.4, 6.6) lies entirely in text the diff does not touch; none of those targets cites a changed locator, no source locator was added or changed, and no copied passage can have entered through a four-integer change. Their r8 and r9 source verification (Molev 2002 and Milne 2022 in the sources cache, and the Tau Ceti declarations opened at the pin) stands.

### The adversarial table

Rows marked (r10), (r9) and (r8) cover statements the diff leaves untouched and are carried from the previous reports with their values. The one new row covers the only changed statement, the locators.

| Statement | Instances | Values on each side / wrong model | Result |
| --- | --- | --- | --- |
| Seven file-and-line locators open on the declaration header (new) | each of the seven cited lines | cited lines 58, 101, 132, 148, 94, 106, 33 = `grep -n` lines of `def J`, `def symplecticGroup`, `def symJ`, `theorem symplectic_det`, `Module.Basis.exteriorPower`, `abbrev cartanMatrix`, `Basis.piTensorProduct`; the previous values 59, 102, 133, 149, 95, 107, 36 were each one or more lines inside the signature or body (`:149` is `rw [isUnit_iff_exists_inv]`, `:36` is `Finsupp.basisSingleOne.map`) | pass |
| `Basis.piTensorProduct` index `Fin d → Fin n` (r10) | (d,n) = (0,2); (2,0); (2,2); (3,2) | 1, dimension 1 = 2⁰; 0 functions, `⨂² 0 = 0`; 4 = 2²; 8 = 2³ = `(trace 1)^d` of §1.1; wrong model `Fin n → Fin d` gives 1 ≠ 0 at (2,0) | pass |
| `Module.Basis.exteriorPower` index `Set.powersetCard (Fin n) k` (r10) | (n,k) = (3,2); (2,3); (2,2); (0,0) | 3 = binom(3,2); 0 so `⋀³ ℂ² = 0`; 1, the `det` line; 1 (empty subset); wrong model "all subsets" gives 4 ≠ 3 | pass |
| `symplectic_det` `IsUnit (det A)` (r10) | l = Fin 1: J; diag(2,1/2) over ℚ; diag(2,1) over ℤ | det J = 1; diag(2,1/2) ∈ Sp₂, det 1; diag(2,1) ∉ Sp₂, det 2 not a unit in ℤ, so the membership hypothesis is needed | pass |
| `cartanMatrix` integer, crystallographic (r10) | Sp₄ base (ε₁−ε₂, 2ε₂); A₁ over ℝ without the instance | [[2,−1],[−2,2]] in `Matrix b.support b.support ℤ`; without `IsCrystallographic` the abbrev does not elaborate | pass |
| `IsRootSystem` as a class, `weylGroup` as a subgroup of `Aut` (r10) | A₁ pairing over ℚ (root 1, coroot 2); over ℤ | holds over ℚ, fails over ℤ (coroot 2 spans 2ℤ); Weyl group of order 2 | pass |
| §4.2 `schur_character`, tall and bounded shapes (r9) | (1,1), n = 1; (2,1) at (2,3); (3) at 2 | 0 = 0; 30 = 6·5; 8 = 2³ | pass |
| `HasCartanType` contract, ranks 2–4 and validity (r9) | Sp₄, SO₅; Sp₆–SO₉; `Valid (C 2)`, `(B 2)`, `(D 3)` | `C 2`/`B 2` swap; `C 3 ≠ B 3`, `C 4 ≠ B 4`; false, true, false | pass |
| §6.2 Spin wording (r9) | Spin₃ weight 1/2 → Spin₂ | ±1/2, dimension 2 = 1 + 1 | pass |
| §0.1 standard, dual (r8) | diag(2,3); n = 0 | traces 5 and 5/6; empty module 0, zeroth power 1 | pass |
| §0.2 invariants (r8) | diag(2,1/2) on J; diag(−1,1) on I | AJAᵀ = J, det 1; AᵀA = I, det −1 | pass |
| §0.3 coefficients (r8) | det⁻¹ at 2; trivial at 0 | 1/2; 1 | pass |
| `rationalRep_isSemisimple` (r8) | W = 0, n = 0 | zero module semisimple; trivial group | pass |
| §1.1, §1.3 (r8) | (2,3), d = 2; one variable 2 | 25 = 19 + 6; 4 = 4 + 0 | pass |
| §1.2 powers (r8) | (2,3): h₂, e₂, e₃ | 19, 6, 0 | pass |
| §2.1, §2.2 images (r8) | (2), (1,1) on ℂ²; (1,1) on ℂ; empty on 0 | 3, 1; 0; 1 | pass |
| §2.3 (r8) | n = 2, d = 3 | 8 = 4·1 + 2·2 + 0 | pass |
| §3.1 torus, differential (r8) | diag(2,3); (1,−1) at diag(1+2ε,1+3ε) | 5, det⁻¹ 1/6; derivative −1 | pass |
| §3.2 labels (r8) | (1,−1); n = 0, 1 | shape (2), value 19/6; trivial Weyl group | pass |
| §3.3 classification (r8) | rank 1 weights −1, 0, 1 at 2; rank 0 | 1/2, 1, 2 distinct; one simple of dimension 1 | pass |
| `nonempty_schurFunctor_iso_rationalWeylFDRep` (r8) | (2,1), n = 2; (1,1), n = 1 | dimension 2 = 2; excluded by `colLen 0 ≤ n` | pass |
| §3.4 SL (r8) | (2,1), (1,0) at diag(2,1/2); at diag(2,3) | 5/2 = 5/2; 30 ≠ 5 | pass |
| §3.5 / 3A.1 isotropic basis, antidiagonal (r8) | u = e₁ + ie₂, v = (e₁ − ie₂)/2; diag(2,3) | (u,v) = 1, (u,u) = (v,v) = 0; A^R = diag(3,2) | pass |
| 3A.1 Sp torus, Borel block, Sp₂ unipotent (r8) | diag(t,t⁻¹); [[A,B],[0,(Aᵀ)⁻¹]]; [[1,1],[0,1]] | MJMᵀ = J; ⟺ A⁻¹B symmetric; weight 1, value 2 | pass |
| 3A.1 Cartan Check (r8) | C₂ order (ε₁−ε₂, 2ε₂), swapped; D₃ | `C 2`, `B 2`; `A 3` | pass |
| 3A.2 fixed spaces, native hypotheses (r8) | Sp₂ at diag(2,1/2); {±1}; Gₘ tᵖ, char 3 | 0 = 0; Lie 1 ≠ group 0; 8 ≠ 1 | pass |
| 3A.3 ω sign, commutator, surjectivity (r8) | r = 1, 2, 3, all k, all basis wedges | κL − Lκ = (r − k)·id on 4 + 16 + 64 vectors; kernels binom(2r,k) − binom(2r,k−2) | pass |
| 3A.3 Hodge (r8) | ★ in dim 2, 4 | e₂, −e₁, −iu, iv; η₂ = 1 | pass |
| §4.1 `schurFunctor_tensor_multiplicity` (r8) | s₍₁₎², s₍₂,₁₎² in 3 variables, height drop in 2 | s₍₂₎ + s₍₁,₁₎; 64 = 8²; 3 + 1 = 4 | pass |
| §4.3 Laurent (r8) | (1,−1) at (2,3) | 19/6 | pass |
| §5.1 `rational_dimension` (r8) | (), (−1), (2,1), (2,1,0), (1,0,−1), (3,1,0) | 1, 1, 2, 8, 8, 15 = pattern counts = tableau counts | pass |
| §6.1 `rationalWeyl_branching` (r8) | (2,1,0) → GL₂; (1,−1) → GL₁ | 2 + 1 + 3 + 2 = 8; trace 7/2 | pass |
| §6.2 orthogonal, embedding (r8) | SO₃ → SO₂; SO₄ → SO₃; Sp₄ → Sp₂; q, w′ | 7/2; 3 + 1; 2 + 1 + 1; norm-one generator is i times Molev's | pass |
| §6.4, §6.6 (r8) | (2,1,0) coefficients; Capelli (2,1) | product 1/2; u² + 2u | pass |
| §6.7, 6B (r8) | SO₃ basis (u,w,v); λ = (0,−1) | torus trace 7/2; 2·1 + 1·2 = 4; nodes −1/2, −5/2 | pass |
| 6A subgroups, directions (r8) | T = I + E₁₂, D = diag(2,1); H = Δ, H_det | TD ≠ DT; ratios 2, 1/2, 1, 4 | pass |
| `connected_complex_overgroup` (r8) | n = 0, 1 | all four groups ⊤; H_det = Δ | pass |
| `scalarRestriction_exists_orderIso`, restriction theorems (r8) | weights −1, 2 at (3,2); n = 0 | 4/3; one-dimensional, irreducible | pass |

### Cross-roadmap citations and ownership

- **No cross-roadmap citation changed.** The diff touches four Mathlib line numbers; `citations.md` lists no cross-roadmap citation found nowhere, and its thirteen Lean-name leads are this roadmap's own `Suggested.lean` declarations (`DiagonalOvergroups.*`, declared at lines 51–216 of the unchanged file) and three Tau Ceti theorems opened at `Character.lean:93,132` and `SchurWeyl.lean:162` in r9.
- **No new ownership.** The diff adds no construction.
- **Overlap tool.** `overlaps.md` lists no other open pull request changing this roadmap, no dropped and no revision-only ids. The closest open roadmaps (TensorProductCombinatorics, LieHighestWeight, ClassicalGroupsPartII, RepresentationTheory) are untouched by the changed lines, and the r8 ownership check stands.
- **Scope of the ownership check.** Ownership against open pull requests was checked only through the listed checkouts and the overlap tool.

## Not verifiable

- **Universal statements:** the computed rows certify instances and elaborated signatures, not proofs of the targets.
- **Build field:** the prescribed gate invocation prints no build counter; the worker's gate (`build=0`) and my `lake env lean` run stand in for it.

## Source issues

- none
