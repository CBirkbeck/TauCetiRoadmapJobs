# Review of LatticePackingsAndPerfectForms (pull request #1723 at f1e5683)

**Verdict:** needs changes

This is an incremental re-review. It covers the 131 lines changed since d19023b, and every passage that cites them or that they cite.

## R01 (P2) — The branch is still pinned to Tau Ceti 358314d, and the repair added more names that exist only at main's pin

**Location:** `TauCetiRoadmap/LatticePackingsAndPerfectForms/README.md`:
- 87–107 ("**From Tau Ceti at the pin**, the integral successive minima, Hermite's inequality, Minkowski's bound, Minkowski reduction and the `E₈` root count");
- 124–129, 289–291;
- table rows 348, 351, 353, 354;
- the Needs lines and dependency rows of 1.6 (686, 700, 809), 1.9 (754–760, 790, 812) and 7.2.

**Claim:** R01 of the previous review is not repaired. `lake-manifest.json` is unchanged and still pins Tau Ceti `358314d` and Mathlib `f6090c7`. The repair also moved new citations to main's pin:
- it cites `ZLattice.prod_successiveMin_mul_measureReal_le_two_pow_mul_covolume`;
- it renames `d8PlusLattice` to `checkerboardPlusLattice`;
- it re-points the root-lattice paths to `RankOne/Basic.lean`, `TypeD/Plus.lean` and `TypeE/Basic.lean`.

None of these exists at 358314d.

**Witness:**
- At 358314d, 13 cited declarations are absent: the eleven of the previous R01, plus `ZLattice.prod_successiveMin_mul_measureReal_le_two_pow_mul_covolume` and `checkerboardPlusLattice`.
- At 358314d, 4 cited files are absent: `NumberTheory/GeometryOfNumbers/MinkowskiSecond.lean`, `IntegralLattice/RankOne/Basic.lean`, `RootLattice/TypeD/Plus.lean` and `RootLattice/TypeE/Basic.lean`.
- At 2fd255d, the pin of main's manifest, all of them exist. For example `MinkowskiSecond.lean:626` and `TypeD/Plus.lean:160`.

**Repair:**
1. Merge origin/main into the branch. `git merge-tree --write-tree origin/main HEAD` exits 0 at main `d72684a`. The merge moves `lake-manifest.json` to Tau Ceti `2fd255d` and Mathlib `1b1ccf4b`.
2. Re-run the gate. All nine `TauCeti.*` imports of `Suggested.lean` exist at 2fd255d, and every Mathlib file of the *From Mathlib* table exists at 1b1ccf4b.
3. Apply R02 below.
4. Re-decide the docstring sentence of `Suggested.lean` saying that the Leech covering radius needs "the Leech lattice carrier from Rank24LatticeConstructions Layer 6". At 2fd255d there are `TauCeti.IntegralLattice.leechLattice` (`Rank24/Leech/Basic.lean:236`) and `minimum_leechLattice` (`Rank24/Leech/Minimum.lean:173`).

Tested: a mechanical file and name check finds each README-cited Tau Ceti path and declaration at 2fd255d. Merge-tree reports no conflict.

## R02 (P3) — 7.5 states the old `rankOne` normalization, but row 348 now cites the file where it changed

**Location:**
- README:348 cites `rankOne` in "`…/RankOne/Basic.lean`".
- README:1894–1895 says "Tau Ceti's `rankOne m` instead has Gram entry 2m".
- README:1912, in a Check, says "native rankOne 15 instead has Gram [30] and is not the same input".

**Claim:** In the file the table now cites, `rankOne a` is `⟨a⟩`, with Gram entry `a`. So the two 7.5 sentences are false there. The `2m` normalization belongs to 358314d's `RankOne.lean`, which the row no longer names. Once R01's merge lands, `rankOne 15` is exactly the 7.5 input `⟨15⟩`.

**Witness:**
- At 2fd255d, `RankOne/Basic.lean:36` has `rankOneMatrix a := fun _ _ ↦ a`, and `:45` defines `rankOne a` from it, with the docstring "the integral lattice `⟨a⟩` … with `B(1,1) = a`".
- At 358314d, `RankOne.lean:98` has `2 * m`.

**Repair:**
- Replace README:1894–1895 with "Tau Ceti's `rankOne m` is this lattice `⟨m⟩`: its Gram entry is `m` (`…/RankOne/Basic.lean`)".
- Replace the Check at 1912 with "For Gram [15] (Tau Ceti's `rankOne 15`), residues 1, 4, 11, 14 give index 2. The doubled normalization changes the index: `⟨6⟩` has `O(ℤ/6, q) = {1, 5} = {±1}` and index 1, while Gram [12] has `{1, 5, 7, 11}` and index 2."

