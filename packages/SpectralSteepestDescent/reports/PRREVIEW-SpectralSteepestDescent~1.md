# Review of SpectralSteepestDescent (pull request #2423 at 6ed719d)

**Verdict:** needs changes

## R01 (P1) — §1.2: the non-uniqueness claim is false for surjective maps

**Location:** `TauCetiRoadmap/SpectralSteepestDescent/README.md` lines 90–91: "If `ker A ≠ ⊥` and `F` is nontrivial, the maximizer is not unique, and `U_A` is the unique maximizer of least Frobenius norm."

**Claim:** A maximizer `D` is a contraction equal to `U_A` on `(ker A)ᗮ`; this forces `D(ker A) ⊆ (range A)ᗮ`, so the maximizer is unique whenever `A` is surjective, kernel or not.

**Witness:** `E = ℝ²`, `F = ℝ`, `A = (1 0)`: `ker A ≠ ⊥`, `N₁(A) = 1`. `D = (d₁ d₂)` with `⟪D, A⟫ = d₁ = 1` and `‖D‖_op = √(d₁² + d₂²) ≤ 1` gives `D = (1 0) = U_A` only. BernsteinNewhouse2024 line 235 agrees (unique iff full rank).

**Repair:** Replace the two sentences by: "The maximizer is unique if and only if `A` is injective or surjective. If `ker A ≠ ⊥` and `range A ≠ ⊤`, the maximizers are exactly the maps `U_A + T ∘ P`, where `P` is the orthogonal projection onto `ker A` and `T : ker A → (range A)ᗮ` has operator norm at most `1`; `U_A` (the case `T = 0`) is the unique one of least Frobenius norm, since `‖U_A + T ∘ P‖_F² = rank A + ‖T‖_F²`." On the witness `range A = ⊤`, so it is unique; on the §6.2 example `[[0, 2], [0, 0]]` it gives `U_A + t·e₂e₁ᵀ`, `|t| ≤ 1`. Add the witness as a negative-control Check.

## R02 (P2) — §2.2–2.3: the nearest-isometry theorem is stated square-only, and rectangular only in Frobenius norm

**Location:** `README.md` lines 131–133 ("Let `finrank E = finrank F`, and let `W : E ≃ₗᵢ[𝕜] F` agree with `U_A` on `(ker A)ᗮ`") and lines 137–138; `Suggested.lean` lines 88–91.

**Claim:** The same argument proves the theorem for isometric embeddings in every unitarily invariant seminorm: for an isometry `W` equal to `U_A` on `(ker A)ᗮ`, `W† ∘ A = |A|`, so `(A − W)†(A − W) = (|A| − 1)²`, and §2.1 applies to any isometry `Q`. The upper bound of FanHoffman1955 line 69 is also dropped.

**Witness:** `E = ℝ`, `F = ℝ²`, `A = (2, 0)ᵀ`, `Q = (cos θ, sin θ)ᵀ`: `‖A − U_A‖_op = 1 ≤ √(5 − 4 cos θ) = ‖A − Q‖_op ≤ 3 = ‖A + U_A‖_op`. The README gives this case for `‖·‖_F` only.

**Repair:** State 2.2 as: "Let `W : E →ₗᵢ[𝕜] F` agree with `U_A` on `(ker A)ᗮ` (one exists whenever `finrank E ≤ finrank F`). For every linear isometry `Q : E →ₗᵢ[𝕜] F` and every unitarily invariant seminorm `N`, `N(A − W) ≤ N(A − Q) ≤ N(A + W)`. The singular values of `A − W` are `|σᵢ(A) − 1|` and those of `A + W` are `σᵢ(A) + 1`, for `i < finrank E`." Keep 2.3 for the Frobenius uniqueness only. In `map_sub_le_map_sub_of_eqOn_polarFactor` change `W Q : E ≃ₗᵢ[𝕜] F` to `W Q : E →ₗᵢ[𝕜] F` (with `.toLinearMap`).

## R03 (P2) — `Suggested.lean` states §1.4 and §3.2 over `ℝ` only; the README states them over `𝕜`

**Location:** `Suggested.lean` lines 72 and 110 (`shampoo_eq_polarFactor (A : E' →ₗ[ℝ] F')`, `oddStep_iterate_eq … (X : E' →ₗ[ℝ] F')`); `README.md` lines 110–114 and 152–153 ("Prove, for every `A`").

