# Review of ThetaInvariantsOfEuclideanLattices (pull request #2038 at 043e385)

**Verdict:** accepted

No findings. The folder is byte-identical to `056f5b1` (0 changed lines). The description now carries both repairs.

## Previous findings

- R01 — repaired: "depcheck reports 0 problems with the roadmap placed after its last supplier, ArakelovGeometryAndAbelianHeights." The candidate order has ArakelovGeometryAndAbelianHeights at line 143 and this roadmap at 144, and depcheck reports `0 problem(s)` there.
- R02 — repaired: the **Suppliers** bullets now name GeometryOfNumbersAndQuadraticArithmetic §4.4.4, §4.4.6, §4.4.7, §4.4.8, §4.4 with §4.4.13, §0.2.2 and §0.3.1, and the Tau Ceti elliptic-integral and `tendsto_jacobiTheta_comap_im_atTop` declarations. Each resolves (see below).

## Verified sound

| statement (cited by the revised description) | instances | computed values | result |
|---|---|---|---|
| 3.3 `tsum_tail_le` (description: §4.4.8 "for 3.3") | `ℤ`, `x = 0.3`, `t = 2`, `n = 1` | radius `0.7978846`; tail `{−1, 2, …}` mass `0.0050595`; right side `2e^(−3/2) · 1.0864348 = 0.4848327` | holds |
| 3.3, rank 2 | `ℤ²`, `x = (½, ½)`, `t = 1.5` | radius `0.8462844`; the 4 points at `√½` excluded; tail mass `0.0031085`; right side `(1.5e^(−0.625))² · 1.0864348² = 0.7608898` | holds |
| 3.2 `exp_h0θ_sub_one_le_div_of_le_norm` (description: `gaussian_variable_tail` "for 3.2") | `1.5ℤ`, `t = 1.5√(2π) = 3.7599424`, so radius = `λ₁` | `q = 0.0052781`, `q/(1 − q) = 0.0053062`; `exp h0θ − 1 = 0.0017029` | holds |
| 3.2 at the edge of its hypothesis | `aℤ`, `a = t/√(2π)`, `t = 1.2, 1.5, 2` | `q/(1 − q) = 26.0435, 4.0734, 0.8059`; `exp h0θ − 1 = 1.0889, 0.6716, 0.2713` | holds at each |

The diff changes no statement, so the rows for every other statement stand as in the previous review, of `056f5b1`.

- Description checked against the head. `git diff --stat origin/main...HEAD` lists 3 files, all in the folder, and the merge base is `origin/main` (`1a19c9f`). The four files outside the folder that changed since `056f5b1` come from that merge of main. "24 declarations (3 definitions and 21 theorems)" agrees with the file. The Scope sentence names the four roadmaps the Scope section defers to. The weight `exp(−2x_v/mult v)` is at README:583.
- 11 cross-roadmap citations in the revised Suppliers bullets resolved:
  - GeometryOfNumbersAndQuadraticArithmetic at `3b084ef`: §0.2.2 `projected_adapted_basis`, §0.3.1 `covolume_projection`, §4.4.4 `latticeGaussianSum`, §4.4.6, §4.4.7 `gaussian_shift_le`, §4.4.8 `gaussian_scale_le`, and `gaussian_variable_tail` in the proof of §4.4.13.
  - SieveMethodsAndPrimePatterns at `66e58fc`: the first-minimum bound `(⌊2/λ₀⌋ + 1)^d` of §0.11a.
  - ArakelovGeometryAndAbelianHeights at `5fc305b`: §1.7.
  - LFunctions on main: `coe_dualIdealLattice` and `latticeTheta_inv`.
