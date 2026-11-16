# Review of SpectralSteepestDescent (pull request #2423 at 054ef3c)

**Verdict:** needs changes

Full review. The ten findings of the previous review (of `0690f81`) are repaired; the six below are new, all P3.

## R01 (P3) — §2.1: the stated route does not reach the subset inequality

**Location:** `TauCetiRoadmap/SpectralSteepestDescent/README.md` lines 203–207 and 216: "the sum of the `k` largest values of `|σᵢ(A) − σᵢ(B)|` is at most `kyFanSum (A − B) k` … (Proved here from MAJ-A28.)"; "*Needs:* OI-A50, MAJ-A26, MAJ-A28, MAJ-B21."

**Claim:** MAJ-A28 bounds initial sums `Re Σ_{i<k} ⟪uᵢ, A vᵢ⟫` only. A sum over an arbitrary set of `k` indices is Lidskii's inequality for the Hermitian dilations, which no target, supplier or pinned declaration states.

**Witness:** FanHoffman1955 lines 59–65 import exactly this subset inequality, as (3), from Wielandt. Majorization `README.md` line 179 (MAJ-A28) has initial sums only; no "Lidskii" on main, in an open roadmap or at the pins.

**Repair:** Add to §2.1 the target "For symmetric `S`, `T` on a finite-dimensional space and every set `J` of `k` indices, `Σ_{j∈J} (λⱼ(S) − λⱼ(T))` is at most the sum of the `k` largest eigenvalues of `S − T` (proved here: shift `S − T` by its `k`-th eigenvalue, replace it by its positive part using PD-A52, and compare traces)", and replace the locator by "(Proved here by applying it to the Hermitian dilations `LinearMap.hermitianDilation` of `A` and `B`.)". *Needs:* "PD-A52, `LinearMap.hermitianDilation`, MAJ-A26, MAJ-B21". Tested: `S = diag(2, 0)`, `T = diag(0, 1)`, `J = {1}, {2}, {1, 2}`: `1 ≤ 2`, `0 ≤ 2`, `1 ≤ 1`.

## R02 (P3) — §1.3: two halves of the isometry bullet are pinned declarations

**Location:** `README.md` lines 147–148 and 156: "`U_A` is an isometric embedding exactly when `A` is injective, and a linear isometric equivalence exactly when `A` is bijective." … "(Proved here from PD-B11 to PD-B16 and PD-C28.)"

**Claim:** The implications from `A` to `U_A` are already in Tau Ceti at the pin; they are cited nowhere and listed as proved here.

**Witness:** `TauCeti/Analysis/InnerProductSpace/Polar/Isometry.lean` line 96, `LinearMap.polarIsometry` (injective `A`); `TauCeti/Analysis/InnerProductSpace/Polar/Finite.lean` line 382, `LinearMap.exists_linearIsometryEquiv_eq_polarFactor` (injective `A`, equal `finrank`).

**Repair:** "For injective `A`, `U_A` is the isometric embedding `LinearMap.polarIsometry`, and for bijective `A` a linear isometric equivalence (`LinearMap.exists_linearIsometryEquiv_eq_polarFactor`). Conversely, if `U_A` is an isometric embedding then `A` is injective, and if it is an isometric equivalence then `A` is bijective (proved here, from PD-B12 and PD-B13)." Add both names to the Tau Ceti item of the supplier contracts. Tested: `A = 0` on `ℝ`: `U_A = 0`, not an embedding, `A` not injective.

## R03 (P3) — §2.2: the upper bound has no stated input

**Location:** `README.md` lines 227–228 and 240: "The proof uses `W† ∘ A = |A|` … together with 2.1 applied to `A` and `Q`." "*Needs:* 1.3, 2.1, MAJ-B21."

**Claim:** 2.1 gives `N(A − W) ≤ N(A − Q)` only. `N(A − Q) ≤ N(A + W)` needs `Kₖ(A − Q) ≤ Kₖ(A) + Kₖ(Q)`, the Ky Fan triangle inequality, which the *Needs:* line omits.