**Claim:** Both headlines are statable over `RCLike 𝕜` at the pins; the file states the real special case in their place and says nowhere that it does.

**Witness:** With binders `[CompleteSpace E] [Algebra ℝ (E →L[𝕜] E)] [IsScalarTower ℝ 𝕜 (E →L[𝕜] E)]` (and the same for `F` in the Shampoo identity) both statements elaborate over `𝕜`, using `instContinuousFunctionalCalculusRCLikeIsSelfAdjoint` (`TauCeti/Analysis/InnerProductSpace/ContinuousFunctionalCalculus.lean` line 189).

**Repair:** State both over `{𝕜 E F}` with those instance binders in the theorems' own signatures and delete the `E' F'` real copies of them; add to the README conventions that `cfc` on `E →L[𝕜] E` is taken for any real algebra structure compatible with the `𝕜`-action.

## R04 (P3) — gate: imports (`imports`, `mathlib-subimports`, `no-import-mathlib`)

**Location:** `Suggested.lean` lines 9–15: `import Mathlib.Analysis.Calculus.FDeriv.Basic`, `import Mathlib.Analysis.SpecialFunctions.Pow.Real`, then five `TauCeti.*` modules.

**Claim:** The file has no `import Mathlib` line and two `Mathlib.<submodule>` imports; the gate fails on three import rules.

**Witness:** Gate at 6ed719d: `imports=1 mathlib-subimports=2 no-import-mathlib=1 … FAIL`.

**Repair:** Replace lines 9–10 by the single line `import Mathlib`, and keep the five `TauCeti.*` imports after it.

## R05 (P3) — gate: an edit outside the roadmap folder (`outside-folder`)

**Location:** top-level `README.md` line 195: "+ - [Spectral steepest descent: polar factors, Newton–Schulz iterations and Muon](TauCetiRoadmap/SpectralSteepestDescent/README.md)".

**Claim:** A roadmap pull request touches only its own directory; the roadmap list is regenerated after merge.

**Witness:** `CONTRIBUTING.md`, "Opening a pull request": "A roadmap pull request touches only its own directory under `TauCetiRoadmap/`"; `git diff --stat origin/main...HEAD` outside the folder: `README.md | 1 +`.

**Repair:** Revert the line in the top-level `README.md`.

## R06 (P3) — no statement carries a source locator

**Location:** `README.md` Layers 1–5 throughout; References, lines 279–293 ("Higham … Chapter 8", "Horn and Johnson … Chapter 3").

**Claim:** No theorem of the README is followed by a locator; the reference list gives at most a chapter.

**Witness:** The README contains no theorem, proposition, equation or page number. Locators found in the texts read: FanHoffman1955 line 66 (Theorem 1); BernsteinNewhouse2024 lines 208, 219, 578, 591–600; JordanMuon2024 lines 32–34, 111–117, 175–179.

**Repair:** Put a locator in parentheses at each claim: §1.2 (Bernstein–Newhouse, Prop. 5 and its proof, pp. 5–6, 17–18); §1.4 (ibid., Eqs. (15)–(16), p. 5, and Appendix A, Eq. (35), p. 15); §2.2 (Fan–Hoffman, Theorem 1, p. 112); §2.3 (Bernstein–Newhouse, Prop. 4, p. 5); §3.2 and the Muon coefficients and normalization (Jordan et al., section on the Newton–Schulz proof); §4.1 (Bernstein–Newhouse, Appendix A, Eq. (36), p. 15); and theorem and page numbers in Mirsky, Higham and Horn–Johnson for §2.1, §2.2 and §4.1–4.2. State that §4.3's band, entry time and `1/270` threshold are proved here and appear in no cited source.

## R07 (P3) — supplier citations name no target and one supplier is missing

**Location:** `README.md` lines 31–41 and 126 ("Extend Tau Ceti's `abs_singularValues_sub_singularValues_le`"), line 106 ("Tau Ceti's matrix polar decomposition `Units.polarUnitary`").

**Claim:** Suppliers are cited by folder only; the `k = 1` Mirsky bound is OperatorIdeals OI-A50, a roadmap the README lists only as out of scope; `Units.polarUnitary` is not matrix-specific.

