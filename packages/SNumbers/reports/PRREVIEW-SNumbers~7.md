# Review of SNumbers (pull request #2648 at dbdedba)

**Verdict:** accepted

**Summary.** Accepted: there are no findings. Every statement of Parts A to E was recomputed on degenerate and small instances, 43 locators were read at the texts of five sources, every library declaration the README names was opened at the pins, and the README on main was compared with the head item by item: all 86 labels, the fifteen milestones, the eight Checks and the seven worked examples are kept with their statements. There are three small corrections (the *Needs:* line of SN-E05 names a tool that cannot reach the stated value; Convention 9 pairs the annihilator and the preannihilator with the wrong pairings; SN-C15 and SN-D12 carry completeness hypotheses their routes do not use) and three format notes, none blocking. A licence question, the dropped `## Definitions` summary and three unread books are left for the human reviewers.

## C01 — The *Needs:* line of SN-E05 names the coercive-subspace bound, which cannot give the lower bound, and the target has neither route nor locator

An implementer who follows the *Needs:* line of SN-E05 (README line 975: "Tau Ceti `ContinuousLinearMap.singularValue`, `le_singularValue_of_lt_rank`") is stuck at the lower bound. That lemma bounds `aₙ(T)` below by the coercivity constant of `T` on one fixed subspace of rank `> n`, so it gives at most the Bernstein number `bₙ(T)`, and `bₙ < aₙ` here. Take `p = 2`, `q = 10`, `m = 3`, `n = 1`, `σ = (1, 1, 1)`: SN-E05 gives `a₁ = 2^{1/2 − 1/10} ≈ 1.3195`, while by (S3) and SN-C20 `b₁(id : ℓ₁₀³ → ℓ₂³) ≤ b₁(id : ℓ∞³ → ℓ₂³) ≤ √(3/2) ≈ 1.2247`. The lemma does suffice in the Check of SN-E02 (`n = m − 1`, the whole space), which is perhaps where the line comes from.

The statement itself is supported: it is Pietsch 1974, Theorem 7.2 (pietsch1974 lines 343–347, where `aₙ = cₙ = dₙ` equals the tail `ℓ_r` norm), and the lower bound there chooses, for each `L` of rank `≤ n`, a vector of `ker L` depending on `L`: the vector of Pietsch's Lemma 7.1 that SN-C20 already uses, with a weighted comparison of norms. The smallest change: add the locator "Pietsch 1974, Theorem 7.2" to SN-E05, replace `le_singularValue_of_lt_rank` in its *Needs:* line by `le_singularValue_iff` and the flat vector of SN-C20 (Pietsch 1974, Lemma 7.1), and say in one sentence that the kernel vector depends on `L`. SN-E02 inherits the route through its *Needs:* SN-E05.

## C02 — Convention 9 attaches the annihilator to `topDualPairing` and the preannihilator to its flip; at the pin it is the other way round

Convention 9 (lines 102–103) says that the annihilator `Mᗮ ≤ X*` and the preannihilator `V_⊥ ≤ X` "are Mathlib's `Submodule.orthogonalBilin` for `topDualPairing 𝕜 X` and its flip, as in Tau Ceti". Read in order, this pins the convention backwards, and an implementer who writes `M.orthogonalBilin (topDualPairing 𝕜 X)` for `M ≤ X` gets a term that does not typecheck. In the pinned Tau Ceti the preannihilator of `G ≤ StrongDual 𝕜 E` is `G.orthogonalBilin (topDualPairing 𝕜 E)` and the annihilator of `S ≤ E` is `S.orthogonalBilin (topDualPairing 𝕜 E).flip` (`TauCeti/Analysis/Normed/Module/Annihilator.lean`, lines 53–54 and 61–62; `quotientDualEquivAnnihilator` in `Dual/Quotient.lean`, line 39, lands in the flipped one). The supplier contracts and the *Needs:* lines of SN-C13 and SN-C14 use the names correctly; only the sentence of Convention 9 needs its two halves exchanged ("for the flip of `topDualPairing 𝕜 X` and for `topDualPairing 𝕜 X`").