**Witness:** Majorization `README.md` line 185 (MAJ-A31); `LinearMap.kyFanSum_add_le`, `TauCeti/Analysis/InnerProductSpace/KyFan.lean` line 387. `A = diag(2, 0)`, `Q = −1`: `Kₖ(A − Q) = 3, 4 = Kₖ(A) + k`.

**Repair:** After "applied to `A` and `Q`" add "for the lower bound, and `Kₖ(A − Q) ≤ Kₖ(A) + Kₖ(Q) = Kₖ(A + W)` (MAJ-A31) for the upper bound"; "*Needs:* 1.3, 2.1, MAJ-A31, MAJ-B21."

## R04 (P3) — supplier contracts: the modulus is PD-A29

**Location:** `README.md` lines 66–68: "PD-B11 to PD-B16 (the modulus `LinearMap.operatorAbs`, the canonical polar factor `LinearMap.polarFactor` with `A = U |A|`, its kernel, range and partial-isometry API)".

**Claim:** PD-B11 to PD-B16 state the polar factor only; the finite-dimensional modulus is cited under ids that do not define it.

**Witness:** PolarDecomposition `README.md` line 194: "PD-A29 — Finite rectangular modulus"; lines 330–340 (PD-B11 to PD-B16) define and characterise `U` alone.

**Repair:** "PD-A29 (the modulus `LinearMap.operatorAbs`), PD-B11 to PD-B16 (the canonical polar factor `LinearMap.polarFactor` with `A = U |A|`, its kernel, range and partial-isometry API)".

## R05 (P3) — Summary: "the nearest isometry in every unitarily invariant norm"

**Location:** `README.md` lines 7–8: "It is also the single-step Shampoo preconditioned gradient and the nearest isometry in every unitarily invariant norm."

**Claim:** `U_A` is an isometry only for injective `A`; §2.2 proves the property for an isometric extension `W`, which is a nearest isometric embedding and need not be the only one.

**Witness:** `A = diag(2, 0)`: `U_A = diag(1, 0)`, `‖U_A e₂‖ = 0`. The isometries `W = 1` and `W' = diag(1, −1)` both extend it, with `‖A − W‖_op = ‖A − W'‖_op = 1`.

**Repair:** "It is also the single-step Shampoo preconditioned gradient, and every isometric extension of it is a nearest isometric embedding in every unitarily invariant seminorm."

## R06 (P3) — 22 declarations of `Suggested.lean` are not named in the README

**Location:** `README.md` §§1.2–5.2; for example line 112: "`|⟪D, A⟫| ≤ ‖D‖_op · N₁(A)` for all `D, A : E →ₗ[𝕜] F`."

**Claim:** Every Lean name is to appear in the README at its statement. Only `traceInner`, `frobenius_sub_polarFactor_le`, `oddStep`, `oddScalar`, `cubicCoeffs` and `muonDirection` do.

**Witness:** Whole-word count 0 in `README.md` for `abs_traceInner_le`, `shampoo_eq_polarFactor`, `mapsTo_muon_band`, `spectral_descent` and 18 more.

**Repair:** Append the name in parentheses to its statement: §1.2 `abs_traceInner_le`, `traceInner_polarFactor`, `isGreatest_traceInner`, `traceInner_eq_nuclear_iff`; §1.3 `polarFactor_smul`; §1.4 `shampooWeight`, `shampoo_eq_polarFactor`; §2.1 `sum_abs_singularValues_sub_le_kyFanSum`; §2.2 `map_sub_le_map_sub_of_eqOn_polarFactor`; §3.2 `oddStep_iterate_eq`; §3.4 `tendsto_oddStep_iterate`; Conventions `quinticCoeffs`, `muonCoeffs`; §4.1 `tendsto_cubic_iterate`; §4.2 `tendsto_quintic_iterate`; §4.3 `not_tendsto_muon_iterate`, `mapsTo_muon_band`, `muon_iterate_five_mem_band`; §5.1 `le_add_fderiv_add_of_lipschitz`; §5.2 `norm_fderiv_eq_nuclear`, `spectral_descent`, `muonDirection_five`.