Tested:
- `u² ≡ 1 (mod 12)` holds for both units `1, 5` of `ℤ/6`, so `⟨6⟩` has index 1.
- `u² ≡ 1 (mod 24)` holds for `1, 5, 7, 11` of `ℤ/12`, so Gram [12] has index 2.
- So the replacement Check separates `rankOne 6` from the old normalization's Gram [12].

## Previous findings

- R01 — not repaired: `lake-manifest.json` still pins Tau Ceti 358314d. README:87–107 still cites "**From Tau Ceti at the pin** … `IsMinkowskiReduced` … `kissingNumber_typeE₈RootLattice`", and the repair adds more names that exist only at 2fd255d. Raised again as R01.
- R02 — repaired: README:124–129 and 289–291 now name Tau Ceti's `ZLattice.prod_successiveMin_mul_measureReal_le_two_pow_mul_covolume`, and row 354 lists it with consumer 1.9. No "GoN §1.3" remains. It resolves at the pin once R01 is repaired.
- R03 — repaired: the OT supplier bullets and **OT** in the legend are gone. README:142–147 defers "the automorphism orders of particular lattices" to Orthogonal Tamagawa, and "no milestone consumes those".
- R04 — repaired: README:749–752 has "`cₙ = (4/π) Γ(n/2+1)^{2/n}` is the constant of 1.7, so `cₙⁿ = (4/π)ⁿ Γ(n/2+1)²`", with the comparison `λᵢ² ≤ Aᵢᵢ ≤ ((i−1)!)² λᵢ²` for `1 ≤ i ≤ n`.
- R05 — repaired: README:420–421 has "the reverse direction of Tau Ceti's `TauCeti.IntegralLattice.isPosDef_ofGramMatrix_iff`". It is in the 0.2 Needs line, dependency row 542 and table row 341.
- R06 — repaired: 1.8's Needs names `TauCeti.IsPrimitive.exists_basis` (row 355). Row 342 holds `IsNondegenerate`, `IsEven`, `IsUnimodular` and `ofIntegralForm`, and every consumer cell matches a Needs line.
- R07 — repaired: the seven Mathlib cells name the right files, and `AddAut` is dropped from row 330.

## Verified sound

**Gate.**
- The worker's gate at f1e5683 reports every check 0, `build=0`, OK.
- Re-run with the brief's command, the gate prints one failure: `depcheck: NOT IN ORDER: LatticePackingsAndPerfectForms (insert it after its last supplier)`. This is the default-order false positive that the r5 and r6 reports also recorded. Every other check is 0.
- The dependency check against the candidate order prints:

      depcheck: 235 roadmaps, 2257 edges, 0 problem(s)

  There is no UPWARD, CYCLE or `moved:` line. In the candidate order, LatticePackingsAndPerfectForms is at line 148 and OrthogonalTamagawaAndLatticeMass at line 150. No Needs line, table row or supplier bullet names OT any more; only the scope deferral does.
- No file outside the folder changed. The folder holds README.md, Suggested.lean and metadata.toml.

**Elaboration.**
- `lake env lean` on `Suggested.lean` exits 0 with 52 warnings, all `declaration uses 'sorry'`.
- `Suggested.lean` and `metadata.toml` are byte-identical to d19023b (`git diff` is empty). The r6 checks therefore carry over:
  - the padding probe: none of the 52 sorried theorems closes in one tactic;
  - the 112 elaborated `#check @name` types;
  - the single binder lead, `polynomialsOfDegreeLE` (span of functions; its consumers keep all binders).
- Headline theorems are unchanged from r6. Every statable headline is stated, and the docstring names the tensor-product and Leech exceptions; the Leech exception lifts at 2fd255d (R01, step 4).

**Library declarations opened at the pins.**

