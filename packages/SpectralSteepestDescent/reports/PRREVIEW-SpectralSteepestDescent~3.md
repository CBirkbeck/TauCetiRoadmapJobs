# Review of SpectralSteepestDescent (pull request #2423 at 8103f75)

**Verdict:** needs changes

## R01 (P3) — §2.3: the Lean statement is a special case of the Fan–Hoffman declaration

**Location:** `TauCetiRoadmap/SpectralSteepestDescent/Suggested.lean` lines 95–99, `frobenius_sub_polarFactor_le`; `README.md` lines 231–232: "`‖A − U_A‖_F ≤ ‖A − V‖_F`, with equality only for `V = U_A`".

**Claim:** For injective `A`, `U_A` is itself an isometry agreeing with `U_A` on `(ker A)ᗮ`, so the stated inequality is `map_sub_le_map_sub_of_eqOn_polarFactor` at `N = frobenius`, `W = U_A`. The equality case, the only content §2.3 adds to §2.2, is not stated.

**Witness:** `A = (2, 0)ᵀ`, `V = (cos θ, sin θ)ᵀ`: `‖A − V‖_F² = 5 − 4 cos θ`, equal to `‖A − U_A‖_F² = 1` only at `θ = 0`; the Lean conclusion does not distinguish `θ = 0`.

**Repair:** State the conclusion as `frobenius 𝕜 E F (A - A.polarFactor) ≤ frobenius 𝕜 E F (A - V.toLinearMap) ∧ (frobenius 𝕜 E F (A - V.toLinearMap) = frobenius 𝕜 E F (A - A.polarFactor) → V.toLinearMap = A.polarFactor)`. On the witness the implication holds exactly at `θ = 0`.

## R02 (P3) — §2.3 is narrower than the proposition it cites

**Location:** `README.md` lines 230–233: "Let `A` be injective … (Bernstein–Newhouse, Proposition 4, p. 5.)"

**Claim:** The cited proposition covers both kinds of semi-orthogonal matrix (`AᵀA = 1` and `AAᵀ = 1`) and every full-rank `G`; §2.3 states the injective case only. PD-B19 is listed in the supplier contracts and used by no target.

**Witness:** BernsteinNewhouse2024 lines 208–214. `A = (2 0) : ℝ² → ℝ`, co-isometries `V = (cos θ, sin θ)`: `‖A − V‖_F² = 5 − 4 cos θ ≥ 1 = ‖A − U_A‖_F²`, equality only at `θ = 0`; §2.3 does not cover it.

**Repair:** Add: "If `A` is surjective, then `‖A − U_A‖_F ≤ ‖A − V‖_F` for every `V` with `V ∘ V† = 1`, with equality only for `V = U_A`; this is the injective case applied to `A†`, by PD-B19." Add the witness as a Check and PD-B19 to the *Needs:* line.

## R03 (P3) — `traceInner_self` is padding

**Location:** `Suggested.lean` lines 34–36.

**Claim:** It is an API fact of the definition (a Conventions bullet, not a headline) and closes by rewriting with three pinned lemmas.

**Witness:** `rw [traceInner, A.trace_adjoint_comp_self_eq_sum_norm_apply_sq (stdOrthonormalBasis 𝕜 E), RCLike.ofReal_re, UnitarilyInvariantSeminorm.sq_frobenius_apply (stdOrthonormalBasis 𝕜 E)]` closes it (`UnitarilyInvariantSeminorm/Frobenius.lean` lines 72, 133 at the pin).

**Repair:** Delete it from `Suggested.lean`; §1.1 keeps the statement.

## R04 (P3) — locators: source hypotheses, section names, a missing theorem number, an uncited reference

**Location:** `README.md` lines 215–216 "(Fan–Hoffman, Theorem 1, p. 112.)"; lines 252 and 375 "Jordan et al., the section on the Newton–Schulz iteration"; lines 193–194 "Mirsky 1960 states the inequality for unitarily invariant norms"; line 486.

**Claim:** (a) The source theorem is for square complex matrices, a unitary `W` and norms; §2.2 is for rectangular isometries and seminorms and does not say what is proved here. (b) The post has no section of that name. (c) Mirsky has no theorem or page. (d) Gupta–Koren–Singer is cited at no claim.

