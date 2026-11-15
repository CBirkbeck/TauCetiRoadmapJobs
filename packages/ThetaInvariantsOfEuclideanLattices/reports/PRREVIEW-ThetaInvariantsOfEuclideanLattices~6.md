# Review of ThetaInvariantsOfEuclideanLattices (pull request #2038 at 056f5b1)

**Verdict:** needs changes

Incremental re-review: the folder is byte-identical to `97aa248` (0 changed lines), so this round reads the pull request's title and description against the head. Both findings are in the description; neither asks for a change to `README.md` or `Suggested.lean`.

## R01 (P3) — The description places the roadmap after the wrong supplier

**Location:** pull request description, **Checks**: "depcheck reports 0 problems with the roadmap placed after GeometryOfNumbersAndQuadraticArithmetic."

**Claim:** At this head the last supplier is ArakelovGeometryAndAbelianHeights; placed right after GeometryOfNumbersAndQuadraticArithmetic, two suppliers are upward.

**Witness:** depcheck with the roadmap moved to line 56 of the merge order: `UPWARD: … -> ArakelovGeometryAndAbelianHeights (#144) at README lines [588, 618, 635, 658, 693]`, `UPWARD: … -> SieveMethodsAndPrimePatterns (#58) at README lines [516, 574]`, `2 problem(s)`.

**Repair:** Replace the sentence by: "depcheck reports 0 problems with the roadmap placed after its last supplier, ArakelovGeometryAndAbelianHeights." (Tested: at line 144, directly after it, depcheck prints `0 problem(s)`.)

## R02 (P3) — The description's supplier lists omit sections and declarations the head consumes

**Location:** pull request description, **Suppliers**: "GeometryOfNumbersAndQuadraticArithmetic: §4.4.6 (the Gaussian Poisson identity), §4.4.7 (the coset inequality `gaussian_shift_le`) and §0.3.1 (the covolume of a projected lattice)." and the Tau Ceti bullet.

**Claim:** The head consumes four more ids of that roadmap and two more groups of Tau Ceti declarations; 1.7, 1.8, Layer 2, 3.2 and 3.3 depend on them.

**Witness:** `README.md` **Exact supplier contracts** lists §4.4.4, §4.4.8 `gaussian_scale_le`, §4.4 with §4.4.13 `gaussian_variable_tail`, §0.2.2 `projected_adapted_basis`; the *Needs:* of 3.2 and 3.3 (README:534–535, 554–555) and of 1.7 name them and `legendreK_eq_pi_div_two_mul_agm`, `tendsto_jacobiTheta_comap_im_atTop`.

**Repair:** Replace the two bullets by:
"- Tau Ceti, at the pin: `ZLattice.dual`, `ZLattice.covolume_dual`, lattice Poisson summation, the Schwartz Gaussian and `ZLattice.summable_exp_neg_mul_norm_add_sq`; for 1.7 and 1.8, `TauCeti.Real.legendreK`, `legendreK_eq_pi_div_two_mul_agm`, `legendreK_one_div_sqrt_two` and `TauCeti.tendsto_jacobiTheta_comap_im_atTop`.
- GeometryOfNumbersAndQuadraticArithmetic: §4.4.4 (`latticeGaussianSum`), §4.4.6 (the Gaussian Poisson identity), §4.4.7 (`gaussian_shift_le`), §4.4.8 (`gaussian_scale_le`, for 3.3), §4.4 with §4.4.13 (`gaussian_variable_tail`, for 3.2), §0.2.2 (`projected_adapted_basis`) and §0.3.1 (the covolume of a projected lattice)."

## Previous findings

- none to account for: the report at `97aa248` was an acceptance without findings. Its remark on the description ("all 25 declarations", 1.7 unmentioned) no longer applies: the description says "all 24 declarations (3 definitions and 21 theorems)" and names Jacobi's relation in Layer 1.

## Verified sound

