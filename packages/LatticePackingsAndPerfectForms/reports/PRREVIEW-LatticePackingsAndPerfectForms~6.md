# Review of LatticePackingsAndPerfectForms (pull request #1723 at d19023b)

**Verdict:** needs changes

## R01 (P2) — Eleven Tau Ceti declarations cited "at the pin" are not at this branch's Tau Ceti pin

**Location:** `TauCetiRoadmap/LatticePackingsAndPerfectForms/README.md`:87–106: "**From Tau Ceti at the pin**, the integral successive minima, Hermite's inequality, Minkowski's bound, Minkowski reduction and the `E₈` root count". The same names appear in rows 349 and 351 and in the Needs lines of 1.6 (692–694), 1.9 (767–771), 6.4 (1702–1705) and 7.2 (1802–1805).

**Claim:** This revision rewrote the citations to these declarations as Tau Ceti "at the pin". The pin of this branch's `lake-manifest.json` is Tau Ceti `358314d`, and these declarations do not exist there:
- `IsPosDef.minimum_le_mul_determinant_rpow`;
- `IsMinkowskiReduced` and its five API theorems;
- `kissingNumber_typeE₈RootLattice`;
- the three bad-prime theorems `HeckeRing.GL2.Newform.qExpansion_coeff_prime_sq_of_factorization_eq_one`, `…norm_qExpansion_coeff_prime_of_factorization_conductor_eq` and `…qExpansion_coeff_prime_eq_zero_of_factorization_conductor_lt`.

All eleven exist at main's pin `2fd255d`.

**Witness:** At 358314d:
- `…/IntegralLattice/PosDef/` holds only Covolume, Finite, Hermite, Minimum, RepresentationNumber and SuccessiveMinima, so there is no `Minkowski`, `Reduction` or `ReducedGram`;
- there is no `RootLattice/TypeE/Roots.lean`;
- `Newforms/BadPrime/` holds only `Stability.lean` and `Vanishing.lean`.

At 2fd255d the declarations are at:
- `PosDef/Minkowski.lean:285`;
- `Reduction.lean:80, 112, 123, 147, 323`;
- `ReducedGram.lean:68`;
- `TypeE/Roots.lean:119`;
- `BadPrime/Classification.lean:66, 98, 115`.

**Repair:**
1. Merge origin/main into the branch. `git merge-tree --write-tree origin/main HEAD` exits 0 at main 9ce8311. The merge moves `lake-manifest.json` to Tau Ceti `2fd255d` and Mathlib `1b1ccf4b`. No README edit is needed for these eleven names.
2. Re-run the gate at the new pin. All nine `TauCeti.*` imports of `Suggested.lean` exist at 2fd255d. So do, by name, the library lemmas its proofs use, for example `posDef_map_intCast`, `discriminantQuadraticIsometry_toAddEquiv`, `posDef_toQuadraticMap_iff_matrix` and `posDef_iff_det_ne_zero`.
3. After the merge, re-check one docstring claim of `Suggested.lean`: that the Leech covering radius needs "the Leech lattice carrier from Rank24LatticeConstructions Layer 6". At 2fd255d Tau Ceti has `TauCeti.IntegralLattice.leechLattice` (`Rank24/Leech/Basic.lean:236`) and `minimum_leechLattice` (`Rank24/Leech/Minimum.lean:173`). So 3.4's value `μ(Λ₂₄) = √2` becomes statable. Either state it as `coveringRadius (gramForm hL b) = √2` or name the carrier that is still missing.

Tested: the mechanical sweep of the README's backticked names finds all eleven at 2fd255d and no other Tau Ceti name missing at either pin.

The other way out, keeping 358314d, does not work. No supplier at that pin holds the bad-prime coefficients: the ModularForms earlier-label table maps them to the same `Classification.lean`.

## R02 (P2) — "GoN §1.3" is no longer an id of GeometryOfNumbersAndQuadraticArithmetic

**Location:** README:125 ("the upper theorem is GoN §1.3"); 287; 744 ("`∏ Aᵢᵢ ≤ (∏ i!)² cₙⁿ det A` (GoN §1.3, Minkowski upper inequality)"); 767; 789; 1984.

**Claim:** 1.9 takes Minkowski's upper inequality from GoN §1.3. At GoN's open head that section no longer exists. The upper inequality is now a Tau Ceti declaration, and it is absent at this branch's pin.