**Witness:** `TauCeti/Analysis/OperatorIdeal/ApproximationNumber/EckartYoung.lean` line 106; `TauCetiRoadmap/OperatorTheory/OperatorIdeals/README.md` line 247; `TauCeti/Analysis/SpecialFunctions/ContinuousFunctionalCalculus/Polar.lean` lines 73–75, 131 (any star-ordered ring with a real functional calculus).

**Repair:** Cite targets: PolarDecomposition PD-B11–PD-B16, PD-B19 (`polarFactor_adjoint`), PD-B20 (`exists_linearIsometryEquiv_eqOn_polarFactor`), PD-C28; Majorization MAJ-A26, MAJ-A28 (`norm_sum_inner_le_kyFanSum`), MAJ-B01, MAJ-B21 (`map_le_of_kyFanSum_le`), MAJ-B30–MAJ-B37; add "OperatorIdeals OI-A50 (`LinearMap.abs_singularValues_sub_singularValues_le`)" to the consumed list; write "the unitary factor `Units.polarUnitary` of a unit of a star-ordered algebra, applied to `Matrix n n 𝕜`".

## R08 (P3) — §5.1 leaves open whether the descent lemma is built

**Location:** `README.md` lines 212–213: "Reuse a Mathlib form if one exists, and build it here otherwise."

**Claim:** A target is either owned or cited; the library claim must be settled at the pin.

**Witness:** No declaration with this conclusion in the pinned Mathlib or Tau Ceti (search for "descent lemma", "quadratic upper bound", Lipschitz-gradient bounds: no match in `Mathlib/Analysis/Calculus`).

**Repair:** Replace the sentence by "Mathlib has no such statement at the pin; it is a target of this layer", and list "the descent lemma" under the owned items (already there, line 26).

## R09 (P3) — §5.2: the step size divides by `L` under the hypothesis `L ≥ 0`

**Location:** `README.md` lines 220 and 227–228: "with constant `L ≥ 0`" … "With the step size `η = N₁(G) / L` this gives decrease `N₁(G)² / (2L)`."

**Claim:** At `L = 0` the step size and the decrease are `0/0`-type expressions.

**Witness:** `L = 0`, `N₁(G) = 1`: `η = 1/0`.

**Repair:** "For `L > 0`, the step size `η = N₁(G) / L` gives `f (W − η U_G) ≤ f W − N₁(G)² / (2L)`."

## R10 (P3) — definitions without Checks; sections and per-target dependencies missing

**Location:** `README.md` §1.1 (`traceInner`), §3.1 (`oddStep`, `oddScalar`), line 69 (`muonDirection`), §6.1 (`Matrix.polarFactor`); line 260 ("## Dependencies and order").

**Claim:** No definition has its own `**Checks.**` list of three discriminating tests; no target has a `*Needs:*` line; `## Exact supplier contracts`, `## How to read the build`, per-layer `### Examples` and `### Dependencies`, and `## Downstream consumers` are absent.

**Witness:** §6.2 is the only Check list (five bullets, none on `traceInner` or `oddStep` conventions); the one dependency paragraph covers six layers.

**Repair:** Add Checks at each definition, for example: `traceInner`: `⟪1, 1⟫ = finrank E`; over `ℂ`, `⟪A, i • A⟫ = 0` (excluded by a pairing without `re`); `⟪D, A⟫` for `D = e₁e₂ᵀ`, `A = 2e₁e₂ᵀ` is `2`, and `0` for `Dᵀ`. `oddStep`: on `X = 2` with `c = (3/2, −1/2)` the value is `−1` (an exponent `(X†X)^(j+1)` gives `−4`); `c = (1)` is the identity; `oddStep c (−X) = −oddStep c X`. `muonDirection`: `0` at `0`; invariance under `A ↦ t • A`, `t > 0`; the §6.2 identity example. Move §6.2's bullets under the sections they test, add `*Needs:*` to each target, and add the missing sections.

## R11 (P3) — `Suggested.lean` header and missing docstrings

**Location:** `Suggested.lean` lines 1–7 (a plain comment headed "suggested interfaces") and lines 33, 58, 133, 136.