## Previous findings

- R01 — repaired: `Suggested.lean` lines 96–100 conclude with "… → `V.toLinearMap = A.polarFactor`".
- R02 — repaired: `README.md` line 247 "If `A` is surjective, then `‖A − U_A‖_F ≤ ‖A − V‖_F` for every `V` with `V ∘ V† = 1`"; Check at line 258; PD-B19 in *Needs:*.
- R03 — repaired: `traceInner_self` is not in `Suggested.lean`.
- R04 — repaired: "(Fan–Hoffman, Theorem 1, p. 112, for square matrices and unitary `W`, `Q`; …)"; "section *Proving that NS iteration orthogonalizes the update*"; "section *Tuning the coefficients*"; "Gupta–Koren–Singer, Algorithm 1, p. 3"; Mirsky is no longer cited.
- R05 — repaired: line 291 "MAJ-B30 to MAJ-B37 (`frobenius`) for `muonDirection`"; lines 479–480 itemised; line 149 "If `finrank E ≤ finrank F`, some `W : E →ₗᵢ[𝕜] F` agrees with `U_A`".
- R06 — repaired: "ManifoldOptimization O2.2 uses … (2.3), and its O2.4 the Euclidean descent lemma (5.1)".
- R07 — repaired: line 494 "define the matrix polar factor `U_A` by transport along".
- R08 — repaired: line 10 "gives an explicit invariant band".
- R09 — repaired: `## Conventions` at line 38 before the supplier contracts at line 64; every layer ends with `### Examples` and `### Dependencies`; "## Layer 6: matrices".
- R10 — repaired: the description reads "an isometric extension of the polar factor is the nearest isometric embedding, and its negative the farthest" and names `OperatorIdeals` (OI-A50).