**Witness:** GeometryOfNumbersAndQuadraticArithmetic at #851 (3b084ef) has Layer 1 = §1.1 and §1.2 ("Squared-norm minima") only. Its renumbering note says that in the old numbering §1.3.3 maps to Tau Ceti `ZLattice.prod_successiveMin_mul_measureReal_le_two_pow_mul_covolume`. That declaration is at `MinkowskiSecond.lean:626` at 2fd255d and absent at 358314d.

**Repair:** Replace each "GoN §1.3" and "GoN 1.3" with Tau Ceti `ZLattice.prod_successiveMin_mul_measureReal_le_two_pow_mul_covolume` (`TauCeti/NumberTheory/GeometryOfNumbers/MinkowskiSecond.lean`). SuccessiveMinima on main (README:86–88) names the same declaration as the upper half. Add it to the *From Tau Ceti* table with consumer 1.9. It resolves once R01's merge lands.

Tested on `A₂`, where `λ₁ = λ₂ = √2` and the covolume is `√3`: `λ₁λ₂·vol(B₂) = 2π ≈ 6.283 ≤ 4√3 ≈ 6.928`. That is the inequality 1.9's product bound rests on.

## R03 (P2) — Orthogonal Tamagawa is listed as a supplier but comes after this roadmap

**Location:**
- README:131–133: "**From Orthogonal Tamagawa** (open roadmap): the automorphism-order certificates of §4 for `E₈`, the rank-16 pair and the 24 rank-24 lattices, and the mass and `class_number` columns."
- README:292–294, the same roadmap under *From the supplier roadmaps*, which opens with "Every milestone rests on … a cited milestone of one of the following roadmaps".
- README:358, `**OT**` in the legend.

**Claim:** The roadmap is listed as a supplier, but it is not on main and the candidate merge order places it after this roadmap. No Needs line or dependency row names it, so the dependency check sees no edge (0 problems), and the citation is upward.