## C03 — SN-C15 and SN-D12 ask for completeness that their routes do not use, against Convention 4

Convention 4 says completeness "is a hypothesis of the statements whose proofs use it, and of no other statement". SN-C15 (line 682, and `gelfandNumber_precomp_of_isCompactOperator` in `Suggested.lean`, line 406, with `[CompleteSpace X] [CompleteSpace Y]`) is stated "for compact `T` between Banach spaces", yet no step of its route uses completeness: SN-C13 and SN-C14 hold for normed spaces, a compact operator has a totally bounded `T(B_X)` without completeness (`IsCompactOperator.totallyBounded_image_closedBall`, `TauCeti/Analysis/Normed/Operator/Compact/Basic.lean`, line 95), and the pinned local reflexivity `LinearIsometry.exists_continuousLinearMap_of_doubleDual` asks only for a normed `E` (`…/Dual/LocalReflexivity.lean`, lines 219–233). SN-D12 (line 893) asks for complete Hilbert spaces, while its only Hilbert input, SN-B02, needs the source alone to be complete, as the description of this pull request says of SN-B02 and SN-B03.

Either drop the two unused hypotheses (SN-C15 for normed spaces, SN-D12 from a complete inner product space to an inner product space), or keep them and say in a clause that they are the source's (Pietsch 1974, Theorem 6.3, is stated for Banach spaces).

## N01 — `Additive`, `Multiplicative` and `bernstein` share their short names with Mathlib declarations

Inside `TauCetiRoadmap.SNumbers` these names (`Suggested.lean`, lines 418, 424 and 156) coincide with Mathlib's root `Additive`, `Multiplicative` and `bernstein` (the Bernstein polynomials), so with the namespace open they are ambiguous. `IsAdditive`, `IsMultiplicative` and a longer name for the family would avoid it. Raised before; unchanged.

## N02 — `Submodule.orthogonalProjection` is deprecated at the pin

The *Needs:* line of SN-B02 (line 440) cites `Submodule.orthogonalProjection`; at the pinned Mathlib it is a deprecated alias of `Submodule.orthogonalProjectionOnto` (`Mathlib/Analysis/InnerProductSpace/Projection/Basic.lean`, lines 120–124).

## N03 — Several Mathlib names of the *Needs:* lines are absent from the list "From Mathlib"

For example `rank_fin_fun` (SN-A03), `Module.finrank_fin_fun` (SN-E03), `Submodule.complete_of_finiteDimensional` (SN-A14), `LinearMap.quotKerEquivRange` and `rank_quotient_add_rank_of_divisionRing` (SN-A09), `LinearMap.rank_range_add_rank_ker` (SN-A17). All exist at the pin; adding them would keep the contract list complete. Raised before for the first two; unchanged.

## Previous findings

The previous review, of `8c8ec43`, had no findings and no small corrections. Its three format notes at this head:

- N01 (the numbering of Layer 1 skipped §1.6) — no longer applies: the head uses main's labels, and `SN-A01`–`SN-A24` run without a gap.
- N02 (`Additive`, `Multiplicative`, `bernstein`) — not repaired; written again as N01.
- N03 (`rank_fin_fun`, `Module.finrank_fin_fun` absent from the Mathlib contracts) — not repaired: "From Mathlib" still lists "`LinearMap.rank`, `Module.rank`" only; written again as N03.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result; change |
|---|---|---|---|
| SN-A02 axioms (Milestone A1) | `id` of `ℓ₂²`; `n = 0, 1, 2` | `s₀ = 1` (S1), `s₁ = 1` (S5), `s₂ = 0` (S4); one-based (S5) would force `s₂ = 1` | Pass |
| SN-A05 homogeneity | `c = 0`; `Y = 0` | both sides `0` by (S4); `‖c • id_Y‖ = 0 ≤ ‖c‖` | Pass |
| SN-A06, SN-A07 (A1) | `X = 0`; `n < rank X`; `𝕜 = ℚ₂` | `a₀(id₀) = 0`; kernel vector gives `‖id − R‖ ≥ 1`; pin: `singularValue_id = if n < rank then 1 else 0` | Pass; `MinMax.lean` 139–148 |
| SN-A08, SN-A09 (A2) | `diag(2,1)` on `ℓ₂²` | `c₀ = 2`, `c₁ = min √(4cos²θ+sin²θ) = 1`, `c₂ = 0`; dimension variant gives `c₀ = 0` | Pass; pietsch1974 158–162 |
| SN-A11 unit-ball form | `ℚ₂` with norm `(3/2)\|x\|₂` | `d₀(id) = 1`; ball forces `\|x\|₂ ≤ 1/2`, norm `≤ 3/4` | Pass |
| SN-A12, SN-A13 (A2) | `ℝ` over `ℚ`, `V = ℚ`; `ℓ₂^{n+1}` over any field | `d₁(id_ℝ) = 0`, rank `> 1`; subspaces of `𝕜^{n+1}` closed, Riesz gives `‖π_V‖ = 1` | Pass; pietsch1974 238–240 |
| SN-A14 lifting (A2) | `𝕜 = ℚ`, `X = Y = ℝ` | `d₁ = 0`; rational functional on `ℓ₁` kills all but finitely many `δ_x`, so `a₁(Q_X) = 1` | Pass; pietsch1974 223–225 |
| SN-A15 embedding (A2) | `M = ker L`; `L = (φT − g_φ)_φ` | rank `≤ n`, `‖J_Y T − L‖ = sup ‖g_φ‖ ≤ ‖T\|_M‖` | Pass; pietsch1974 190–192 |
| SN-A16, SN-A17 (A3) | `id : ℓ₂² → ℓ∞²`; `X = 0` | `b₁ = 1/√2` at `(1,1)`; sup variant `1`; empty supremum `0` in `ℝ≥0` | Pass; pietsch1974 174–180 |
| SN-A18–SN-A20 (A3) | `n = 0`; `id` of `ℓ₂^{n+1}` | `h₀ = ‖T‖` by rank-one `A`, `B`; `aₙ(P_{n+1}) ≥ aₙ(id) = 1` | Pass |
| SN-A21–SN-A24 (A4) | `ℚ₂`, norm `max (1+1/(i+2))\|wᵢ\|₂`, `Q w = ∑wᵢ` | `d₀(Q) = 1 = d₀(id)`; ball deviation `1/2` at `2e₀` (`‖2e₀‖ = 3/4`) | Pass; pietsch1974 160–162, 238–240 |
| SN-B01–SN-B04 sandwich, uniqueness (B1) | `diag(3,1)`, `c = 1/2`, `n = 1`; `c = 0` | `B = ½ diag(1/3,1)`, `‖B‖ = 1/2`, `BTA = ½ id`; `s₁ = a₁ = 1` | Pass; pin lemma asks completeness of the source only |
| SN-B05 finite dimension | `n ≥ dim H₁` | both sides `0`; `LinearMap.singularValues : ℕ →₀ ℝ` matches the cast | Pass |
| SN-B06–SN-B09 compactness (B2) | `k = 0`; `𝕜 = 𝔽₂(u)((t))` | no cover, vacuous; `‖y_i‖ ≤ ε` on `M` gives `2ε`; `d₁(id_𝕜) = 0`, ball not compact | Pass; pietsch1974 529 |
| SN-B11, SN-B12 (B2) | `M` of dimension `n+1`, `N` of codimension `≤ n` | `dim (M ∩ N) ≥ 1`; `1 = sₙ(id_M) ≤ c⁻¹ sₙ(T)` | Pass; pietsch1974 205–206, 421–422 |
| SN-C01–SN-C03 | `n = 0`; source one-based | factor `1`; `1 + (n−1)^{1/2}` becomes `1 + √n` | Pass; pietsch1974 468–488 |
| SN-C04–SN-C08 (C2) | `diag(1,t)`; `k = 0` | `Δ₁ = 1`, `Δ₂ = t`; `t/4 ≤ t`; `t ≤ h₁Δ₁ = t`; `a₀Δ₀ = ‖T‖ = Δ₁`; bordered det `λ^{2k}μ² b((T−L)x) det` | Pass; ullrich2026 327–328, 356–421 |
| SN-C09–SN-C12 (C2), headline | `n = 0, 1, 2`; `aₙ = 0` | factors `1`, `4`, `27/4` against `e(n+1) ≈ 2.72, 5.44, 8.15`; `0/0`-free since `(0:ℝ)^0 = 1` | Pass; ullrich2026 184–186, 216–220 |
| SN-C13–SN-C15 duality (C3), headline | `V = Mᗮ`, `M = V_⊥`; incomplete `X`, `Y` | `‖π_V T'‖ = ‖T\|_{V_⊥}‖`; `infDist(Tx, R(W)) ≤ δ + (1+ε)(dₙ(T'')+ε)` with no completeness | Pass; C03; pietsch1974 280–293, 296–332 |
| SN-C16–SN-C19 (C4) | `m = 0`; one index `0` | (S2) from additivity; `sₙ(BTA) ≤ ‖B‖ sₙ(T) ‖A‖` | Pass; pietsch1974 552–553 |
| SN-C20–SN-C22 (C4) | `N = 3`, `n = 1`; `N = 71`, `n = 35` | `√(3/2)·1/√2 = 0.866 < 1`; `1/6 + √71/54 = 0.3227 < 1/3` | Pass; pietsch1974 344–348; pietsch2008 201 |
| SN-D01, SN-D02 (D1) | `id_ℝ`; `ℚ₂` with `(3/2)\|x\|₂` | `eₙ = 2^{-n}`; `n`-ball variant `1, 1/2`; `e₀ = 3/4 < 1` | Pass |
| SN-D03–SN-D06 (D1) | `ℚ₂`: `S = id : X → Y`, `B = id : Y → X`, `Y` rescaled by `3/2` | `e₀(BS) = 1 > 3/4 = e₀(B)e₀(S)`: density needed; segment gives `eₙ ≥ ‖Tx‖/2ⁿ` | Pass |
| SN-D07–SN-D11 (D2) | `id_ℝ`, `n = 0, 1`; sign vectors differing at `j` | `c₀ = 1 ≤ e₀ = 1`, `c₁ = 0`; separation `2γ/(n+1)`, `2^{n+1} > 2ⁿ` points | Pass; ullrich2026 239–243 |
| SN-D12–SN-D14 (D2), headline | `id_ℝ`, `n = 0`; `H₂` incomplete | `1 ≤ 2`; `1/2 ≤ eₙ(id) ≤ γ⁻¹eₙ(T)` uses SN-B02 only | Pass; C03; ullrich2026 244–246 |
| SN-E01–SN-E03 (E1) | `m = 2`, `p = 1`, `q = 2`, `n = 0, 1` | `√2` at `(1,1)`; `a₁ = 1` | Pass |
| SN-E04 (E1) | `σₙ = 0`; `n = m − 1` | upper bound `0`; `1 = sₙ(id) ≤ \|σₙ\|⁻¹ sₙ(D_σ)` | Pass; pietsch1974 321–339 |
| SN-E05 (E1) | `p=2`, `q=10`, `m=3`, `n=1`; `p=1`, `q=2`, `n=0` | `a₁ = 2^{0.4} = 1.3195 > √(3/2) = 1.2247 ≥ b₁`; `‖D_σ‖ = ‖σ‖₂` | Statement true; C01; pietsch1974 343–347 |
| SN-E06 (E1) | `σ = (0,1)`, `p = q = 2` | `a₀ = 1 > 0 = \|σ₀\|`: ordering needed | Pass; lean-snumbers 898–900 |
| SN-E07–SN-E09 (E2) | `J = ∅`; `T₁ = T₂ = id_ℝ` | `0 ≤ M²`; `1 ≤ 1 ≤ 1`, `2a₁ = 0 ≤ 1` | Pass; lean-snumbers 986–996 |
| SN-E10–SN-E12 (E2), headline | `n = 0, 1, 2` | `hₙ = 1, 1/2, 1/3`; `‖A‖ = ‖B‖ = 1`, `BIA = (n+1)⁻¹ id`; `(n+1)/2·hₙ = 1/2 ≤ cₙ` | Pass; ullrich2026 204–206; lean-snumbers 1046 |
| SN-E13, SN-E14 (E3) | `n = 64`, `m = 65`; `n = 8192`, `m = 16385`; `m = 0` | `8/√65 = 0.9923`; `8193² = 67125249 > 67112960 = 4096·16385`; `hₙ = 0` | Pass |
| Convention 9 | pin | preannihilator `G.orthogonalBilin (topDualPairing 𝕜 E)`, annihilator with `.flip` | C02 |
| "This roadmap owns" | pin, main | SN-A06 is in `…/ApproximationNumber/MinMax.lean`; no other target is at the pin; OperatorIdeals and BanachSpaceTheory own what is consumed | Pass |