Tau Ceti, given as 358314d / 2fd255d:
- `isPosDef_ofGramMatrix_iff`: `Signature.lean` 129 / 206, right side `(G.map Int.cast : ℚ).PosDef`.
- `IsPrimitive.exists_basis`: `Algebra/Module/Primitive.lean` 171 / 179.
- `IsNondegenerate` (class): `Basic.lean` 143 / 154.
- `IsEven`: `Even.lean:67` at both pins.
- `IsUnimodular`: `Unimodular.lean` 58 / 61.
- `ofIntegralForm`: `Rationalization.lean:118` at both pins.
- `FiniteQuadraticModule.Isometry`: `FiniteBilinearModule/Quadratic.lean` 252 / 262.
- `FiniteBilinearModule.Isometry`: `Basic.lean:262` at both pins.
- `scale`: `Scaling.lean` 74 / 76, with an identical body at both pins.
- `orthogonalSum`: `Orthogonal/Sum.lean` 84 / 94, identical body.
- `checkerboardLattice`: `TypeD/Basic.lean` 231 / 235.
- `typeE₆RootLattice`, `typeE₇RootLattice`, `typeE₈RootLattice`: `TypeE.lean` 111/396/682 at 358314d, `TypeE/Basic.lean` 105/390/676 at 2fd255d.
- `IsPosDef.finite_isometry`: `PosDef/Finite.lean` at both pins.

Tau Ceti at 2fd255d only:
- `ZLattice.prod_successiveMin_mul_measureReal_le_two_pow_mul_covolume`, `MinkowskiSecond.lean:626`: `(∏ λᵢ)·μ.real K ≤ 2ⁿ·covolume L μ` for a symmetric `ConvexBody` and any additive Haar measure.
- `IsMinkowskiReduced.integralNorm_le_factorial_sq_mul_successiveMinimum`, `Reduction.lean:323`, with factor `(i : ℕ)! ^ 2`.
- `IsMinkowskiReduced.prod_integralNorm_mul_pi_pow_le`, `ReducedGram.lean:68`, with right side `(∏ i!)²·4ⁿ·Γ(n/2+1)²·det`.
- `checkerboardPlusLattice (hn : 8 ∣ n)`, `TypeD/Plus.lean:160`.

Mathlib f6090c7:
- `Matrix.det_mul`, `Determinant/Basic.lean:141`;
- `Int.isUnit_iff`, `Algebra/Group/Int/Units.lean:45`;
- `Matrix.trace`, `Trace.lean:43`;
- `MvPolynomial`, `Algebra/MvPolynomial/Basic.lean:79`;
- `MvPolynomial.totalDegree`, `Degrees.lean:432`;
- `MvPolynomial.eval`, `Eval.lean:256`;
- `MvPolynomial.restrictTotalDegree`, `RingTheory/MvPolynomial/Basic.lean:164`;
- `ModularForm` and `CuspForm`, `ModularForms/Basic.lean:72, 80`;
- `CuspForm.rank_eq_zero_of_weight_lt_twelve`, `DimensionFormula.lean:155`;
- `TensorProduct`, `TensorProduct/Defs.lean:71`;
- `MonoidHom.range`, `Subgroup/Ker.lean:66`;
- `Subgroup.index`, `GroupTheory/Index.lean:55`.

All 31 Mathlib file cells also exist at 1b1ccf4b.

**Cross-roadmap citations resolved (9).**
- SuccessiveMinima (main), 3 citations:
  - lines 86–88 and 781–782 name the Tau Ceti upper half;
  - §0.1.2 `hermitian_gram_hadamard`, at line 188, is the Hadamard inequality 1.9 uses;
  - §1.1, at lines 266–290, indexes `successiveMin` by `Fin d` from 0, as 1.9 says.
