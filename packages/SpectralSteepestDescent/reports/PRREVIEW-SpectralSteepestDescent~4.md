# Review of SpectralSteepestDescent (pull request #2423 at 0690f81)

**Verdict:** needs changes

Incremental re-review: since `8103f75` the folder changed by 5 lines, all in `README.md` § Downstream consumers. `Suggested.lean` is unchanged. Findings R01–R05 and R07–R10 of the previous review are at untouched text and are written again; R06 is partly repaired.

## R01 (P3) — §2.3: the Lean statement is a special case of the Fan–Hoffman declaration

**Location:** `TauCetiRoadmap/SpectralSteepestDescent/Suggested.lean` lines 95–99, `frobenius_sub_polarFactor_le`; `README.md` lines 231–232: "`‖A − U_A‖_F ≤ ‖A − V‖_F`, with equality only for `V = U_A`".

**Claim:** For injective `A` the stated inequality is `map_sub_le_map_sub_of_eqOn_polarFactor` at `N = frobenius`, `W = U_A`. The equality case, the only content §2.3 adds to §2.2, is not stated.

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

**Location:** `README.md` lines 215–216 "(Fan–Hoffman, Theorem 1, p. 112.)"; lines 252 and 375 "Jordan et al., the section on the Newton–Schulz iteration"; lines 193–194 "Mirsky 1960 states the inequality for unitarily invariant norms"; line 485.

**Claim:** (a) The source theorem is for square complex matrices, a unitary `W` and norms; §2.2 is for rectangular isometries and seminorms and does not say what is proved here. (b) The post has no section of that name. (c) Mirsky has no theorem or page. (d) Gupta–Koren–Singer is cited at no claim.

**Witness:** FanHoffman1955 lines 21–22, 66–70. JordanMuon2024 line 106 (heading "Proving that NS iteration orthogonalizes the update"), line 127 ("Tuning the coefficients", coefficients at line 139). GuptaKorenSinger2018 line 101.

**Repair:** (a) "(Fan–Hoffman, Theorem 1, p. 112, for square matrices and unitary `W`, `Q`; the rectangular and seminorm form is proved here by the same argument.)" (b) §3.1: "(Jordan et al., section *Proving that NS iteration orthogonalizes the update*)"; §4.3: "(… section *Tuning the coefficients*, which gives only …)". (c) Give Mirsky's theorem number and page. (d) In §1.4 add "(Gupta–Koren–Singer, Algorithm 1, p. 3, for the update with accumulated preconditioners)".

## R05 (P3) — *Needs:* lines that are wrong or cover several targets

**Location:** `README.md` line 263 ("*Needs:* none"), line 435 ("*Needs:* 1.2, 3.3, 3.4, 4.3, 5.1"), lines 207–208 ("one exists whenever `finrank E ≤ finrank F`") with line 226.

**Claim:** §3.1's `muonDirection` uses `frobenius`. §5.2's one line covers four targets; the cubic and quintic directions need 4.1 and 4.2, which it omits. The existence of `W` for `finrank E ≤ finrank F` is neither a target nor PD-B20.

**Witness:** `Suggested.lean` line 165 (`frobenius` in `muonDirection`). `Polar/Finite.lean` lines 369–371 at the pin: `exists_linearIsometryEquiv_eqOn_polarFactor` assumes `finrank 𝕜 E = finrank 𝕜 F`.

**Repair:** §3.1: "*Needs:* Mathlib `LinearMap.adjoint`; MAJ-B30 to MAJ-B37 (`frobenius`) for `muonDirection`." §5.2: "*Needs:* dual norm: 1.2. Bound: 1.2, 5.1. Polar instance: 1.3. Muon instance: 3.2, 3.3, 3.4, 4.3. Cubic and quintic directions: 3.3, 3.4, 4.1, 4.2." Add to §1.3 the bullet "If `finrank E ≤ finrank F`, some `W : E →ₗᵢ[𝕜] F` agrees with `U_A` on `(ker A)ᗮ` (extend by an isometry `ker A → (range A)ᗮ`)", and cite it from §2.2.

## R06 (P3) — the consumer is cited without its sections, with process wording

**Location:** `README.md` lines 465–466: "The proposed ManifoldOptimization roadmap uses the Frobenius nearest-point property of the polar factor (2.3) and the Euclidean descent lemma (5.1); this roadmap owns both."

**Claim:** The pull-request link is gone. "The proposed … roadmap" is still process narrative, and the citation names no section of ManifoldOptimization.

**Witness:** ManifoldOptimization at its open head: `README.md` lines 464–466 (O2.2, Stiefel polar retraction, polar factor as unique nearest point) and line 501 (O2.4, the case `R_x(v) = x + v` of the pullback bound).