**Witness:**
- In the candidate merge order, LatticePackingsAndPerfectForms is at line 148 and OrthogonalTamagawaAndLatticeMass at line 150.
- `TauCetiRoadmap/OrthogonalTamagawaAndLatticeMass` is absent on main.
- Its head (#1222, e35529e) README:673 says "LatticePackingsAndPerfectForms consumes §§3.1 and 4.1–4.2".

**Repair:**
1. Delete the bullet at README:131–133, the bullet at README:292–294 and "**OT**," at README:358.
2. Keep the deferral at README:142–143 and extend it: "…and the automorphism orders of `E₈ ⊕ E₈` and `Λ₂₄` recorded in the worked examples".
3. If a milestone is meant to consume OT §§4.1–4.2, name it in that milestone's Needs line instead, so that the dependency check moves this roadmap after OT.

Tested: no Needs line or dependency row names OT, so no milestone loses an input, and the dependency check stays at 0 problems.

## R04 (P3) — 1.9: `cₙ` is undefined, and the factorial index is off by one against the integral case

**Location:** README:744 ("the bound `∏ Aᵢᵢ ≤ (∏ i!)² cₙⁿ det A`"), 742 ("`λᵢ² ≤ Aᵢᵢ ≤ (i!)² λᵢ²`" with "`A₁₁ ≤ A₂₂ ≤ ⋯`"), 751.

**Claim:**
- `cₙ` occurs only at 744 and 751 and is defined nowhere.
- The indices start at 1, but the integral case the text calls "the same proofs" indexes from 0. With 1-based `i` the factor `(i!)²` is true but weaker by `i²`.

**Witness:** Tau Ceti `IsMinkowskiReduced.integralNorm_le_factorial_sq_mul_successiveMinimum` (`Reduction.lean:323`, 2fd255d) has the factor `(i : ℕ)! ^ 2` for `i : Fin n`. `prod_integralNorm_mul_pi_pow_le` (`ReducedGram.lean:68`) has the factor `(∏_{i<n} i!)²·4ⁿ·Γ(n/2+1)²`.

**Repair:**
- Define "`cₙ = (4/π) Γ(n/2+1)^{2/n}`, the constant of 1.7".
- Write the comparison and the product bound with indices `i = 0, …, n−1`, or with `((i−1)!)²` if 1-based indices are kept.

Tested on `A₂` (reduced, determinant 3): `∏ Aᵢᵢ = 4 ≤ (0!·1!)²·(4/π)²·3 ≈ 4.863`. The 1-based reading gives `(1!·2!)²·(4/π)²·3 ≈ 19.45`.

## R05 (P3) — `isPosDef_ofGramMatrix` does not exist

**Location:** README:416: "Tau Ceti's `ofGramMatrix` on the standard basis of `ℚⁿ` is positive definite (`isPosDef_ofGramMatrix`)".

**Claim:** The name exists in neither `Suggested.lean` nor Tau Ceti (at either pin) nor Mathlib.

**Witness:** The native statement is `TauCeti.IntegralLattice.isPosDef_ofGramMatrix_iff` (`IntegralLattice/Signature.lean:129` at 358314d). Tau Ceti uses it exactly this way for `typeARootLattice` (`RootLattice/TypeA/Basic.lean:112`).

**Repair:** Write `` (`TauCeti.IntegralLattice.isPosDef_ofGramMatrix_iff`) ``. Add it to 0.2's Needs (README:439), to dependency row 536, and to Tau Ceti table row 340 with consumer 0.2.

Tested: for `A₂`, `.mpr` of the iff applied to the positive definiteness of `[[2,1],[1,2]]` gives `IsPosDef` of the lattice. That is the use 0.2 states.

## R06 (P3) — Needs lines and the *From Tau Ceti* table disagree

**Location:**
- README:721 and 735: "a minimal vector is primitive (…), extends to a basis", while the Needs line reads "*Needs:* M `abs_sub_round`, Schur complements `Matrix.det_fromBlocks₁₁`; L 0.1, 1.1, 1.5".
- README:1766, the 7.1 Needs, names T `ofIntegralForm`.
- README:1696, the 6.4 Needs, names T `IsEven`.
- Consumer cells: row 340 "0.2, 0.5, 6.2, 7.1, 7.3"; row 344 "7.1, 7.4, 7.5"; row 345 "7.4, 7.5".

**Claim:**
- 1.8's route extends a primitive vector to a basis, but its Needs line omits the declaration that does it.
- `ofIntegralForm` and `IsEven` are consumed but tabulated nowhere.
- Three cells name milestones whose Needs lines use nothing from the row: 0.5 needs no T item, and 7.5's Needs (README:1891) is "M `Subgroup.index`; T `IsPosDef.finite_isometry`; L 7.4".

**Witness:** These declarations exist at 358314d:
- `TauCeti.IsPrimitive.exists_basis` (`TauCeti/Algebra/Module/Primitive.lean:171`);
- `ofIntegralForm` (`IntegralLattice/Rationalization.lean:118`);
- `IsEven` (`IntegralLattice/Even.lean:67`).

**Repair:**
1. Add `TauCeti.IsPrimitive.exists_basis` to the 1.8 Needs line and row 788, and add a table row "`TauCeti.IsPrimitive.exists_basis` | `TauCeti/Algebra/Module/Primitive.lean` | 1.8".
2. Add `ofIntegralForm` and `IsEven` (`…/Rationalization.lean`, `…/Even.lean`) to row 340.
3. Set row 340's consumers to "0.2, 6.2, 6.4, 7.1, 7.3", row 344's to "7.1, 7.4" and row 345's to "7.4".

Tested: after the edit, every listed consumer names an item of its row in its Needs line.

## R07 (P3) — Mathlib table: seven declarations are not in the files their rows name

**Location:** README:313, 314, 323, 325, 329.

**Claim and witness:** These are the actual locations at the Mathlib pin f6090c7:
- `Matrix.det_mul` is in `LinearAlgebra/Matrix/Determinant/Basic.lean:141`;
- `Int.isUnit_iff` is in `Algebra/Group/Int/Units.lean:45`;
- `Matrix.trace` is in `LinearAlgebra/Matrix/Trace.lean:43`;
- `MvPolynomial.totalDegree` is in `Algebra/MvPolynomial/Degrees.lean:432`;
- `ModularForm` and `CuspForm` are in `NumberTheory/ModularForms/Basic.lean:72, 80`;
- `MonoidHom.range` is in `Algebra/Group/Subgroup/Ker.lean:66`;
- `AddAut` is the `to_additive` image of `MulAut` (`Algebra/Group/End.lean:631`).

**Repair:**
- Add these files to the File cells of their rows.
- Drop `AddAut`, which no Needs line uses.

Tested: each named file contains the declaration at the line given.

## Previous findings

- **R01 of r5 (ModularForms summary): repaired.** README:295–297 now reads "[Modular forms]: §0.1, the cusp–Eisenstein decomposition `M_k(N,χ) = S_k(N,χ) ⊕ E_k(N,χ)` in weights one and two, consumed in 6.4 at weight two". This matches ModularForms on main (deebc70), §0.1, whose checks give dimensions 2 = 1 + 1 at level 11 and weight 2. The 6.4 Needs line (1696–1706) agrees.
- **R02 of r5 (consumer cells): repaired as requested.**
  - Row 350 is "1.6; 1.8 (the model of its route)".
  - Row 351 is "1.6, 1.9, 7.2, worked examples".
  - `IsPosDef.three_pow_mul_minimum_pow_le` is gone from README:87–106 and from the table.

  The new table rows carry the drift reported in R06, and row 351's names fall under R01.
- **Remarks of r5:**
  - Rows 341 and 342 now list real consumers (0.4, 1.2, 6.1; 4.4, 7.3, 7.4, 7.5).
  - The IntegralLattices contract (README:268–273) now uses the main labels 0F, 2C, 1C–1D, 1G, 4A, 6C–6D and 9B, all resolved on main.
  - The 1.8 omission of `IsPrimitive.exists_basis` is not repaired; it is now R06.

## Verified sound

**Gate.**
- The worker's gate at d19023b reports all checks 0 and OK, with `build=0`.
- Re-run with the brief's command, the gate printed one failure, the same default-order false positive the r5 report recorded: `depcheck=1` with `depcheck: NOT IN ORDER: LatticePackingsAndPerfectForms (insert it after its last supplier)`. Every other check was 0.
- The dependency check with the candidate order printed the following, with no UPWARD, CYCLE or `moved:` line:

      depcheck: 237 roadmaps, 2309 edges, 0 problem(s)

  R03 is an upward citation this check cannot see, because no Needs line carries it.
- No files are changed outside the folder. The only files in the folder are README.md, Suggested.lean and metadata.toml.

**Elaboration.**
- `lake env lean` on `Suggested.lean` exits 0 with 52 warnings, all `declaration uses 'sorry'`, and no other warning or error.
- A scratch copy with `#check @name` for all 112 declarations exits 0 and prints 112 types.
- The single binder lead (`polynomialsOfDegreeLE`, whose type drops `[FiniteDimensional ℝ E] [MeasurableSpace E] [BorelSpace E]`) is harmless: it is a span of functions, and its consumers `IsSphericalDesign` and `isSphericalDesign_iff_moments` keep all section binders.
- `Real.Gamma (↑n / 2 + 1)` elaborates with real division, not `ℕ` division.
- `Suggested.lean` is byte-identical to the r5 head. Nothing in it was changed by this review.

**Padding probe.** Each of the 52 sorried theorems was replaced by `first | rfl | simp | infer_instance | norm_num | trivial | decide` in a scratch copy. All 52 fail with unsolved goals, so none closes in one tactic.
- No declaration restates a definition or a Check.
- `stdLattice_eq_span` is a proved bridge lemma that the two instances after it use.
- `minimalVectorsFinset` depends on the theorem `finite_minimalVectors`, not on sorry'd data.

**Headline theorems and statability at the branch pin.** The README's headlines are:
- the real Minkowski and Hermite bounds (1.7, 1.8);
- Mordell (2.1) and attainment (2.2);
- `γ₂`, `γ₃` (2.3), `γ₄…γ₈` (4.10) and `γ₂₄` (4.11);
- the Voronoi fundamental domain and deep holes (3.1, 3.2);
- Voronoi's theorem (4.5) and the finiteness of perfect and eutactic forms (4.6, 4.7);
- neighbour preservation, completeness and the counts 2, 3, 7, 33, 10916 (4.9, 4.10);
- the Cohn–Elkies bound and the Leech auxiliary function (4.11);
- the moment criterion, strong eutaxy as a 2-design, and strongly perfect ⇒ perfect (5.2, 5.3);
- the complex Hecke–Bochner identity, harmonic theta modularity and Venkov (5.5–5.7);
- the 15 and 290 theorems (6.3, 6.4);
- Kitaoka (7.2) and the rank-one Festi–Veniani index (7.5).

All of them are stated in `Suggested.lean`. The docstring names two exceptions: the bundled tensor product of lattices (7.1–7.3) and the Leech covering radius (3.4). At 358314d neither has a carrier: there is no bundled tensor product of `IntegralLattice` and no Leech lattice. At 2fd255d the Leech exception ends (R01, repair step 3).

**Adversarial pass.** Values were computed this round: by hand from the definitions, or by brute force in a scratch script for `A₂ ⊗ A₂`, bcc, `[[2,1],[1,3]]`, `E₈⁻¹`, the fvIndex sets, Mordell and the densities.

| Statement | Instances | Values computed on each side | Result |
| --- | --- | --- | --- |
| 0.1 right action, composition order | I₂, U = [[1,1],[0,1]], V = Uᵀ | U then V: (UV)ᵀ(UV) = [[5,3],[3,2]]; reverse [[2,3],[3,5]]; det 1 | Pass |
| 0.1 polarization | A₂, e₁+e₂ | A[e₁+e₂] = 6 = 2+2+2·1; diagonal-only pairing gives 0 ≠ 1 | Pass |
| 0.2 dictionary (R05) | [2]; shear on I₂; [0]; empty | 2; [[1,1],[1,2]], det 1; [0] not PD; empty PD | Pass; name in R05 |
| 0.3 covolume | [4]; I₂; rank 0 | √4 = 2 = length of [−1/2,1/2]·2; 1; 1 = √det [] | Pass |
| 0.4 shells, junk √ (seeded) | [1], t = −1, 0; [2], t = 2 | `Real.sqrt (−1) = 0`, sphere {0} vs empty shell; 1 = 1; ±1: 2 = 2 | Pass; TS 2D/2G resolve |
| 0.5 contragredient | I₂, U | (UᵀU)⁻¹ = [[2,−1],[−1,1]] = U⁻¹U⁻ᵀ; U⁻¹ as right action: [[1,−1],[−1,2]] | Pass |
| 1.1 minima, sublevels | diag(1,4); I₂; [1], C = −1, 0, 1 | min 1, kiss 2, span dim 1; kiss 4; ∅, {0}, {−1,0,1} | Pass |
| 1.2 native comparison | [2]; diag(1,4); rank 0 | 2 = 2, kiss 2 = 2; lengths 1, 2 squared 1, 4; 0 = 0 | Pass |
| 1.4 densities (seeded) | V₁, V₂, V₃, V₄, V₈, V₂₄; [4]; I₂, 4I₂ | 2, π, 4π/3, π²/2, π⁴/24, π¹²/12! ≈ 0.0019296; Δ = 1; π/4, radius 1/2 → 1, Δ unchanged | Pass |
| 1.5 Hermite, Bergé–Martinet | diag(1,4); diag(1,1,4); A₂ | γ = 1/2, δ = 1/8; γ = 4^(−1/3), γ* = 4^(−2/3), γ′ = 1/2; γ′ = 2/√3 | Pass |
| 1.6 integral comparisons (R01) | [4]; diag(1,4); A₂ | native min 4 vs length 2; native (1,4) vs lengths (1,2); 2 = (4/3)^{1/2}·3^{1/2} | Pass at 2fd255d |
| 1.7 Minkowski (seeded) | [4]; I₂; n = 1, 2, 3, 8 | 2·2 = 4 ≤ 4, exponent n gives 8 > 4; π < 4; constants 1, 1.27324, 1.53934, 2.81814 | Pass |
| 1.8 Hermite | [4]; A₂; I₂ | 1 ≤ 1; 2/√3 = 2/√3; 1 < 1.15470 | Pass; R06 Needs |
| 1.9 reduction (R02, R04) | diag(1/t,t), η = 1/4; A₂ | t ≤ 4 passes, t = 5 fails; ∏ = 4 ≤ 4.863 (0-based), 19.45 (1-based) | R04 |
| 2.1 Mordell `γₙ^{n−2} ≤ γ_{n−1}^{n−1}` | n = 2..8 with sharp values | 1 ≤ 1; 1.25992 ≤ 1.33333; 2 = 2; 3.48220 ≤ 4; 7.69200 ≤ 8; 19.50422 ≤ 21.33333; 64 = 64 | Pass (`hermiteConstant_pow_le`) |
| 2.2 attainment cutoff | ε = γₙ | η = 0 admits diag(1/t,t) for every t | Pass |
| 2.3 values | [a]; A₂; A₃; I₃ | 1; 4/3; 8/4 = 2; 1 < 2 | Pass |
| 3.1 cell, relevant vectors | [4]; I₂; A₂ | volume 2; parity coset of (1,1) has 4 shortest, not relevant; e₁−e₂: ±, norm 2 vs ±(e₁+e₂) norm 6 | Pass |
| 3.2 ρ < μ, strictness (seeded) | I₂; [4]; rank 0 | 1/2 < √2/2, 4 extreme points vs a circle; ρ = μ = 1; 0 = 0 excluded | Pass |
| 3.2 Lean `IsDeepHole.exists_sub_mem_extremePoints` | rank 0; strict convexity of ‖·‖² | 0 ∈ extremePoints {0}; midpoint of a ≠ b has ‖·‖² < max | Pass |
| 3.3 Jarník | diag(1,4); [4] | 1 ≤ √5/2 ≈ 1.11803 ≤ 3/2 ≤ 2; 1 = 1 = 1 | Pass |
| 3.4 covering values (seeded) | ℤ³; A₂; A₃, D₄, E₈; Λ₂₄ | √3/2, Θ = π√3/2; μ² = a(n+1−a)/(n+1): 2/3 and 1; 1, 1, 1; Θ(Λ₂₄) = 2¹²π¹²/12! ≈ 7.90354 | Pass |
| 4.1 perfection, rationality (seeded) | I₂; A₂; rank 0; `IsPerfect` with `n*(n+1)/2` | span dims 2 < 3, 3 = 3; 0 = 0; KZ 6 ≥ 6 | Pass; DSV §1 p.2 |
| 4.2 eutaxy | I₂; A₂; [[2,1],[1,3]] | c = 1/2 = 2/(4·1); Q = 6A⁻¹, c = 1/6; S = {±e₁}, A⁻¹₂₂ = 2/5 ≠ 0 | Pass |
| 4.3 extreme | [[1,t],[t,1]], 0 < \|t\| < 1/2 | min = 1 (e₁±e₂ give 2 ∓ 2t > 1), γ = 1/√(1−t²) > 1 | Pass |
| 4.4 Aut irreducible ⇒ strongly eutactic (seeded) | A₂, U = [[−1,−1],[0,1]]; A = [[1,√2/10],[√2/10,√3]] | UᵀAU = A; QA = 6I; UQ = [[−2,−2],[−2,4]] ≠ QU = [[−4,−6],[2,6]]; sublevel ≤ √3 is {0,±e₁,±e₂}, det √3 − 1/50 | Pass |
| 4.5 Voronoi `isExtreme_iff` | rank 0, 1; A₂; I₂ | `PosDefForm 0` singleton: T ↔ T∧T; [a]: γ ≡ 1, perfect, c = 1/(2a); A₂ T∧T; I₂ F∧T | Pass |
| 4.6 finiteness (seeded) | n = 0, 1, 2 | 1 class each; I₂ excluded | Pass |
| 4.9 neighbours, `IsFacetNormal` | A₂, N = [[0,−1],[−1,0]]; P = [1], N = [1]; rank 0 | PD for −1 < t < 3; min = 2 for 0 ≤ t ≤ 2; ρ = 2, neighbour [[2,−1],[−1,2]] det 3; ρ = 0; `0*1/2 − 1 = 0` (ℕ) | Pass |
| 4.10 counts and values (seeded) | ranks 2–8; D₄, D₅, E₆, E₇, E₈ | 1, 1, 2, 3, 7, 33, 10916 (dsv2007 lines 87–95); det 4, 4, 3, 2, 1, so γⁿ = 4, 8, 64/3, 64, 256 | Pass |
| 4.11 Cohn–Elkies, Leech | f scaled by 3; Λ₂₄ | 3/3 = 1; δ = (2/2)²⁴/1 = 1, γ = 4 | Pass |
| 5.1 designs (seeded) | {±1}; {1}; ∅; r = 0; dim E = 0 | averages 0 = 0; 1 ≠ 0; rejected; f(0)·m/m = f(0); toSphere = 0, so 1 ≠ 0/0 | Pass |
| 5.2 moments (seeded) | j = 0, 1, 2; I₂ axes | c₀ = 1, c₁ = 1/n, c₂ = 3/(n(n+2)); 2 = 4/2; 2 ≠ 3/2 | Pass |
| 5.3 design forms (seeded) | A₂; I₂; rank 0 | 6·3/8 = 9/4; fourth moments 2 vs 3/2; empty shell is not a design | Pass |
| 5.4 Gram Laplacian | diag(1,4); pinned E₈ | 2 − 1/2 = 3/2, 2 − 2 = 0; (E₈⁻¹)₀₀ = 4, (E₈⁻¹)₇₇ = 2, shell sums 60·4 − 60·2 = 120 and 240 − 240 = 0 | Pass |
| 5.5 Hecke–Bochner (seeded) | n = 1, P = x, τ = i; s = 4, n = 2, d = 0 | (τ/i)^{−d}(−i)^d = τ^{−d}; −iξe^{−πξ²}; 4⁻¹ | Pass; GoN §4.3 at #851 |
| 5.6 harmonic theta | E₈, P = 2, 0, odd | constant 2, a₁ = 480; 0; odd cancels | Pass |
| 5.7 Venkov | n = 24, d = 2..14 | dim S₁₄..S₂₂ = 0, 1, 1, 1, 1 < 2; S₂₄ = 2; S₂₆ = 1 | Pass |
| 6.1 universality | ℤ³; ℤ⁴; A₂; 2I₄ | 7 missed (mod 8); 7 = 4+1+1+1; norms 2, 6, 8, 14; min 2 | Pass |
| 6.2 escalation (seeded) | [1]; 2ℤ⁴; rank 0 | \|a\|² ≤ 2 gives a ∈ {0,±1}: dets 2 and 1; index 2, rank 4; truant 1 → [1] | Pass |
| 6.3 15 theorem | diag(1,2,5,5); diag(1,2,5,10) | misses 15 only; 10 = 10, 14 = 4+10, 15 = 5+10 | Pass |
| 6.4 290 theorem | 2I₄; [2]; A₂ | four squares; half-norm 2 missed; norm 4 missed | Pass; Needs in R01 |
| 7.1 tensor | A₂⊗A₂; A₂⊗D₄ | Kronecker Gram det 81 = 3²·3²; 3⁴·4² = 1296 | Pass |
| 7.2 Kitaoka | A₂⊗A₂; n = 0 | min 4, kiss 18 (brute force), #Aut 144; 0 = 0·min B | Pass; CN Cor. 2.3 |
| 7.3 decomposability | E₈ vs A₂⊗D₄; A₃ | det 1 ≠ 1296; rank 3 is prime | Pass |
| 7.4 discriminant isometries (seeded) | [8]; [12]; 2I₃ | b: {1,3,5,7}, q: {1,7}; q: {1,5,7,11}; q(eᵢ/2) = 1/4, (f·g)(e₁/2) = e₂/2 | Pass |
| 7.5 `fvIndex_rankOne` | m = 3, 4, 5, 8, 12, 15 | {1,2}, {1,3}, {1,4}, {1,7}, {1,5,7,11}, {1,4,11,14}, halves 1, 1, 1, 1, 2, 2 | Pass |
| Worked rows | ⟨2⟩, ℤ², A₂, ℤ³, A₃, bcc, D₄, E₈, E₈², Λ₂₄, [[2,1],[1,3]] | bcc det 128, min 6, kiss 8, #Aut 48, Θ = 5√5π/24 ≈ 1.46350; [[2,1],[1,3]] #Aut 4, Δ = π/(2√5); E₈ Δ = π⁴/384 | Pass |

**Seeded source sample (15).**
- **4.1 and 4.10 (DSV, arXiv:math/0609388v3).**
  - The perfection definition is at p.2 (dsv2007 lines 60–62), as the unique solution `B = A` of `ᵗvBv = λ(A)` on `Min(A)`.
  - Eutaxy, extremality and Voronoi's theorem are at lines 65–71.
  - Table 1 is on p.3 (lines 87–97): counts 1, 1, 2, 3, 7, 33, 10916 in dimensions 2–8, with maximisers A₂, A₃, D₄, D₅, E₆, E₇, E₈.
  - Theorem 1.1 is at line 107.
  - Mordell's inequality is at line 126, in the form 2.1 uses.
- **5.5.** GoN §4.3 at #851 (gon line 1534) states `fourier_harmonic_gaussian` with `(−i)^ℓ t^(−ℓ−n/2)`, real `t > 0`. ThetaSeries' `gaussian (τ : ℍ)` and `fourier_gaussian` (TS Suggested 185, 191) give `d = 0`, so the extension claimed in 5.5 is exactly the gap between the two.
- **0.4.** TS 2D and 2G (README:515–530, 545–561) and TS Suggested `RealSpace` (498), `realModel` (521), `ratModel` (432) and `ncard_vectorsOfNorm_ratModel` (473).
- **1.4.** GoN 4.4.1 (gon 1718).
- **1.7.** Mathlib `exists_ne_zero_mem_lattice_of_measure_mul_two_pow_lt_measure` (`MeasureTheory/Group/GeometryOfNumbers.lean`): Haar measure, fundamental domain, symmetric convex set, strict volume inequality.
- **5.1.** `toSphere`, `toSphere_apply_univ` and `measurePreserving_homeomorphUnitSphereProd` (`HaarToSphere.lean`); `LinearIsometryEquiv.measurePreserving` (`Measure/Haar/InnerProductSpace.lean:151`).
- **7.4.** At 358314d: `DiscriminantGroup` (`Group.lean:109`), `discriminantGroupEquiv` (165), `discriminantPairing` (`Bilinear.lean:96`), `discriminantBilinearIsometry` (192), `discriminantQuadraticMap` (`Quadratic.lean:122`) and `discriminantQuadraticIsometry` (232). IL 1C–1D (main 442, 455) and 1G (main 444, 571, 2704).
- **3.2 and 4.6.** They carry no source locator. Their arguments were checked as in the table.
- **4.4, 5.2, 5.3 (Venkov), 6.2 (Bhargava) and 3.4 (Conway–Sloane).** These are under *Not verifiable*. Their mathematics was recomputed as in the table.
- No README locator is flagged as unverified.

**Other sources checked.** Coulangeon–Nebe, arXiv:1201.1832v1:
- the tensor pairing is on p.2 (coulangeonnebe2012 lines 79–83);
- Corollary 2.3 and its proof, citing Kitaoka 7.1.1 for split minimal vectors when either rank is at most 43 for Euclidean lattices, are on p.3 (lines 103–107);
- Remark 2.4(1) (Steinberg, rank ≥ 292) is at lines 108–113.

These match 7.1, 7.2 and `min_tensor_kitaoka`, where integrality is not needed.

**Cross-roadmap citations resolved.**

| Supplier | Location |
| --- | --- |
| IntegralLattices (main 3f7196b; 9ce8311 changes only ModularForms status) | 0F at 416/437; 1C–1D at 442/455; 1G at 444/571; 2C native at 455; 4A at 1507; 6C at 2054; 6D at 2076; 6G at 2182; 9B at 2657 |
| ThetaSeries (main) | 1E summability; 2A `dual_dual`; 2D; 2G; 5B level one; 7C–7D Hecke–Schoeneberg in `modFormCharSpace k χ_L`; 8B; 8D |
| ModularForms (main) | §0.1 at 353–394 |
| SuccessiveMinima (main) | 1.1 `MeasureTheory.successiveMin` at 307; 1.5 `exists_successiveMin_witnesses` at 488; 2.1.4 `minkowski_second_lower` |
| GlobalQuadraticForms (main) | 4.4 at 443; 6.1 at 694 |
| Rank24LatticeConstructions (main) | Layer 6 at 312 (minimum 4, no roots) |
| Completed IntegralLattices | Layer 5 at 327 |
| WeightsInEtaleCohomology (#1001 head) | §6.1 at 695 |
| GoN (#851 head) | 4.4.1, 4.4.2, 4.5.1, 4.5.2, 4.5.8, 5.1.2, 5.1.4, §4.3 |
| Scope deferrals | EffectiveDiophantineMethods §1.8 (#1046); SiegelModularForms Layer 5 (#1714); QuaternionArithmetic Layer 2 (#1722); HalfIntegralWeightModularForms (#1721); RootSystems on main |

Notes on these leads:
- The three overlap leads (IL §4A, §9B, §1C "only an open revision defines") are false positives: main defines all three.
- The citations tool's 12 leads are LMFDB knowl ids or names declared in `Suggested.lean`.
- Remark: GoN 4.5.8 is now a pointer to ProbabilisticAndMetricNumberTheory §4.9b `mahler_relativelyCompact_iff`. Citing that owner directly would be cleaner.

**Ownership.** Searched by object across main and all open heads:
- eutaxy, the Festi–Veniani index, the 290 theorem and Cohn–Elkies occur only here;
- SiegelModularForms (#1714, line 138) defers degree-one harmonic theta and designs, and NumberFieldEnumeration defers the Hermite constant;
- PointProcesses' Voronoi cells are of point processes;
- GoN's `latticeCoveringRadius` is identified in 3.3, not restated.

No `Suggested.lean` name collides with a declaration of another readable roadmap.

## Not verifiable

| Source | Cited at | Where I looked |
| --- | --- | --- |
| B. Venkov, *Réseaux et designs sphériques* (2001) | 4.4, 5.2, 5.3, 5.6, 5.7 | Sources service: "no legal source found"; not in the cache |
| M. Bhargava, Contemp. Math. 272 (2000) | 6.2, 6.3 | AMS landing page only; not in the cache |
| Conway–Sloane Ch. 21, 23 | 3.1, 3.4 | Publisher paywall |
| Kitaoka Thm 7.1.1 | 7.2 | Paywall; checked through Coulangeon–Nebe's citation instead |
| Ash 1977; Cohn–Elkies 2003; CKMRV 2017 (journal pagination) | 4.5, 4.7, 4.11 | Publisher pages not fetched; no finding depends on them |
| LMFDB knowls | Summary and conventions | CAPTCHA |

## Source issues

- none