- OrthogonalTamagawaAndLatticeMass (#1222 head e35529e), 2 citations:
  - Layer 4 at line 606;
  - §4.1 has |W(E₈)| = 696729600 and the E₈ ⊕ E₈ order 2·696729600²;
  - §4.2 has the Leech order 8315553613086720000.

  These are the three worked-example values README:142–145 assigns to it.
- IntegralLattices (main), 2 citations: 4A at line 1507 and 9B at line 2657. The overlap tool's six "only an open revision defines" leads are false positives.
- Completed IntegralLattices (main), 1 citation: Layer 5 at line 327, consumed by 4.10.
- ModularForms (main), 1 citation: §0.1 is unchanged from r6.

**Seeded sample, where it falls in the changed passages.**
- 0.2: the `.mpr` direction of `isPosDef_ofGramMatrix_iff` is what 0.2 states. Real positive definiteness restricts to `ℚ`-vectors.
- 1.7: the constant `cₙ` that 1.9 now reuses is 1.7's `(4/π)Γ(n/2+1)^{2/n}`. The values are in the table.
- 7.2: the new `scale` need is used by "isometric to `L₁` scaled by `B₂(w, w)`".
- 7.5: the new `IsNondegenerate` and `IsEven` needs match `fvIndex_rankOne`'s `[L.IsNondegenerate]`.
- The other sampled targets (0.1, 1.1, 1.5, 1.8, 3.4, 4.1, 4.4, 4.7, 4.11, 5.5, 7.1) are untouched. Their r6 verification is carried forward.

**Remarks on unchanged text and other roadmaps' text (no change asked).**
- At 2fd255d, SM 0.1.2's content is Tau Ceti's `Matrix.det_gram_le_prod_norm_sq` (`Analysis/InnerProductSpace/Gram/Hadamard.lean:115`). After the merge it could be cited directly.
- OT's own *Downstream consumers* (#1222, line 673) still says that this roadmap consumes OT §§3.1 and 4.1–4.2. That is OT's text to update.
- The 7.5 citation of Festi–Veniani has no theorem or page locator. The text is unchanged and the r6 review passed it.

**Adversarial pass.**

New rows for the changed statements, computed this round:

| Statement | Instances | Values computed on each side | Result |
| --- | --- | --- | --- |
| SM upper half (124–129, 289–291) | `A₂`, `I₂` unit balls in `FormSpace` | `λ₁λ₂V₂ = 2π ≈ 6.2832 ≤ 4√3 ≈ 6.9282`; `π ≈ 3.1416 ≤ 4` | Pass; at the pin only after R01 |
| OT deferral (142–147) | E₈, E₈ ⊕ E₈, Λ₂₄ | 696729600, 2·696729600², 8315553613086720000 match OT §4.1, §4.1 and §4.2 and the worked-example `#Aut` column | Pass |
| 0.2 `isPosDef_ofGramMatrix_iff` | `A₂` over ℚ, `x = (1, −1/2)`; Gram `[0]` | `2 − 1 + 1/2 = 3/2 > 0`, minors 2 and 3; `[0]`: `0 > 0` fails | Pass |
| 1.8 `IsPrimitive.exists_basis` | `(2,3)` and `(2,4)` in `ℤ²` | `(2,3),(1,1)` has det −1; every completion of `(2,4)` has even det | Pass |
| 1.9 `cₙ` and `cₙⁿ` | n = 0, 1, 2, 3, 8 | `c₁ = 1`, `c₂ = 1.27324`, `c₃ = 1.53934`, `c₈ = 2.81814`; `cₙⁿ` and `(4/π)ⁿΓ(n/2+1)²` agree: 1, 1.62114, 3.64756, 3978.354; n = 0: 1 = 1 | Pass |
| 1.9 comparison, 0-based shift | `A₂`; `A₃ = [[2,1,0],[1,2,1],[0,1,2]]` | `A₂₂ = 2 = λ₂²` with factor `(1!)² = 1`; `A₃`: `2 ≤ A₃₃ = 2 ≤ (2!)²·2 = 8`, equal to Tau Ceti's `(i:ℕ)!^2` at `i = 2` | Pass |
| 1.9 product bound | `A₂`, `A₃`, `I₃`, rank 1, rank 0 | 4 ≤ 4.8634 (the 1-based reading gives 19.4537); 8 ≤ 58.361; 1 ≤ 14.590; `A₁₁ = det A`; integral `π A₁₁ ≤ π det A`; 1 ≤ 1 | Pass |
| 1.9 coordinate bound | `A₂`, `A₃` (brute force over `[−3,3]³`) | `A₂`: `min·(A⁻¹)₁₁ = 4/3 = ∏Aⱼⱼ/det ≤ C₂² = 1.6211`. `A₃`: min 2, 12 minimal vectors, max `\|xᵢ\|` = 1; `min·(A⁻¹)ᵢᵢ` = 3/2, 2, 3/2 ≤ 8/4 = 2 ≤ C₃² = 14.59 | Pass |
| 1.9 Hadamard (SM 0.1.2) | `{e₁,e₂}` and `{e₁,e₃}` in `A₃` | det 3 ≤ 4; det 4 ≤ 4 (orthogonal pair, equality) | Pass |
| 4.10 Needs (ADE names) | D₄, D₅, E₆, E₇, E₈ | det 4, 4, 3, 2, 1 and min 2 give `γⁿ` = 4, 8, 64/3, 64, 256 | Pass |
| 5.6, 5.7 `IsEven`, `IsUnimodular` | E₈; ℤ⁸ | E₈ has even diagonal and det 1; ℤ⁸ is unimodular but has norm 1, so it is excluded | Pass |
| 6.1 `orthogonalSum` | `⟨1⟩⁴`; `⟨1⟩ ⊕ ⟨1⟩` | 7 = 4+1+1+1; representing 1 and 1 gives 2 | Pass |
| 7.2 `scale` | `w = 2` in `[1]`; `[2] ⊗ ℤw` | `ℤw` has Gram [4]; the tensor has Gram [8], which is `[2]` scaled by 4 | Pass |
| 7.4 Needs | `[8]`; `[0]` | `O(ℤ/8, b) = {1,3,5,7}` and `O(ℤ/8, q) = {1,7}`; `[0]` is degenerate (`A_L = ℤ`) and excluded | Pass |
| 7.5 against row 348's `rankOne` | `rankOne 15` and `rankOne 6` at both pins | 358314d: Gram [30]; 2fd255d: Gram [15]; `⟨6⟩` has index 1, Gram [12] has index 2 | **R02** |
| Mathlib cells (rows 313–330) | 7 relocated cells | file and line as listed above | Pass |

Rows carried forward from the r6 report for statements the diff leaves untouched (values as computed there):

| Statement | Instances | Values computed on each side (r6) | Result |
| --- | --- | --- | --- |
| 0.1 right action, polarization | I₂, U = [[1,1],[0,1]], V = Uᵀ; A₂, e₁+e₂ | `(UV)ᵀ(UV)` = [[5,3],[3,2]], reversed order [[2,3],[3,5]]; 6 = 2+2+2·1 | Pass |
| 0.3 covolume | [4]; I₂; rank 0 | 2; 1; 1 | Pass |
| 0.4 shells, junk √ | [1], t = −1, 0; [2], t = 2 | `Real.sqrt (−1) = 0`; 1 = 1; 2 = 2 | Pass |
| 0.5 contragredient | I₂, U | [[2,−1],[−1,1]]; the U⁻¹ reading gives [[1,−1],[−1,2]] | Pass |
| 1.1 minima, sublevels | diag(1,4); I₂; [1] | min 1, kiss 2; kiss 4; ∅, {0}, {−1,0,1} | Pass |
| 1.2 native comparison | [2]; diag(1,4); rank 0 | 2 = 2; norms 1, 4; 0 = 0 | Pass |
| 1.4 densities | V₁…V₂₄; I₂, 4I₂ | 2, π, 4π/3, π²/2, π⁴/24, π¹²/12!; π/4 for both | Pass |
| 1.5 Hermite, Bergé–Martinet | diag(1,4); diag(1,1,4); A₂ | 1/2; 4^(−1/3); 2/√3 | Pass |
| 1.6 integral comparisons | [4]; diag(1,4); A₂ | 4 vs 2; (1,4) vs (1,2); 2 = (4/3)^{1/2}·3^{1/2} | Pass at 2fd255d (R01) |
| 1.7 Minkowski | [4]; I₂; n = 1, 2, 3, 8 | 4 ≤ 4 (exponent n gives 8 > 4); π < 4; constants 1, 1.27324, 1.53934, 2.81814 | Pass |
| 1.8 Hermite (statement) | [4]; A₂; I₂ | 1 ≤ 1; 2/√3 = 2/√3; 1 < 1.15470 | Pass |
| 2.1 Mordell | n = 2..8 | 1 ≤ 1; 1.25992 ≤ 1.33333; 2 = 2; 3.48220 ≤ 4; 7.69200 ≤ 8; 19.50422 ≤ 21.33333; 64 = 64 | Pass |
| 2.2 attainment cutoff | ε = γₙ | η = 0 admits diag(1/t,t) for every t | Pass |
| 2.3 values | [a]; A₂; A₃; I₃ | 1; 4/3; 2; 1 < 2 | Pass |
| 3.1 cell, relevant vectors | [4]; I₂; A₂ | volume 2; 4 shortest vectors, not relevant; norm 2 vs norm 6 | Pass |
| 3.2 ρ < μ, deep holes | I₂; [4]; rank 0 | 1/2 < √2/2; ρ = μ = 1; 0 = 0 | Pass |
| 3.3 Jarník | diag(1,4); [4] | 1 ≤ 1.11803 ≤ 3/2 ≤ 2; 1 = 1 = 1 | Pass |
| 3.4 covering values | ℤ³; A₂; A₃, D₄, E₈; Λ₂₄ | √3/2; μ² = 2/3, 1; 1, 1, 1; Θ ≈ 7.90354 | Pass |
| 4.1 perfection | I₂; A₂; rank 0 | span dim 2 < 3; 3 = 3; 0 = 0 | Pass |
| 4.2 eutaxy | I₂; A₂; [[2,1],[1,3]] | c = 1/2; c = 1/6; 2/5 ≠ 0 | Pass |
| 4.3 extreme | [[1,t],[t,1]], 0 < \|t\| < 1/2 | min 1, γ = 1/√(1−t²) > 1 | Pass |
| 4.4 Aut irreducible ⇒ strongly eutactic | A₂, U = [[−1,−1],[0,1]] | QA = 6I; UQ ≠ QU | Pass |
| 4.5 Voronoi | rank 0, 1; A₂; I₂ | T ↔ T∧T; [a] perfect; A₂ T∧T; I₂ F∧T | Pass |
| 4.6 finiteness | n = 0, 1, 2 | 1 class each | Pass |
| 4.9 neighbours | A₂ with N = [[0,−1],[−1,0]]; rank 0 | ρ = 2, neighbour det 3; `0*1/2 − 1 = 0` | Pass |
| 4.10 counts | ranks 2–8 | 1, 1, 2, 3, 7, 33, 10916 | Pass |
| 4.11 Cohn–Elkies, Leech | f scaled by 3; Λ₂₄ | 3/3 = 1; δ = 1, γ = 4 | Pass |
| 5.1 designs | {±1}; {1}; ∅; r = 0 | 0 = 0; 1 ≠ 0; rejected; f(0) | Pass |
| 5.2 moments | j = 0, 1, 2; I₂ | 1, 1/n, 3/(n(n+2)); 2 ≠ 3/2 | Pass |
| 5.3 design forms | A₂; I₂ | 9/4; fourth moments 2 vs 3/2 | Pass |
| 5.4 Gram Laplacian | diag(1,4); E₈ | 3/2, 0; shell sums 120, 0 | Pass |
| 5.5 Hecke–Bochner | n = 1, P = x, τ = i | `(τ/i)^{−d}(−i)^d = τ^{−d}`; `−iξe^{−πξ²}` | Pass |
| 5.6 harmonic theta | E₈ with P = 2, 0, odd | a₁ = 480; 0; odd terms cancel | Pass |
| 5.7 Venkov | n = 24, d = 2..14 | dim S₁₄..S₂₂ ≤ 1 < 2; S₂₄ = 2 | Pass |
| 6.2–6.4 | [1]; diag(1,2,5,5); diag(1,2,5,10); 2I₄ | dets 2, 1; misses 15 only; universal; four squares | Pass |
| 7.1, 7.3 tensor | A₂⊗A₂; A₂⊗D₄; E₈ | det 81; 1296; 1 ≠ 1296 | Pass |
| 7.2 Kitaoka | A₂⊗A₂; n = 0 | min 4, kiss 18; 0 = 0 | Pass |
| 7.5 `fvIndex_rankOne` (Lean, own singleton basis) | m = 3, 4, 5, 8, 12, 15 | halves 1, 1, 1, 1, 2, 2 | Pass |
| Worked rows | bcc; [[2,1],[1,3]]; E₈ | det 128, min 6, Θ ≈ 1.46350; #Aut 4; Δ = π⁴/384 | Pass |

**Ownership.**
- `overlaps.md` reports no other open pull request changing this roadmap and no dropped id.
- The change adds no owned object. It removes the OT supplier and adds a deferral to OT's Layer 4, which OT's head owns.
- The r6 ownership search by object is carried forward: eutaxy, the Festi–Veniani index, the 290 theorem and Cohn–Elkies occur only here.

## Not verifiable

| Source | Cited at | Where I looked |
| --- | --- | --- |
| B. Venkov, *Réseaux et designs sphériques* (2001) | 4.4, 5.2, 5.3, 5.6, 5.7 | r6: the sources service found no legal copy (unchanged text) |
| M. Bhargava, Contemp. Math. 272 (2000) | 6.2, 6.3 | r6: AMS landing page only |
| Conway–Sloane Ch. 21, 23 | 3.1, 3.4 | publisher paywall |
| Kitaoka Thm 7.1.1 | 7.2 | paywall; checked through Coulangeon–Nebe in r6 |
| Schürmann Ch. 2 | 1.9 | AMS monograph behind a paywall. The integral statements were checked against the Tau Ceti declarations instead. |
| Festi–Veniani (2023) | 7.5 | no locator is given; not fetched in this incremental round |
| LMFDB knowls | Summary | CAPTCHA |

## Source issues

- none