## Verified sound

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| 1.1 trace pairing | `D = e₁e₂ᵀ`, `A = 2e₁e₂ᵀ`; `A`, `i • A` over `ℂ` | `⟪D, A⟫ = 2`, `⟪Dᵀ, A⟫ = 0`; `re(i‖A‖_F²) = 0` | holds |
| 1.2 duality, `abs_traceInner_le`, `traceInner_polarFactor`, `isGreatest_traceInner` | `diag(3, 4)`; `A = 0` | `⟪1, A⟫ = 7 = N₁`; `0 = 0`, greatest value `0` | holds |
| 1.2 maximizers, `traceInner_eq_nuclear_iff` | `[[0,2],[0,0]]`, `D = U_A + t e₂e₁ᵀ`; `A = (1 0)`; `A = 0` | `⟪D, A⟫ = 2` for all `t`, `‖D‖ ≤ 1` iff `|t| ≤ 1`; `d₂ = 0`; `D ∘ 0 = 0` | holds, both directions |
| 1.3 `polarFactor_smul`, extension `W` | `z = i`, `A = 1`; `z = −1`; dimensions `dim E − r ≤ dim F − r` | `U = i • 1`, `|i • 1| = 1`; `U_(−A) = −U_A` | holds; R02 for the isometry bullet |
| 1.4 `shampoo_eq_polarFactor` | `[[0,2],[0,0]]`; `A = 0` | `(1/√2) · 2 · (1/√2) e₁e₂ᵀ = e₁e₂ᵀ`; `0 = 0` | holds |
| 2.1 `sum_abs_singularValues_sub_le_kyFanSum` | `diag(3,1)` vs `diag(1,3)`; `2 • 1` vs `1`; `s` beyond `finrank` | `0, 0 ≤ 2, 4`; `1, 2 ≤ 1, 2`; extra terms `0` | holds; route R01 |
| 2.2 `map_sub_le_map_sub_of_eqOn_polarFactor` | `diag(2,0)`, `W = 1`, `Q = −1`; `(2,0)ᵀ`, `θ = 1`; `A = 0` | `1 ≤ 3 ≤ 3`; `1 ≤ 1.685 ≤ 3`; all three `N(W)` | holds; *Needs:* R03 |
| 2.3 `frobenius_sub_polarFactor_le` | `(2,0)ᵀ` and `(2 0)`, `θ = 0, π`; `diag(2, 1/2)` | `5 − 4cos θ = 1, 9`; `5/4` | holds, equality only at `θ = 0` |
| 3.1 `oddStep`, `oddScalar`, `muonDirection` | `X = 2`, cubic; exponent `j + 1`; `A = 0` | `−1`; `−4`; `0⁻¹ • 0 = 0` | holds |
| 3.2 `oddStep_iterate_eq` | `diag(2, 1/2)`, `k = 1`; `X = 2`, `k = 2`; `n = 0`, `k = 0` | `diag(−1, 11/16)`; `g(−1) = −1`; `X = U_X |X|` | holds |
| 3.3 error and alignment | `diag(2, 1/2)`, cubic, `k = 1` | `‖Y − 1‖_op = max(2, 5/16) = 2`; `⟪Y, X⟫ = −2 + 11/32` | holds |
| 3.4 `tendsto_oddStep_iterate` | `diag(1/2, 0)`; `X = 0`; `diag(3, 4)` | limit `diag(1, 0)`; `0`; `X₀ = diag(3/5, 4/5)` | holds |
| 4.1 `tendsto_cubic_iterate` | `t = 0.6`; `s³ − 3s − 4 = 0`; `√3` | `1 − g = 0.208` both sides; `g(s) = −2`, `g(−2) = 1`; `g(√3) = 0` | holds |
| 4.2 `tendsto_quintic_iterate` | `t = 0.3, 0.7, 1.3`; expansion of `(1−t)³(3t²+9t+8)` | `0.47034, 0.05322, −0.08360`; `8 − 15t + 10t³ − 3t⁵` | holds |
| 4.3 `not_tendsto_muon_iterate`, `mapsTo_muon_band`, `muon_iterate_five_mem_band` | exact rationals; grids of 400001 points | `m(1) = 701/1000`; `m(J) = [0.681831, 1.179099]`; `m⁵([1/270, 5/4]) = [0.681831, 1.202369]`; `m([3/10, 17/25]) = [0.909362, 1.202369]`; `min m(t)/t = 3.0312` | holds |
| 4.3 entry time | `s = 1/270`, `1/1000` | orbit `…, 0.50359, 1.19059` at step 5; `K = 7`, in `J` from step 6 | holds |
| 5.1 `le_add_fderiv_add_of_lipschitz` | `f = x²/2`, `L = 1`, `x = 0.7`, `h = −1.3`; `L < 0` | `0.18 = 0.18`; forces `h = 0` | holds |
| 5.2 `norm_fderiv_eq_nuclear`, `spectral_descent`, `muonDirection_five` | `η = N₁/L`, `κ = ρ = 1`; `A = 1` on `ℝ²`; `G = 0`; `f` not differentiable at `W` | `−N₁²/(2L)`; `m⁵(1/√2) = 1.108111`, `max(8/25, 1/4) = 8/25`; all `0`; `G = 0` forced | holds |
| 6.1 matrix interface | `A = (i)` | `ᴴ`: `1`; `ᵀ`: `−1` | holds |
| Summary, line 7 (R05) | `diag(2, 0)` | `U_A e₂ = 0`; `W = 1`, `W' = diag(1, −1)` both at distance `1` | R05 |