- Source locators read at the text: 43, in five sources. pietsch1974: 20 (axiom (5) at line 40; Theorems 3.1, 4.1, 4.3, 4.5, 4.6, 5.1, 5.3, 6.2, 6.3, 7.1, 7.2, 8.1, 8.4, 9.3, 9.5; Lemma 7.1; the three definitions). ullrich2026: 11 (§1, §2, §3, Lemmas 3 and 4, Theorem 1, equations (3) and (4), the optimality list, the two citations of Pietsch 1980, 12.3.1 and 12.3.2). lean-snumbers: 10 (Theorems 3.4, 3.6, 3.8, 4.2, 6.8, 8.6, 8.10; Lemma 7.9; Proposition 3.12; Corollary 8.14), all still at these numbers in the blueprint dated 4 November 2026. ullrich2024 Remark 1 (line 88); pietsch2008 Theorem 3 (line 201).
- Library declarations opened at the pins: 41 of Tau Ceti (all found; `singularValue_id`, `le_singularValue_of_lt_rank`, `HasMinMaxLowerBound.of_completeSpace`, `exists_continuousLinearMap_of_doubleDual`, the six annihilator and duality declarations, `norm_comp_mkQL`, `det_eq_mul_det_submatrix_castSucc_of_col` read in full) and 30 of Mathlib (`externalCoveringNumber` uses closed covers, `Mathlib/Topology/MetricSpace/CoveringNumbers.lean:68`; `NormedAddGroupHom.IsQuotient`, `Mathlib/Analysis/Normed/Group/Quotient.lean:344`; `sSup_unitClosedBall_eq_nnnorm` has a seminormed target, `Mathlib/Analysis/Normed/Operator/NNNorm.lean:203`).
- Cross-roadmap citations resolved on main: BanachSpaceTheory B4 (Schmidt series, README line 299), B6 (`κ_ℝ = 8`, `κ_ℂ = 16`, `π₁(T) ≤ κ ‖T‖` for `L¹(μ) → H`, lines 1238–1260), B7 (Kadec–Snobar and Garling–Gordon as cited, lines 1309–1313), B1; OperatorIdeals and PolarDecomposition links exist.
- Record: the README at the merge base compared with the head item by item: Parts A–E, 86 labels, 15 milestones, 8 Checks, 7 worked examples all kept with their statements; the changes of statement are those the description lists.
- Automatic checks: all passed on this head. Dependency check: `depcheck: 133 roadmaps, 1473 edges, 0 problem(s)`. No file outside the roadmap folder is changed.
- Elaboration of `Suggested.lean`: 56 `sorry` warnings and the one `#check`, nothing else. One-tactic probe (`rfl`, `simp`, `infer_instance`, `constructor <;> simp`, `simp_all` after unfolding the four predicates) on all 56 theorems: none closes. The elaborated types of the 76 declarations were compared with the README statements: no section binder lost, generality equal.
- Description against the head: 86 targets, 15 milestones, 19 Checks (8 of main and 11 added), the changed statements, the Lean renamings and the removal of `approximationNumber_id` agree with the head. Nothing to correct.