**Claim:** The file has no module docstring "…: target signatures" saying which headline theorems are not stated; `traceInner_self`, `polarFactor_ofReal_smul`, `tendsto_cubic_iterate`, `tendsto_quintic_iterate` have no docstring.

**Witness:** Sibling `TauCetiRoadmap/OperatorTheory/Majorization/Suggested.lean` lines 9–16 has the `/-! # …: target signatures` docstring after the imports.

**Repair:** After the imports add `/-! # Spectral steepest descent: target signatures`, saying that `README.md` is the roadmap, that the file states its headline theorems against the pinned APIs, and that the entry-time bound `K(s)` of §4.3 and the matrix forms of §6.1 are README targets not stated here. Add a one-line docstring to each of the four theorems.

## R12 (P3) — §6.1 restricts the matrix interface to `ℝ`

**Location:** `README.md` line 240: "For `A : Matrix m n ℝ`, define `Matrix.polarFactor A` by transport along `Matrix.toEuclideanLin`."

**Claim:** Layers 1–4 are over `RCLike 𝕜`; the matrix forms hold verbatim with `ᴴ` for `ᵀ`.

**Witness:** `A = (i) : Matrix (Fin 1) (Fin 1) ℂ`: `U_A = (i)`, `U_Aᴴ * U_A = 1`, `re trace (U_Aᴴ * A) = 1 = N₁(A)`; with `ᵀ` the product is `−1`.

**Repair:** "For `A : Matrix m n 𝕜` … Prove `(Matrix.polarFactor A)ᴴ * Matrix.polarFactor A = 1` when `A` has full column rank … Use the trace pairing `re (trace (Aᴴ * B))`".

## R13 (P3) — §1.3 states the scaling law for positive reals and `−1` only

**Location:** `README.md` line 100: "`U_(c • A) = U_A` for real `c > 0`, and `U_(-A) = -U_A`"; `Suggested.lean` lines 58–59.

**Claim:** The general law over `𝕜` is `U_(z • A) = (z / ‖z‖) • U_A` for `z ≠ 0`; the two stated cases are instances.

**Witness:** `𝕜 = ℂ`, `A = 1`, `z = i`: `|i • 1| = 1` and `U = i • 1`; neither stated case covers it.

**Repair:** State "for `z : 𝕜`, `z ≠ 0`: `|z • A| = ‖z‖ • |A|` and `U_(z • A) = (z / ‖z‖) • U_A`; in particular `U_(c • A) = U_A` for real `c > 0` and `U_(-A) = -U_A`", and state `polarFactor_ofReal_smul` in that form.