| statement (cited by the description) | instances | computed values | result |
|---|---|---|---|
| 4.3, the Check "over `ℚ(i)`" that the description's **Expert review** paragraph cites | `ℚ(i)`, `I = ℤ[i]`, `x = 0`, `I^* = ½ℤ[i]`; weight counting the complex place once | `h⁰(D) = 2 log θ(2) = 0.0074559`; `h⁰(κ − D) = 2 log θ(½) = 0.7006030`; difference `−0.6931472 = −½ log 4`; wrong weight: `−1.2205053` | holds; the Check exists (README:642–644) and pins the normalisation as the description says |
| 1.8, `h⁰_θ(ℤ) = log(π^(1/4)/Γ(3/4))` (description, Layer 1) | sum over `\|n\| ≤ 200` | `θ(1) = 1.0864348112133`; `π^(1/4)/Γ(3/4) = 1.0864348112133`; `log = 0.0829015` | holds |
| 1.7, Jacobi's relation (description, Layer 1) | `t = 1` | `k = 0.7071068`; `K(k) = π/(2 agm(1, k′)) = 1.8540747`; `½π a² = 1.8540747` | holds |
| 1.2 (description, Layer 1) | `2ℤ` | `0.0000070 − 0.6931542 = −0.6931472 = −log 2` | holds |

The rows for every other statement stand as in the previous review, of `97aa248`: the diff changes no statement.

- Description against the head, sentence by sentence: the four layer summaries agree with README Summary and sections 1.2–4.5; "24 declarations (3 definitions and 21 theorems)" agrees with `Suggested.lean` (`h0θ`, `h1θ`, `h0Div`; 21 `theorem`); "Nothing outside the folder changes" agrees with `git diff --stat origin/main...HEAD` (empty outside the folder); all six suppliers of the README are named; the title names the roadmap this pull request adds.
- Gate (worker, candidate merge order): every check 0, `build=0 OK`. My run with the default order stops only at `depcheck: NOT IN ORDER: ThetaInvariantsOfEuclideanLattices (insert it after its last supplier)`, the placement of a new roadmap, which the description states.
- Dependency check (candidate order, `--movable --content --pr 2038`), verbatim: `depcheck: 245 roadmaps, 2233 edges, 0 problem(s)`. The roadmap is at line 144; suppliers LFunctions (29, on main), GeometryOfNumbersAndQuadraticArithmetic (55), SieveMethodsAndPrimePatterns (57), ArakelovGeometryAndAbelianHeights (143).
- Elaboration: `lake env lean` on `Suggested.lean` prints 21 "declaration uses `sorry`" warnings and nothing else.
- Seeded sample and locators: no sampled target lies in a changed passage (there is none); the locator verdicts of the earlier reviews stand. Cross-roadmap citations: `roadmaps resolve` lists none missing; overlaps list no dropped id and no other pull request changing this folder.
- Remark (untouched text, no change asked): SpecialFunctionsTheta, an open roadmap not yet in the merge order, states in its 5.2 the relation `K(k) = (π/2)θ₃²(0|it)` by the same AGM route as 1.7 here, and in its Layer 5 Examples `θ₃(0|i) = π^(1/4)/Γ(3/4)`, the value of 1.8. Neither roadmap cites the other. This roadmap is the earlier one, so the citation falls to SpecialFunctionsTheta.
- Remark (no change asked): the description's **Sources** list omits DLMF §20.7 and §20.9, which carry the four locators of 1.7; DLMF is openly available, so the sentence before the list stays true.

Overlap check: read SpecialFunctionsTheta (open), ThetaSeries, EllipticIntegrals and LFunctions (main); shared object: Jacobi's relation `K = ½πθ₃²` on the imaginary axis and `θ₃(0|i)`, with SpecialFunctionsTheta 5.2 — owner ThetaInvariantsOfEuclideanLattices 1.7–1.8 (earlier in the merge order); ThetaSeries and LFunctions objects are cited, not restated; EllipticIntegrals leaves the theta expressions of `K` out of its scope.

Source independence: changed passages only — the folder has no changed passage since `97aa248`, so 0 passages were compared; the arrangement was not compared again (no layer added, removed or reordered).

## Not verifiable

- Unchanged from the previous reviews: Groenewegen's displayed formulas (image-only displays on Numdam; each target also has a verified Bost locator); Montgomery (1988), Cohn–Kumar–Miller–Radchenko–Viazovska (2022), Banaszczyk (1993), Francini (2001, 2004), Tran (2017), Tran–Tian (2018), Tran–Tian–Feaver (2023), cited without targets and not opened.

## Source issues

- none

## For the human reviewers

- none