**Witness:** FanHoffman1955 lines 21–22, 66–70. JordanMuon2024 line 106 (heading "Proving that NS iteration orthogonalizes the update", form at line 111), line 127 ("Tuning the coefficients", coefficients at line 139), line 32. GuptaKorenSinger2018 line 101.

**Repair:** (a) "(Fan–Hoffman, Theorem 1, p. 112, for square matrices and unitary `W`, `Q`; the rectangular and seminorm form is proved here by the same argument.)" (b) §3.1: "(Jordan et al., section *Proving that NS iteration orthogonalizes the update*)"; §4.3: "(… section *Tuning the coefficients*, which gives only …)". (c) Give Mirsky's theorem number and page. (d) In §1.4 add "(Gupta–Koren–Singer, Algorithm 1, p. 3, for the update with accumulated preconditioners)".

## R05 (P3) — *Needs:* lines that are wrong or cover several targets

**Location:** `README.md` line 263 ("*Needs:* none"), line 435 ("*Needs:* 1.2, 3.3, 3.4, 4.3, 5.1"), lines 207–208 ("one exists whenever `finrank E ≤ finrank F`") with line 226.

**Claim:** §3.1's `muonDirection` uses `frobenius`. §5.2's one line covers four targets; the cubic and quintic directions need 4.1 and 4.2, which it omits. The existence of `W` for `finrank E ≤ finrank F` is neither a target nor PD-B20.

**Witness:** `Suggested.lean` line 165 (`frobenius` in `muonDirection`). `Polar/Finite.lean` lines 369–371 at the pin: `exists_linearIsometryEquiv_eqOn_polarFactor` assumes `finrank 𝕜 E = finrank 𝕜 F`.

**Repair:** §3.1: "*Needs:* Mathlib `LinearMap.adjoint`; MAJ-B30 to MAJ-B37 (`frobenius`) for `muonDirection`." §5.2: "*Needs:* dual norm: 1.2. Bound: 1.2, 5.1. Polar instance: 1.3. Muon instance: 3.2, 3.3, 3.4, 4.3. Cubic and quintic directions: 3.3, 3.4, 4.1, 4.2." Add to §1.3 the bullet "If `finrank E ≤ finrank F`, some `W : E →ₗᵢ[𝕜] F` agrees with `U_A` on `(ker A)ᗮ` (extend by an isometry `ker A → (range A)ᗮ`)", and cite it from §2.2.

## R06 (P3) — a consumer cited by pull-request URL, with process wording

**Location:** `README.md` lines 465–467: "[ManifoldOptimization](https://github.com/TauCetiProject/TauCetiRoadmap/pull/1506), as proposed, uses the Frobenius nearest-point property …"

**Claim:** Cross-roadmap citations name the roadmap and its section, never a pull request; "as proposed" is process narrative.

**Witness:** ManifoldOptimization at its open head: O2.2 (Stiefel polar retraction, nearest point in `St(n, p)`) and O2.4 (the case `R_x(v) = x + v` of the pullback bound).

**Repair:** "ManifoldOptimization O2.2 uses the Frobenius nearest-point property of the polar factor (2.3), and its O2.4 the Euclidean descent lemma (5.1); this roadmap owns both."

## R07 (P3) — `Matrix.polarFactor` is backticked and not declared

**Location:** `README.md` lines 441–442, 451–452: "define `Matrix.polarFactor A` by transport along `Matrix.toEuclideanLin`".

**Claim:** A backticked name of the roadmap's own claims a declaration of `Suggested.lean`; the file has none, and its docstring says the matrix forms are not stated.

**Witness:** `Suggested.lean` declares 29 names, none `Matrix.polarFactor`; no `Matrix.polarFactor` in the pinned Mathlib or Tau Ceti.

**Repair:** Write "define the matrix polar factor `U_A` of `A : Matrix m n 𝕜` by transport along `Matrix.toEuclideanLin`" and use `U_A` in the three places.

## R08 (P3) — Summary: "the exact invariant band"

**Location:** `README.md` lines 10–11: "gives the exact invariant band of the quintic used by the Muon optimizer".

