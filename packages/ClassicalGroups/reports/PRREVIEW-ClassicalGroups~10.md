# Review of ClassicalGroups (pull request #1192 at 3eb0c3a)
Folder: `TauCetiRoadmap/RepresentationTheory/ClassicalGroups/`

**Verdict:** needs changes

One finding (P3). The sole finding of the previous review is repaired. This is an incremental re-review of the 26 changed lines since `c8d3edd`, all in `README.md` (the From Mathlib bullets on the classical groups, exterior powers, root systems and linear-algebra glue, and the `HasCartanType` sentence of the From Tau Ceti contract); `Suggested.lean` is byte-identical (`git diff c8d3edd HEAD` on it is empty). Every name and file-and-line locator the changed lines introduce was opened at the pull request's pins (Mathlib `6b7abb3c`, Tau Ceti `a91d3aaf`, the `.lake/packages` of the worktree, checked against `lake-manifest.json`). Files inside the folder are named by basename.

## R01 (P3) — Seven of the eleven new Mathlib file-and-line locators open below the declaration they name

**Location:** `README.md:135–136` "`LinearAlgebra/SymplecticGroup.lean:59,102,133,149`"; `README.md:152` "`LinearAlgebra/ExteriorPower/Basis.lean:95`"; `README.md:168` "`LinearAlgebra/RootSystem/CartanMatrix.lean:107`"; `README.md:186` "`LinearAlgebra/PiTensorProduct/Basis.lean:36`".

**Claim:** The line numbers open on `Matrix.J`, `Matrix.symplecticGroup`, `SymplecticGroup.symJ`, `SymplecticGroup.symplectic_det`, `Module.Basis.exteriorPower`, `RootPairing.Base.cartanMatrix` and `Basis.piTensorProduct` at Mathlib `6b7abb3c`, in the same way that the file's other locators (`HodgeStar.lean:48,53`, the 28 Tau Ceti lines, `Defs.lean:81,120`, `Base.lean:68`, `WeylGroup.lean:55`) open on the declaration's own line.

**Witness:** At the pin the declarations begin at `SymplecticGroup.lean:58` (`def J`), `:101` (`def symplecticGroup`), `:132` (`def symJ`), `:148` (`theorem symplectic_det`); `ExteriorPower/Basis.lean:94`; `CartanMatrix.lean:106` (`abbrev cartanMatrix`); `PiTensorProduct/Basis.lean:33`. The cited lines are the next line of the signature or body, and two land on nothing a reader can recognise: `SymplecticGroup.lean:149` is the proof step `rw [isUnit_iff_exists_inv]` and `PiTensorProduct/Basis.lean:36` is the body line `Finsupp.basisSingleOne.map`.

**Repair:** Write `LinearAlgebra/SymplecticGroup.lean:58,101,132,148`, `LinearAlgebra/ExteriorPower/Basis.lean:94`, `LinearAlgebra/RootSystem/CartanMatrix.lean:106` and `LinearAlgebra/PiTensorProduct/Basis.lean:33`. Tested on the refuting instances: `sed -n` on each of those lines at the pin prints the `def`, `abbrev` or `theorem` header carrying the named declaration (`grep -n` for the seven names returns exactly these lines).

## Previous findings

- R01 — repaired: `README.md:165–169` now reads "`RootPairing` and the root-system class `RootPairing.IsRootSystem` (`…/Defs.lean:81,120`), `RootPairing.Base` (`…/Base.lean:68`), the integer Cartan matrix of a base of a crystallographic root pairing `RootPairing.Base.cartanMatrix` …, and `RootPairing.weylGroup` (`…/WeylGroup.lean:55`)"; every name is declared at the pin (`#check` elaborates all four), and `RootSystem` and `RootPairing.cartanMatrix` occur nowhere in the README. The one-line slip in the `cartanMatrix` locator is part of R01 above.

## Verified sound

### Mechanical checks

- **Worker's gate.** `gate.md` on this head sets every counter to zero, `build=0`, and ends `OK`.
- **My gate rerun.** The prescribed gate command on the worktree completed (exit 0) with every text counter zero, `depcheck=0`, `dirty=0`, `outside-folder=0`, `OK` (this invocation prints no build field; the elaboration below covers it).
- **Dependency check.** The prescribed `--depcheck --movable` run printed exactly:

  ```text
  depcheck: 244 roadmaps, 2462 edges, 0 problem(s)
  ```

  No UPWARD, CYCLE or moved line.