## Verified sound

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| 1.2 `\|⟪D,A⟫\| ≤ ‖D‖_op N₁(A)`, attained at `U_A` | `A = diag(3,4)`; `A = [[0,2],[0,0]]`; `A = 0` | `⟪1,A⟫ = 7 = N₁`; `⟪U_A,A⟫ = 2 = N₁`; both sides `0` | holds |
| 1.2 maximizer iff `D ∘ \|A\| = A` | `A = (1 0)`, `D = (1 d₂)` | contraction forces `d₂ = 0`; `D∘\|A\| = A` | iff holds; uniqueness sentence false (R01) |
| 1.2 reverse and Frobenius dualities | `A = diag(3,4)`, `v = e₂`, `u = e₂` | `⟪u vᵀ, A⟫ = 4 = ‖A‖_op`; `⟪A/5, A⟫ = 5 = ‖A‖_F` | holds |
| 1.3 polar factor API | `A = [[0,2],[0,0]]`; `z = i` over `ℂ` | `σ(U_A) = (1, 0)`, `N₁ = ‖U_A‖_F² = 1 = rank`; `U_(iA) = i U_A` | holds; narrow (R13) |
| 1.3 `Units.polarUnitary` | invertible `a` | pin: `u = √(a a⋆)⁻¹ a`; equals `a √(a⋆a)⁻¹` | agrees for units |
| 1.4 Shampoo, `shampoo_eq_polarFactor` | `A = [[0,2],[0,0]]`; `A = 0` | `φ(AA†) = diag(4^(-1/4),0)`, `φ(A†A) = diag(0,4^(-1/4))`, product `e₁e₂ᵀ = U_A`; `0 = 0` | holds; `cfc` not junk (finite spectrum) |
| 2.1 Mirsky, `sum_abs_singularValues_sub_le_kyFanSum` | `A = diag(3,1)`, `B = diag(1,3)`, `k = 1, 2` | left `0, 0`; right `2, 4` | holds; `k = 1` is pinned Weyl bound |
| 2.2 Fan–Hoffman | `A = diag(2,0)`, `W = 1`, `Q = −1`, `N = ‖·‖_op` | `‖A − W‖ = 1 ≤ ‖A − Q‖ = 3`; `σ(A − W) = (1,1) = \|σᵢ − 1\|` | holds; narrow (R02) |
| 2.3 nearest embedding, Frobenius | `A = (2,0)ᵀ`, `V = (cos θ, sin θ)ᵀ` | `‖A − V‖_F² = 5 − 4cos θ ≥ 1`, equality only `θ = 0` | holds |
| 3.2 spectral form, all `k` | `X = 2`, cubic, `k = 1, 2` | `oddStep = −1 = U·g(2)`; next `−1 ↦ −1 = g(−1)`; negative values allowed | holds |
| 3.3 error and alignment | `X = diag(2, 1/2)`, cubic, `k = 1` | `Y = diag(−1, 11/16)`; `‖Y − 1‖_op = 2 = max\|g(s) − 1\|`; `⟪Y,X⟫ = −2 + 11/32` | holds |
| 3.4 `tendsto_oddStep_iterate` | `X = 0`; `X = diag(1/2, 0)` | hypothesis vacuous, limit `0 = U_0`; limit `diag(1,0) = U_X` | holds |
| 4.1 cubic | `g(1/2)`, `g(√3)`, `g(−2)`, root of `s³ − 3s − 4` | `11/16`; `0`; `1`; `s = 2.19582`, `g(s) = −2`; `e' = e²(3 − e)/2` at `e = 0.4`: `0.208` both sides | holds |
| 4.2 quintic | `t = 0.3, 0.7, 1.3` | `1 − q = (1−t)³(3t²+9t+8)/8`: `0.47034`, `0.05322`, `−0.08360` both sides; factor max on `[0,1]` is `5/2` | holds |
| 4.3 fixed and critical points | exact rationals | `m(1) = 701/1000`; fixed `0.86803`, `1.26373`; critical `0.55453` (value `1.20237`), `1.05014` (value `0.68183`) | holds |
| 4.3 `mapsTo_muon_band` | `J = [0.68, 1.25]` | `m(J) = [0.681831, 1.179099]`; `m(5/4) = 482959/409600` | holds, margin `0.0018` |
| 4.3 entry time, `muon_iterate_five_mem_band` | `(0, 0.3]`, `[0.3, 1.25]`, `s = 1/270`, `1/1000` | `min m(t)/t = 3.0312`; `m([0.3,1.25]) ⊆ [0.6818, 1.2024]`; orbit of `1/270` reaches `1.1906` at step 5; `K(1/1000) = 7` | holds |
| 4.3 `not_tendsto_muon_iterate` | any `s` | a limit `1` would need `m(1) = 1`; `m(1) = 0.701` | holds |
| 5.1 `le_add_fderiv_add_of_lipschitz` | `f(x) = x²/2`, `L = 1`; `L < 0` | equality `(x+h)²/2`; hypothesis forces `h = 0` | holds |
| 5.2 `norm_fderiv_eq_nuclear`, `spectral_descent` | `f = ⟪G,·⟫`; `f` not differentiable at `W` | `‖f'‖ = N₁(G)`; `fderiv = 0` forces `G = 0`, both sides `0`; `ρ ≥ 0` follows from `hD` | holds; `L = 0` step (R09) |
| 5.2 `muonDirection_five` | `A = 1` on `ℝ²`; `A = 0` | `m^[5](1/√2) = 1.10811 ∈ J`; `\|m^[5] − 1\| ≤ max(0.32, 0.25) = 8/25`; at `0` all sides `0` | holds |
| 6.1 matrix interface | `A = (i)` over `ℂ` | `ᴴ` gives `1`, `ᵀ` gives `−1` | real only (R12) |
| 6.2 Checks | all five bullets | `N₁(diag(3,4)) = 7`; `m(1/2) = 1.188859375`; maximizers of `[[0,2],[0,0]]` are `U_A + t e₂e₁ᵀ` | agree with Layers 1–4 and with R01's repair |