**Repair:** "ManifoldOptimization O2.2 uses the Frobenius nearest-point property of the polar factor (2.3), and its O2.4 the Euclidean descent lemma (5.1); this roadmap owns both."

## R07 (P3) — `Matrix.polarFactor` is backticked and not declared

**Location:** `README.md` lines 441–442, 451–452: "define `Matrix.polarFactor A` by transport along `Matrix.toEuclideanLin`".

**Claim:** A backticked name of the roadmap's own claims a declaration of `Suggested.lean`; the file has none, and its docstring says the matrix forms are not stated.

**Witness:** `Suggested.lean` declares 29 names, none `Matrix.polarFactor`; no `Matrix.polarFactor` in the pinned Mathlib or Tau Ceti.

**Repair:** Write "define the matrix polar factor `U_A` of `A : Matrix m n 𝕜` by transport along `Matrix.toEuclideanLin`" and use `U_A` in the three places.

## R08 (P3) — Summary: "the exact invariant band"

**Location:** `README.md` lines 10–11: "gives the exact invariant band of the quintic used by the Muon optimizer".

**Claim:** `J = [17/25, 5/4]` is an invariant interval with rational endpoints, neither the least nor the greatest one.

**Witness:** `m(J) = [0.681831, 1.179099] ⊊ J`, so `m(J)` is a smaller invariant interval.

**Repair:** "gives an explicit invariant band of the quintic used by the Muon optimizer and the number of steps needed to enter it".

## R09 (P3) — README shape

**Location:** `README.md` lines 59–67 (order of sections), 437 ("## Layer 6: matrices and worked examples"), 456 ("## Dependencies and order").

**Claim:** No layer ends with `### Examples` and `### Dependencies`; `## Conventions` comes after the supplier contracts; Layer 6 has no worked example beyond its Checks.

**Witness:** Headings of the head: 32, none `### Examples` or `### Dependencies`.