- **Files outside the folder.** `changes.md` lists none, and the gate's `outside-folder=0` agrees. The folder holds only `README.md` and `Suggested.lean`.
- **Elaboration.** The seven imported Tau Ceti modules have their object files at `a91d3aaf`. `lake env lean` on `Suggested.lean` exits 0 with exactly eleven `declaration uses sorry` warnings, at lines 51, 60, 65, 74, 87, 102, 110, 180, 198, 209 and 216, and nothing else: the same eleven as at `c8d3edd`.
- **Signatures, probe and padding.** The file is unchanged, so the r9 `#check @name` pass over all 22 declarations, the r8 one-tactic probe (none of the eleven admitted theorems closes) and the r8 padding audit stand.
- **Name probe.** A scratch file with `#check @` on all eleven Mathlib names the changed lines cite (`Matrix.J`, `Matrix.symplecticGroup`, `SymplecticGroup.symJ`, `SymplecticGroup.symplectic_det`, `Module.Basis.exteriorPower`, `Set.powersetCard`, `Basis.piTensorProduct`, `RootPairing.IsRootSystem`, `RootPairing.Base`, `RootPairing.Base.cartanMatrix`, `RootPairing.weylGroup`) elaborates with no error. Two `example`s in the same file type-check the two new contract claims: `Basis.piTensorProduct (fun _ : Fin d => b)` has type `Module.Basis (Fin d → Fin n) ℂ (⨂[ℂ]^d V)` for `b : Module.Basis (Fin n) ℂ V`, and `b.exteriorPower k` has type `Module.Basis (Set.powersetCard I k) ℂ (⋀[ℂ]^k M)` for a linearly ordered `I` (the only diagnostics are the compiler's refusal to compile a noncomputable `example`, raised after elaboration).

### Changed passages against the pin

| Changed text | What the pin says |
| --- | --- |
| `Matrix.symplecticGroup l R` "a `Submonoid` of `Matrix (l ⊕ l) (l ⊕ l) R`", `Matrix.J`, `SymplecticGroup.symJ`, `SymplecticGroup.symplectic_det` | `SymplecticGroup.lean:101` declares `symplecticGroup : Submonoid (Matrix (l ⊕ l) (l ⊕ l) R)` with carrier `{A | A * J * Aᵀ = J}`; `:58` `J = fromBlocks 0 (−1) 1 0`; `namespace Matrix` ends at `:109` and `namespace SymplecticGroup` opens at `:111`, so `symJ` (`:132`) and `symplectic_det` (`:148`, `IsUnit (det A)` for `A ∈ symplecticGroup l R`, `[Fintype l] [CommRing R]`) are root-level names, as written. |
| `Module.Basis.exteriorPower` "indexed by the `k`-element subsets (`Set.powersetCard`) of the linearly ordered index type of a basis" | `ExteriorPower/Basis.lean:36` `variable (R n) {I} [LinearOrder I] (b : Basis I R M)`; `:94–95` `Module.Basis.exteriorPower : Basis (powersetCard I n) R (⋀[R]^n M)` with `open Set`; `Set.powersetCard α n : Set (Finset α)` (`Data/Set/PowersetCard.lean`). |
| `RootPairing.IsRootSystem` "root-system class"; `Base`; "integer Cartan matrix of a base of a crystallographic root pairing" | `Defs.lean:120` `class IsRootSystem : Prop`; `Base.lean:68` `structure Base (P : RootPairing ι R M N)`; `CartanMatrix.lean:106–107` `abbrev cartanMatrix : Matrix b.support b.support ℤ` under `[P.IsCrystallographic]` (elaborated type confirms both). |
| `RootPairing.weylGroup` | `WeylGroup.lean:55` `def weylGroup : Subgroup (Aut P)`. The two unchanged uses at `README.md:500` and `:1024` consume it as the Weyl group of the Lie root system, which is this object. |
| `Basis.piTensorProduct` "product basis of a tensor product of finitely many free modules … applied to `d` copies of a basis of `V` indexed by `Fin n` is a basis of `⨂[ℂ]^d V` indexed by `Fin d → Fin n`" | `PiTensorProduct/Basis.lean:33` `Basis.piTensorProduct [Finite ι] (b : Π i, Basis (κ i) R (M i)) : Basis (Π i, κ i) R (⨂[R] i, M i)` in the root namespace; `TensorPower R d M` is `⨂[R] (_ : Fin d), M`, so the specialisation is as stated (type-checked above). |
| `HasCartanType` sentence: "the Cartan matrix `b.cartanMatrix` of `b` (Mathlib `RootPairing.Base.cartanMatrix`)" | `DynkinType.lean:417` uses `b.cartanMatrix`, which resolves to `RootPairing.Base.cartanMatrix`; the rest of the sentence is unchanged from `c8d3edd` and was verified in r9. |

The sampled targets 0.2, 1.1 and 1.2 are the consumers of the changed bullets. Their text (`README.md:338–416`) is unchanged and names no changed declaration; the contract now supplies what they use: the symplectic submonoid and its determinant unit for 0.2, a basis of `⨂[ℂ]^d V` of size `n^d` for the `(trace g)^d` character of 1.1, and a basis of `⋀[ℂ]^k V` of size `binom(n,k)` for "`⋀ⁿ V ≅ det` and `⋀ᵏ V = 0` for `k > n`" in 1.2. The remaining seeded targets (0.1, 0.3, 2.1–2.3, 3.1, 3.5, 5.1, 6.2–6.4, 6.6) lie in unchanged text whose r8 and r9 source verification stands; no new source locator was added in the diff, and no copied passage was found in the changed lines.

### The adversarial table

Rows marked (r9) and (r8) cover statements the diff leaves untouched and are carried from the previous report with its values. New rows were computed for every changed statement.

| Statement | Instances | Values on each side / wrong model | Result |
| --- | --- | --- | --- |
| `Basis.piTensorProduct` index `Fin d → Fin n` (new) | (d,n) = (0,2); (2,0); (2,2); (3,2) | 1 function, `⨂⁰ V = ℂ`, dimension 1 = 2⁰; 0 functions, `⨂² 0 = 0`; 4 = 2²; 8 = 2³ = `(trace 1)^d` of §1.1 at the identity; the wrong model `Fin n → Fin d` would give 2⁰ = 1 ≠ 0 for (2,0) | pass |
| `Module.Basis.exteriorPower` index `Set.powersetCard (Fin n) k` (new) | (n,k) = (3,2); (2,3); (2,2); (0,0) | 3 = binom(3,2); 0 subsets so `⋀³ ℂ² = 0` (§1.2 "`⋀ᵏ V = 0` for `k > n`"); 1 subset, the `det` line; 1 (the empty subset), `⋀⁰ 0 = ℂ`; the wrong model "all subsets" would give 4 ≠ 3 | pass |
| `symplectic_det` `IsUnit (det A)` (new) | l = Fin 1: J; diag(2,1/2) over ℚ; diag(2,1) over ℤ | det J = 0·0 − (−1)·1 = 1, a unit; diag(2,1/2) ∈ Sp₂, det 1; diag(2,1) ∉ Sp₂ (2·1 ≠ 1 on the off-diagonal of `A J Aᵀ`), det 2 is not a unit in ℤ, so the membership hypothesis is needed | pass |
| `cartanMatrix` integer, crystallographic (new) | Sp₄ base (ε₁−ε₂, 2ε₂); the type-A₁ pairing with coefficients ℝ and no crystallographic instance | [[2,−1],[−2,2]], integer entries, in `Matrix b.support b.support ℤ`; without `IsCrystallographic` the abbrev does not elaborate, matching "of a crystallographic root pairing" | pass |
| `IsRootSystem` as a class, `weylGroup` as a subgroup of `Aut` (new) | the A₁ pairing on ℚ (root 1, coroot 2); the same data over ℤ; its Weyl group | `IsRootSystem : Prop` holds over ℚ (roots and coroots span) and fails over ℤ (the coroot 2 spans 2ℤ ≠ ℤ), so the class is a genuine condition; `weylGroup` has order 2 = the reflection and the identity, inside `Aut P` | pass |
| §4.2 `schur_character`, tall and bounded shapes (r9) | (1,1), n = 1; (2,1) at (2,3); (3) at 2 | 0 = 0 (module ⊥); 30 = 6·5; 8 = 2³ | pass |
| `HasCartanType` contract, ranks 2–4 and validity (r9) | Sp₄, SO₅; Sp₆–SO₉; `Valid (C 2)`, `(B 2)`, `(D 3)` | `C 2`/`B 2` swap; `C 3 ≠ B 3`, `C 4 ≠ B 4` under every relabelling; false, true, false | pass |
| §6.2 Spin wording (r9) | Spin₃ weight 1/2 → Spin₂ | ±1/2, dimension 2 = 1 + 1 | pass |
| §0.1 standard, dual (r8) | diag(2,3); n = 0 | traces 5 and 5/6; empty module 0, zeroth power 1 | pass |
| §0.2 invariants (r8) | diag(2,1/2) on J; diag(−1,1) on I | AJAᵀ = J, det 1; AᵀA = I, det −1 | pass |
| §0.3 coefficients (r8) | det⁻¹ at 2; trivial at 0 | 1/2; 1 | pass |
| `rationalRep_isSemisimple` (r8) | W = 0, n = 0 | zero module semisimple; trivial group | pass |
| §1.1, §1.3 (r8) | (2,3), d = 2; one variable 2 | 25 = 19 + 6; 4 = 4 + 0 | pass |
| §1.2 powers (r8) | (2,3): h₂, e₂, e₃ | 19, 6, 0 | pass |
| §2.2 images (r8) | (2), (1,1) on ℂ²; (1,1) on ℂ; empty on 0 | 3, 1; 0; 1 | pass |
| §2.3 (r8) | n = 2, d = 3 | 8 = 4·1 + 2·2 + 0 | pass |
| §3.1 torus, differential (r8) | diag(2,3); (1,−1) at diag(1+2ε,1+3ε) | 5, det⁻¹ 1/6; derivative −1 | pass |
| §3.2 labels (r8) | (1,−1); n = 0, 1 | shape (2), value 19/6; trivial Weyl group | pass |
| §3.3 classification (r8) | rank 1 weights −1, 0, 1 at 2; rank 0 | 1/2, 1, 2 distinct; one simple of dimension 1 | pass |
| `nonempty_schurFunctor_iso_rationalWeylFDRep` (r8) | (2,1), n = 2; (1,1), n = 1 | dimension 2 = 2; excluded by `colLen 0 ≤ n` | pass |
| §3.4 SL (r8) | (2,1), (1,0) at diag(2,1/2); at diag(2,3) | 5/2 = 5/2; 30 ≠ 5 | pass |
| 3A.1 isotropic basis, antidiagonal (r8) | u = e₁ + ie₂, v = (e₁ − ie₂)/2; diag(2,3) | (u,v) = 1, (u,u) = (v,v) = 0; A^R = diag(3,2) | pass |
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

- **No cross-roadmap citation changed.** The diff touches only Mathlib names and one Tau Ceti sentence; `citations.md` lists no cross-roadmap citation found nowhere, and its thirteen Lean-name leads are this roadmap's own `Suggested.lean` declarations (`DiagonalOvergroups.*`) and three Tau Ceti theorems opened at `Character.lean:93,132` and `SchurWeyl.lean:162` in r9.
- **No new ownership.** The diff adds no construction; it names library carriers this roadmap consumes.
- **Overlap tool.** `overlaps.md` lists no other open pull request changing this roadmap and no dropped or revision-only ids. The closest open roadmaps (TensorProductCombinatorics, LieHighestWeight, ClassicalGroupsPartII, RepresentationTheory) are untouched by the changed passages, and the r8 ownership check stands.
- **Scope of the ownership check.** Ownership against open pull requests was checked only through the listed checkouts and the overlap tool.

## Not verifiable

- **Universal statements:** the computed rows certify instances and elaborated signatures, not proofs of the targets.
- **Build field:** the prescribed gate invocation prints no build counter; the worker's gate (`build=0`) and my `lake env lean` run stand in for it.

## Source issues

- none