Overlap check: read OperatorIdeals (main and its open revision), BanachSpaceTheory (main and its open revision), ConditioningAndPerturbation (open); nothing shared. OperatorIdeals owns the approximation numbers and assigns the other s-number sequences and the entropy numbers to SNumbers; BanachSpaceTheory owns the Schmidt series, Grothendieck's theorem and the projection theorems, consumed through B4, B6, B7; ConditioningAndPerturbation only consumes Tau Ceti's approximation numbers.

Source independence: 43 locators and 6 further passages (SN-A17, SN-B08, SN-C07, SN-D11, the Check of SN-A14, the docstring of `detNumber`) compared with 5 sources; none shared with pietsch1974, ullrich2026, ullrich2024 or pietsch2008; six passages run parallel to the Apache-2.0 lean-snumbers blueprint of the roadmap's original author (reported to the human reviewers); largest share pietsch1974, 26 of 79 locators; contents compared with pietsch1974 (§§0–9) and with the blueprint (Chapters 1–11): independent, no part maps onto a run of sections. Pietsch 1980, Pietsch 1987 and Carl–Stephani 1990 could not be read.

Research link: Parts C and E state the maximal difference theorem `aₙ ≤ e(n+1)hₙ` of Ullrich (2026, Theorem 1) and its sharpness, which settles conjectures of Mityagin–Henkin (1963) and Carl–Pietsch; Parts A and B are Pietsch's axiomatic theory (1974); Part D is Pietsch's and Carl–Stephani's entropy numbers. Rests on the ullrich2026 and pietsch1974 texts.