- Source locators: 10 of 10 checked against the text (BernsteinNewhouse2024 lines 202–203, 208–214, 219–235, 574–578, 591–600, 678–715, 724–743; FanHoffman1955 lines 66–70; GuptaKorenSinger2018 lines 99–101; JordanMuon2024 lines 106–117, 127–139); all support the statements as scoped.
- Library declarations opened at the pin: `LinearMap.singularValues : ℕ →₀ ℝ` (`Mathlib/Analysis/InnerProductSpace/SingularValues.lean` 95); `polarFactor`, `polarFactor_adjoint`, `exists_linearIsometryEquiv_eqOn_polarFactor` (`Polar/Finite.lean` 55, 218, 369); `kyFanSum`, `norm_sum_inner_le_kyFanSum`, `kyFanSum_add_le` (`KyFan.lean` 99, 250, 387); `map_le_of_kyFanSum_le` (`FanDominance.lean` 151); `abs_singularValues_sub_singularValues_le` (`OperatorIdeal/ApproximationNumber/EckartYoung.lean` 106); `Units.polarUnitary` (`ContinuousFunctionalCalculus/Polar.lean` 131); `instContinuousFunctionalCalculusRCLikeIsSelfAdjoint` (`InnerProductSpace/ContinuousFunctionalCalculus.lean` 190).
- Duplication by object: no trace-duality, Shampoo, Fan–Hoffman, Newton–Schulz or descent-lemma statement in the pinned Mathlib or Tau Ceti, on main or in an open roadmap; the pinned `sum_sq_singularValues_sub_le_sq_frobenius_apply_sub_min` (`HoffmanWielandt/Singular.lean` 106) is the Frobenius case of 2.1, weaker than the target.
- Cross-roadmap citations resolved on main: PD-B11 to PD-B16, PD-B19, PD-B20, PD-C28; MAJ-A26, MAJ-A28, MAJ-B01, MAJ-B21, MAJ-B30 to MAJ-B37; OI-A50; and ManifoldOptimization O2.2, O2.4 at its open head (`README.md` lines 464–466, 497–501).
- Dependency check: `depcheck: 244 roadmaps, 2270 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Gate at `054ef3c`: every check 0, build OK. Elaboration of `Suggested.lean`: 20 `sorry` warnings, nothing else. The 28 elaborated types were compared with the README statements: no binder lost, no change.
- One-tactic probe on a scratch copy (`simp` with the roadmap's definitions unfolded, then `rfl`): none of the 20 theorems closes; no padding found. The headlines of the Summary are all stated; the pull request changes no file outside the folder, and its title and description agree with the head.
- Overlap check: read Majorization, PolarDecomposition, PrincipalAngles (main) and ManifoldOptimization (open); nothing shared.

Source independence: 12 passages compared with 4 sources, none shared; largest share BernsteinNewhouse2024, 6 of 10 locators; contents compared with BernsteinNewhouse2024 (optimizer by optimizer, then two appendices): independent.

## Not verifiable

- none

## Source issues

- **Misprint** in JordanMuon2024 at section *Proving that NS iteration orthogonalizes the update* (line 119): the source says the iterated odd quintic should tend to 1 for every starting value in the closed interval from 0 to 1; it should be the half-open interval excluding 0, where every odd polynomial vanishes; affects nothing.

## For the human reviewers

- **Scope.** §4.3 (band `[17/25, 5/4]`, entry time `K(s)`, threshold `1/270`) is stated in no source; `README.md` lines 411–413 say so. JordanMuon2024 is a web post, BernsteinNewhouse2024 an arXiv preprint.
- **Scope.** Layers 1–2 are general matrix analysis continuing `OperatorTheory/Majorization` and `OperatorTheory/PolarDecomposition`; they sit in a top-level roadmap whose `metadata.toml` topic is `math.OC`.
- **Licence.** `README.md` lines 522–531 (`## Provenance`) name `github.com/brettkoonce/lean4-mlir` (stated BSD-3, by the pull request's author) as a prior formalization; `Suggested.lean` was not compared with its files.