- 7 Tau Ceti declarations named in the description opened at the pin:
  - `ZLattice.dual` (`TauCeti/Algebra/Module/ZLattice/Dual.lean:78`)
  - `ZLattice.covolume_dual` (`…/ZLattice/Covolume.lean:273`)
  - `ZLattice.summable_exp_neg_mul_norm_add_sq` (`…/ZLattice/Summable.lean:42`)
  - `TauCeti.Real.legendreK` (`TauCeti/Analysis/SpecialFunctions/EllipticIntegral/Legendre.lean:95`)
  - `legendreK_eq_pi_div_two_mul_agm` (`…/Gauss.lean:60`)
  - `legendreK_one_div_sqrt_two` (`…/Lemniscate.lean:148`)
  - `TauCeti.tendsto_jacobiTheta_comap_im_atTop` (`TauCeti/NumberTheory/ModularForms/JacobiTheta/OneVariable.lean:129`)
- Gate: the worker's gate passes, with every check at 0 and `build=0 OK`. My run with the default order reports only `depcheck: NOT IN ORDER: ThetaInvariantsOfEuclideanLattices (insert it after its last supplier)`. That line is about where a new roadmap goes in the order and is not a defect. The description states it.
- Dependency check (candidate order, `--movable --content --pr 2038`), verbatim: `depcheck: 245 roadmaps, 2235 edges, 0 problem(s)`. Suppliers and their lines: LFunctions 29 (main), GeometryOfNumbersAndQuadraticArithmetic 55, SieveMethodsAndPrimePatterns 57, ArakelovGeometryAndAbelianHeights 143.
- Elaboration: `lake env lean` on `Suggested.lean` prints 21 "declaration uses `sorry`" warnings and nothing else. The elaborated types of 3.2 and 3.3 match the README: `n = finrank ℝ E`, radius `√(n/2π)·t`, and `1 < t` and `1 ≤ t` respectively. The signature tool flags `h0θ` for lacking `[InnerProductSpace ℝ E]`. Its body uses only the norm, and every theorem carries the instance, so this is not a defect.
- Seeded sample: no sampled target lies in a changed passage, and the README flags no locator as unverified. The locator verdicts of the earlier reviews stand.
- Remarks on untouched text (no change asked):
  - SpecialFunctionsTheta (open, not in the merge order) states in 5.2 the relation `K = (π/2)θ₃²(0|it)`, and in its Layer 5 Examples `θ₃(0|i) = π^(1/4)/Γ(3/4)`. These are 1.7 and 1.8 here. This roadmap is earlier in the order, so the citation is SpecialFunctionsTheta's to add.
  - The description's **Sources** list leaves out DLMF §20.7 and §20.9, which carry the locators of 1.7. DLMF is openly available, so the sentence before the list is still true.

Overlap check: read SpecialFunctionsTheta and GeometryOfNumbersAndQuadraticArithmetic (both open), and ThetaSeries, EllipticIntegrals and LFunctions (main).
- Jacobi's relation and `θ₃(0|i)` are shared with SpecialFunctionsTheta 5.2. The owner is ThetaInvariantsOfEuclideanLattices 1.7–1.8, which is earlier in the merge order.
- The Gaussian lattice masses of §4.4.4–§4.4.8 and §4.4.13 are owned by GeometryOfNumbersAndQuadraticArithmetic and cited here. 3.3 adds only the shift `x`.
- ThetaSeries and LFunctions objects are cited, not restated. EllipticIntegrals leaves theta expressions out of its scope.

Source independence: changed passages only. The folder has no changed passage since `056f5b1`, so 0 passages were compared. The arrangement was not compared again, since no layer was added, removed or reordered.

## Not verifiable

- Unchanged from the previous reviews:
  - Groenewegen's displayed formulas: the Numdam scan shows them only as images, and each such target also has a verified Bost locator.
  - Montgomery (1988), Cohn–Kumar–Miller–Radchenko–Viazovska (2022), Banaszczyk (1993), Francini (2001, 2004), Tran (2017), Tran–Tian (2018) and Tran–Tian–Feaver (2023): cited without targets and not opened.

## Source issues

- none

## For the human reviewers

- none