**Claim:** `J = [17/25, 5/4]` is an invariant interval with rational endpoints, neither the least nor the greatest one.

**Witness:** `m(J) = [0.681831, 1.179099] ⊊ J` (§4.3's own values), so `m(J)` is a smaller invariant interval.

**Repair:** "gives an explicit invariant band of the quintic used by the Muon optimizer and the number of steps needed to enter it".

## R09 (P3) — README shape

**Location:** `README.md` lines 59–67 (order of sections), 437 ("## Layer 6: matrices and worked examples"), 456 ("## Dependencies and order").

**Claim:** No layer ends with `### Examples` and `### Dependencies` (asked for in the previous review, R10; its other parts are repaired); `## Conventions` comes after the supplier contracts; Layer 6 has no worked example beyond its Checks.

**Witness:** Headings of the head: 32, none `### Examples` or `### Dependencies`.

**Repair:** Move `## Conventions` before `## Exact supplier contracts`; split the sentences of "Dependencies and order" into a `### Dependencies` at the end of each layer and add `### Examples` there (the Checks' recurring instances `diag(3, 4)`, `[[0, 2], [0, 0]]`, `(2, 0)ᵀ` serve); rename Layer 6 "matrices".

## R10 (P3) — the description was written for an earlier head

**Location:** pull-request description: "Fan–Hoffman: the polar factor is the nearest unitary in every unitarily invariant norm (via Mirsky), plus the nearest Frobenius isometric embedding in the rectangular case." and "It builds on TauCeti's existing `PolarDecomposition`, `Majorization` and `UnitarilyInvariantSeminorm` material".

**Claim:** At the head §2.2 is for isometric embeddings `E → F` in every unitarily invariant seminorm, with the upper bound `N(A − Q) ≤ N(A + W)`; and the roadmap also consumes OperatorIdeals OI-A50.

**Witness:** `README.md` lines 207–211 and 50–51.

**Repair:** "Fan–Hoffman: an isometric extension of the polar factor is the nearest isometric embedding, and its negative the farthest, in every unitarily invariant seminorm (via Mirsky), with uniqueness in Frobenius norm." and "… `PolarDecomposition`, `Majorization` and `OperatorIdeals` (OI-A50) …".

## Verified sound

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| 1.1 trace pairing | `1`; `D = e₁e₂ᵀ`, `A = 2e₁e₂ᵀ`; `A, iA` over `ℂ` | `finrank E`; `2`, and `0` for `Dᵀ`; `re(i‖A‖_F²) = 0`; `⟪A†,B†⟫ = re conj tr(A†B)` | holds |
| 1.2 duality, `isGreatest_traceInner` | `diag(3,4)`; `[[0,2],[0,0]]`; `A = 0` | `⟪1,A⟫ = 7 = N₁`; `⟪U_A,A⟫ = 2`; set is `{0}`-bounded, max `0` | holds |
| 1.2 maximizers, `traceInner_eq_nuclear_iff` | `A = (1 0)`; `[[0,2],[0,0]]`; `A = 0`; `E = 0` | `d₂ = 0` forced; `U_A + t e₂e₁ᵀ`, `\|t\| ≤ 1`; both sides true for all `D`; unique | holds (previous R01 repaired) |
| 1.2 reverse and Frobenius dualities | `diag(3,4)`, `v = u = e₂` | `⟪u vᵀ,A⟫ = ‖Av‖²/‖A‖ = 4`; `⟪A/5,A⟫ = 5` | holds |
| 1.3 polar factor API, `polarFactor_smul` | `z = i`, `A = 1`; `[[0,2],[0,0]]`; `A = 0` | `U = i·1`; `σ(U_A) = (1,0)`, `N₁ = ‖·‖_F² = 1`; `0` | holds |
| 1.3 `Units.polarUnitary` | invertible `a` | pin: `(√(a a⋆))⁻¹ a`; equals `a(a⋆a)^(-1/2) = U_a` | agrees |
| 1.4 `shampoo_eq_polarFactor` | `[[0,2],[0,0]]`; `A = 0`; `σ^(-1/4)·σ·σ^(-1/4)` | `diag(4^(-1/4),0)·A·diag(0,4^(-1/4)) = e₁e₂ᵀ`; `0`; `1` on each nonzero `σ` | holds; source at eqs (15), (16), (35) |
| 2.1 Mirsky | `diag(3,1)` vs `diag(1,3)`; `B = 0`; `2·1` vs `1` | `0,0 ≤ 2,4`; equal; `1 ≤ 1`, `2 ≤ 2` | holds; any `s` with `card ≤ k` equals "k largest" |
| 2.2 Fan–Hoffman | `diag(2,0)`, `W = 1`, `Q = −1`; `(2,0)ᵀ` vs `(cos θ, sin θ)ᵀ`; `A = 0` | `1 ≤ 3 ≤ 3`; `1 ≤ √(5−4cos θ) ≤ 3`; `W†A = \|A\|`, `(A−W)†(A−W) = (\|A\|−1)²` | holds (previous R02 repaired); locator R04 |
| 2.3 Frobenius | `(2,0)ᵀ`; `diag(2,1/2)`; `(2 0)` surjective | `5 − 4cos θ ≥ 1`; `5/4`; same value, not covered | holds; R01, R02 |
| 3.1 `oddStep`, `oddScalar`, `muonDirection` | `X = 2` cubic; `n = 0`; `A = 0` | `−1` (`−4` with exponent `j+1`); `0`; `0⁻¹ • 0 = 0` | holds |
| 3.2 `oddStep_iterate_eq` | `X = 2`, `k = 0,1,2`; `X = 0`; `diag(2,1/2)` | `2, −1, −1`; `0`; `diag(−1, 11/16)`; `Y†Y = f(\|X\|)²P` with `f(0) = 0` | holds |
| 3.3 error and alignment | `diag(2,1/2)`, cubic, `k = 1` | `max(2, 5/16) = 2`; `⟪Y,X⟫ = −2 + 11/32` | holds |
| 3.4 `tendsto_oddStep_iterate` | `diag(1/2,0)`; `X = 0`; `diag(3,4)` | limit `diag(1,0)`; vacuous, `0 = U_0`; `X₀ = diag(3/5,4/5)` | holds |
| 4.1 `tendsto_cubic_iterate` | `1/2`; `e = 0.4`; `√3`; root of `s³−3s−4` | `11/16`; `0.208` both sides; `0`; `2.195823 ↦ −2 ↦ 1` | holds; source eq (36), `(0, √3)` |
| 4.2 `tendsto_quintic_iterate` | `t = 0.3, 0.7, 1.3`; expansion | `0.470339`, `0.053224`, `−0.083599` both sides; product expands to `8 − 15t + 10t³ − 3t⁵` | holds |
| 4.3 `not_tendsto_muon_iterate` | `m(1)`; fixed points | `701/1000`; `0.868026`, `1.263729` | holds |
| 4.3 `mapsTo_muon_band` | grid of 200001 points on `J` | `m(J) = [0.681831, 1.179099]`; `m(5/4) = 482959/409600`; critical `0.554529 ↦ 1.202369`, `1.050136 ↦ 0.681831` | holds; "exact" R08 |
| 4.3 entry time, `muon_iterate_five_mem_band` | `(0,3/10]`; `[3/10,17/25]`; `1/270`; `1/1000` | `min m/t = 3.03121`; image `[0.909362, 1.202369]`; `m^[5]([1/270,5/4]) = [0.681831, 1.202368]`; `K = 5`; `K = 7` | holds |
| 5.1 `le_add_fderiv_add_of_lipschitz` | `x²/2`, `L = 1`; affine; `L < 0` | equality; equality; `h = 0`, `f x ≤ f x` | holds; `ψ' ≤ 0` route needs no integrability |
| 5.2 `norm_fderiv_eq_nuclear`, `spectral_descent` | `f = ⟪G,·⟫`; `f` not differentiable; `η = N₁/L` | `N₁(G)`; `G = 0`, `0 = 0`; `−N₁²/L + N₁²/(2L)` | holds; `opNorm_apply` is `‖toContinuousLinearMap A‖` at the pin |
| 5.2 `muonDirection_five` | `A = 1` on `ℝ²`; `A = 0`; `σ/‖A‖_F ∈ [1/270, 1]` | `m^[5](1/√2) = 1.108111`; all sides `0`; `max(0.32, 0.25) = 8/25`, `κ = 17/25`, `ρ = 5/4` | holds |
| 6.1 matrix interface | `A = (i)` | `ᴴ`: `1`; `ᵀ`: `−1` | holds; name R07 |

- Previous review (13 findings): R01–R09, R11–R13 repaired at this head; R06 partly (R04 here); R10 partly (R05, R09 here).
- Source locators checked against the text: 9 of 10 (BernsteinNewhouse2024 lines 202–203, 208–214, 219–235, 576–578, 590–600, 678–743; FanHoffman1955 lines 66–70; JordanMuon2024 lines 32, 106–117, 135–139); Mirsky not readable.
- Library declarations opened at the pin: 13 (`Polar/Finite.lean` 55, 218, 369; `KyFan.lean` 99, 250; `FanDominance.lean` 151; `UnitarilyInvariantSeminorm/Frobenius.lean` 72, 109, 133; `OpNorm.lean` 43, 59; `UnitarilyInvariantSeminorm/KyFan.lean` 65, 78; `EckartYoung.lean` 106; `ContinuousFunctionalCalculus/Polar.lean` 131). No pinned declaration states a target other than R03.
- Cross-roadmap citations resolved on main: PD-B11, B16, B19, B20, C28; MAJ-A26, A28, B01, B21, B30, B37; OI-A50. All present.
- Dependency check: `depcheck: 242 roadmaps, 2261 edges, 0 problem(s)`; no UPWARD or CYCLE line. Gate at 8103f75: every check 0, build OK; no change outside the folder.
- Elaboration of `Suggested.lean`: 21 `sorry` warnings, nothing else. Elaborated types of the 29 declarations compared with the README: no lost binder; generality agrees.
- One-tactic probe (`simp` with the definitions unfolded) on `traceInner_self`, `traceInner_polarFactor`, `abs_traceInner_le`, `polarFactor_smul`, `not_tendsto_muon_iterate`, `mapsTo_muon_band`, `tendsto_quintic_iterate`, and `exact?` on the descent lemma: none closes; `traceInner_self` closes by one `rw` (R03). Headlines of the Summary are all stated; the docstring names the README targets not stated.
- Overlap check: read Majorization, PolarDecomposition, PrincipalAngles (main), and also OperatorIdeals (main) and ManifoldOptimization (open); nothing shared: Mirsky's inequality, Fan–Hoffman, the trace duality, the Newton–Schulz dynamics and the Euclidean descent lemma have no other owner (ManifoldOptimization O2.2 and O2.4 use, and do not state, the nearest-point property and the descent lemma).

Source independence: 9 passages compared with 3 sources (BernsteinNewhouse2024, FanHoffman1955, JordanMuon2024), none shared beyond formulas; largest share BernsteinNewhouse2024, 6 of 10 locators; contents compared with BernsteinNewhouse2024 (its sections on Adam, Shampoo, Prodigy and Appendices A–B): independent. Mirsky 1960 could not be read.

## Not verifiable

- L. Mirsky, Quart. J. Math. 11 (1960), cited in §2.1: paywalled, not in the manifest; the inequality was checked by computation and the theorem number could not be confirmed.
- Ownership against the board's two listed packages (AnalyticNumberTheory, LawrenceVenkateshMethod): unrelated by title; their text was not read.

## Source issues

- none

## For the human reviewers

- **Scope.** §4.3 (band `[17/25, 5/4]`, entry time `K(s)`, threshold `1/270`) is stated in no source; `README.md` lines 375–377 say so. JordanMuon2024 is a web post, BernsteinNewhouse2024 an arXiv preprint.
- **Scope.** Layers 1–2 are general matrix analysis continuing `OperatorTheory/Majorization` and `OperatorTheory/PolarDecomposition`; they sit in a top-level roadmap whose `metadata.toml` topic is `math.OC`.
- **Licence.** `README.md` lines 469–478 name `github.com/brettkoonce/lean4-mlir` (stated BSD-3, by the pull request's author) as a prior formalization; `Suggested.lean` was not compared with its files.
- **Not tested.** Wording was not compared with Mirsky 1960, which could not be read.