## Not verifiable

- Pietsch 1980 (*Operator Ideals*), Chapters 11 and 12: no open copy; 12.3.1 (SN-D13) and 12.3.2 (SN-D11) are confirmed only at second hand (ullrich2026 lines 243–245), the six chapter locators not at all.
- Pietsch 1987 (*Eigenvalues and s-Numbers*), Chapter 2 and 2.10.2: no open copy; that `hₙ ≤ sₙ ≤ aₙ` is there is confirmed at second hand (ullrich2026 line 46).
- Carl–Stephani 1990, Chapters 1–2 (ten locators of Part D and SN-B06): no open copy. The statements themselves were recomputed.

## Source issues

- **Misprint** in ullrich2026 at the proof of Lemma 4, printed page 9: the source says the new coordinate τ of the bordered operator is real; it should be a scalar of the field 𝕂, so that the operator is defined on all of ℓ₂^{n+1} over ℂ; affects nothing.

## For the human reviewers

- Licence: `Suggested.lean` line 2 reads "Copyright (c) 2026 Mario Ullrich", Apache 2.0, and its declaration names (`IsSNumberSequence.abs_sub_le`, `Additive`, `entropyNumber_pos`) are those of the Apache-2.0 Lean-SNumbers repository; both are on main already.
- Licence: README passages SN-A17, SN-B08, SN-C07, SN-C20–SN-C22, SN-D11 run step by step parallel to the Lean-SNumbers blueprint (lean-snumbers lines 183–229, 744–759, 1265–1274, 1322–1343), by the roadmap's original author; all but SN-C07 and SN-D11 are on main.
- Licence: the blueprint was read from the GitHub Pages site of its author, Mario Ullrich, vouched for as an author's page.
- Record: main's `## Definitions` summary (D1–D8) is not in the head; each entry abbreviated an item that stands in full under its `SN-` label, and the description says so.
- Not tested: Pietsch 1980, Pietsch 1987 and Carl–Stephani 1990 could not be read, so their 26 locators and the wording beside them were not compared with the texts.