**Repair:** Move `## Conventions` before `## Exact supplier contracts`; split the sentences of "Dependencies and order" into a `### Dependencies` at the end of each layer and add `### Examples` there (the Checks' recurring instances `diag(3, 4)`, `[[0, 2], [0, 0]]`, `(2, 0)ᵀ` serve); rename Layer 6 "matrices".

## R10 (P3) — the description was written for an earlier head

**Location:** pull-request description: "Fan–Hoffman: the polar factor is the nearest unitary in every unitarily invariant norm (via Mirsky), plus the nearest Frobenius isometric embedding in the rectangular case." and "It builds on TauCeti's existing `PolarDecomposition`, `Majorization` and `UnitarilyInvariantSeminorm` material".

**Claim:** At the head §2.2 is for isometric embeddings `E → F` in every unitarily invariant seminorm, with the upper bound `N(A − Q) ≤ N(A + W)`; and the roadmap also consumes OperatorIdeals OI-A50.

**Witness:** `README.md` lines 207–211 and 50–51.

**Repair:** "Fan–Hoffman: an isometric extension of the polar factor is the nearest isometric embedding, and its negative the farthest, in every unitarily invariant seminorm (via Mirsky), with uniqueness in Frobenius norm." and "… `PolarDecomposition`, `Majorization` and `OperatorIdeals` (OI-A50) …".

## Previous findings

- R01 — not repaired: `Suggested.lean` lines 95–99 unchanged; the conclusion is the bare inequality.
- R02 — not repaired: `README.md` line 230 still "Let `A` be injective"; no surjective case, PD-B19 in no *Needs:* line.
- R03 — not repaired: `traceInner_self` is at `Suggested.lean` lines 34–36.
- R04 — not repaired: "(Fan–Hoffman, Theorem 1, p. 112.)"; "the section on the Newton–Schulz iteration" (lines 252, 375); "Mirsky 1960 states the inequality"; Gupta–Koren–Singer only at line 485.
- R05 — not repaired: line 263 "*Needs:* none"; line 435 "*Needs:* 1.2, 3.3, 3.4, 4.3, 5.1"; line 226 "*Needs:* 1.3, 2.1, PD-B20, MAJ-B21."
- R06 — partly repaired: "The proposed ManifoldOptimization roadmap uses the Frobenius nearest-point property of the polar factor (2.3) and the Euclidean descent lemma (5.1)". The link is removed; "proposed" and the missing sections remain (R06 above).
- R07 — not repaired: line 441 "define `Matrix.polarFactor A` by transport along"; also lines 442, 451, 452.
- R08 — not repaired: lines 10–11 "gives the exact invariant band of the quintic used by the Muon optimizer".
- R09 — not repaired: `## Conventions` at line 67 after `## Exact supplier contracts` at line 38; "## Layer 6: matrices and worked examples"; no `### Examples` or `### Dependencies`.
- R10 — not repaired: the description still reads "the polar factor is the nearest unitary in every unitarily invariant norm" and does not name OperatorIdeals.

## Verified sound

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| 2.3 Frobenius (cited by the changed text; R01, R02) | `(2,0)ᵀ` vs `(cos θ, sin θ)ᵀ`, `θ = 0, 1, π`; `(2 0)` surjective | `5 − 4cos θ = 1, 2.838791, 9`; minimum `1` only at `θ = 0`; same values, not covered | inequality holds; R01, R02 |
| 5.1 descent lemma (cited by the changed text) | `f = x²/2`, `L = 1`, `x = 0.7`, `h = −1.3` | both sides `0.18` | holds, with equality |
| 1.1 `traceInner_self` (R03) | `A = 2e₁e₂ᵀ` | `⟪A, A⟫ = 4 = ‖A‖_F²` | holds; padding, R03 |
| 2.2 Fan–Hoffman (R04, R05) | `diag(2,0)`, `W = 1`, `Q = −1`, operator norm | `1 ≤ 3 ≤ 3` | holds; locator R04, existence of `W` R05 |
| 3.1 `muonDirection` (R05) | `A = 0` | `0⁻¹ • 0 = 0`; the body uses `frobenius` | holds; *Needs:* R05 |
| 4.3 `mapsTo_muon_band` (R08) | grid of 200001 points on `J`; `t = 1` | `m(J) = [0.681831, 1.179099]`, `m(5/4) = 1.179099`, `m(1) = 0.701` | holds; "exact" R08 |
| 6.1 matrix interface (R07) | `A = (i)` | `ᴴ`: `1`; `ᵀ`: `−1` | holds; name R07 |

The rows for the untouched statements stand as in the previous review, of `8103f75`.

- Change since `8103f75`: one paragraph of `README.md` (§ Downstream consumers, lines 465–466); `Suggested.lean` and `metadata.toml` unchanged; no file changed outside the folder.
- Cross-roadmap citation in the changed passage resolved: ManifoldOptimization at its open head, `README.md` lines 448, 464–466 (O2.2), 496–501 (O2.4). It uses, and does not state, the nearest-point property and the Euclidean descent lemma; it does not cite this roadmap, and this roadmap does not consume it.
- Source locators: none in the changed passage; the nine checked at `8103f75` are in unchanged text.
- Dependency check: `depcheck: 242 roadmaps, 2261 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Gate at `0690f81`: every check 0, build OK.
- Elaboration of `Suggested.lean`: 21 `sorry` warnings, nothing else. The file is identical to the one read at `8103f75`, so the comparison of the 29 elaborated types and the one-tactic probes stand.
- The title and the description's other sentences agree with the head (a new roadmap; band `[17/25, 5/4]`, threshold `1/270`, five steps; cubic on `(0, √3)`, quintic on `(0, 1]`); R10 is the exception.
- Overlap check: read Majorization, PolarDecomposition, PrincipalAngles (main) and ManifoldOptimization (open); nothing shared.

Source independence: changed passages only; 1 passage compared with 4 sources (BernsteinNewhouse2024, FanHoffman1955, JordanMuon2024, GuptaKorenSinger2018), none shared; largest share BernsteinNewhouse2024, 6 of 10 locators; the diff adds, removes or reorders no layer, so the contents were not compared again. Mirsky 1960 could not be read.

## Not verifiable

- L. Mirsky, Quart. J. Math. 11 (1960), cited in §2.1: paywalled, not in the manifest; the theorem number could not be confirmed.

## Source issues

- none

## For the human reviewers

- **Scope.** §4.3 (band `[17/25, 5/4]`, entry time `K(s)`, threshold `1/270`) is stated in no source; `README.md` lines 375–377 say so. JordanMuon2024 is a web post, BernsteinNewhouse2024 an arXiv preprint.
- **Scope.** Layers 1–2 are general matrix analysis continuing `OperatorTheory/Majorization` and `OperatorTheory/PolarDecomposition`; they sit in a top-level roadmap whose `metadata.toml` topic is `math.OC`.
- **Licence.** `README.md` lines 468–477 name `github.com/brettkoonce/lean4-mlir` (stated BSD-3, by the pull request's author) as a prior formalization; `Suggested.lean` was not compared with its files.
- **Not tested.** Wording was not compared with Mirsky 1960, which could not be read.