- Source locators: the README has none (R06); statements compared with the text at FanHoffman1955 lines 66–70, BernsteinNewhouse2024 lines 208–214, 219–235, 574–600, 678–743, JordanMuon2024 lines 30–42, 108–121, 173–179; GuptaKorenSinger2018 line 101.
- Library declarations opened at the pin: 14 (`Polar/Finite.lean` 55, 218, 369; `KyFan.lean` 99, 250; `FanDominance.lean` 151; `UnitarilyInvariantSeminorm/{OpNorm 43, Frobenius 109, KyFan 53 and 65, Basic 271}`; `EckartYoung.lean` 106; `ContinuousFunctionalCalculus/Polar.lean` 131; `ContinuousFunctionalCalculus.lean` 189). No pinned declaration proves a target of this roadmap; `HoffmanWielandt/Singular.lean` 47 is the Frobenius case of §2.1 only.
- Cross-roadmap citations resolved: 3 (PolarDecomposition, Majorization, OperatorIdeals on main); `roadmaps resolve` leads: none.
- Dependency check: `depcheck: 239 roadmaps, 2248 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Gate at 6ed719d: FAIL on `imports`, `mathlib-subimports`, `no-import-mathlib`, `outside-folder` (R04, R05); every other check 0, build 0.
- Elaboration of `Suggested.lean`: 22 `sorry` warnings, nothing else. `#check @name` types compared with the README: no lost binder; differences are R02, R03.
- One-tactic probe (`simp`, `exact?`) on `traceInner_self`, `polarFactor_ofReal_smul`, `abs_traceInner_le`, `mapsTo_muon_band`, `tendsto_quintic_iterate`, `not_tendsto_muon_iterate`: none closes. Headlines listed in the Summary are all stated; pull-request title and description agree with the head.
- Overlap check: read ManifoldOptimization (#1506), OperatorTheory (#1854, main), Majorization, PolarDecomposition; the Frobenius nearest-point property of the polar factor (ManifoldOptimization O2.2 uses it, citing a paper) and the descent lemma (its O2.4 Euclidean case) have no other owner: this roadmap owns both (§2.3, §5.1). Fetching the sources recorded four entries in `packages/SpectralSteepestDescent/sources.toml`.

Source independence: 8 passages compared with 3 sources (BernsteinNewhouse2024, JordanMuon2024, FanHoffman1955), none shared; largest share: none, the README has 0 locators; contents compared with BernsteinNewhouse2024 (its sections and Appendices A–B): independent. Higham, Mirsky, Björck–Bowie and Horn–Johnson could not be read.

## Not verifiable

- N. J. Higham, *Functions of Matrices*, Chapter 8 (§2.2, §2.3, §4.1, §4.2): paywalled; no legal copy found.
- L. Mirsky, Quart. J. Math. 11 (1960) (§2.1): paywalled; statement checked by computation only.
- Å. Björck and C. Bowie, SIAM J. Numer. Anal. 8 (1971) (§4.1–4.2): paywalled.
- R. A. Horn and C. R. Johnson, *Topics in Matrix Analysis*, Chapter 3 (§2.1): paywalled.
- Ownership against the board's packages: the two listed packages are unrelated by title; their text was not read.

## Source issues

- none

## For the human reviewers

- **Scope.** §4.3 (band `[17/25, 5/4]`, entry time `K(s)`, threshold `1/270`) is stated in no source read; JordanMuon2024 lines 135–139 (a web post) gives only an empirical target `[0.7, 1.3]`. BernsteinNewhouse2024 is an arXiv preprint.
- **Scope.** Layers 1–2 (trace duality, polar-factor API, Mirsky, Fan–Hoffman) are general matrix analysis continuing `OperatorTheory/Majorization` and `OperatorTheory/PolarDecomposition`; they sit here in a top-level roadmap with topic `math.OC` (`metadata.toml`).
- **Licence.** `README.md` lines 268–275 name `github.com/brettkoonce/lean4-mlir` (stated BSD-3, by the pull request's author) as a prior formalization; `Suggested.lean` was not compared with its files.
- **Not tested.** Wording and arrangement were not compared with Higham, Mirsky, Björck–Bowie or Horn–Johnson, which could not be read.
