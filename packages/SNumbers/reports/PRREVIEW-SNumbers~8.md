# Review of SNumbers (pull request #2648 at 9faebb6)

**Verdict:** accepted

**Summary.** Accepted: there are no findings. This is an incremental re-review of the 54 lines changed since `dbdedba`; the three small corrections of the previous review (the route of SN-E05, the pairings of Convention 9, the unused completeness in SN-C15 and SN-D12) are repaired, and each repair was recomputed and checked against the pinned libraries and Pietsch 1974. The title and description were read against the head and against the README on main. There are two small corrections (the description does not say that the `L2` abbreviation leaves `Suggested.lean`; SN-E05 now cites a theorem that also covers the source exponent `∞`) and three format notes carried over, none blocking. The questions for the human reviewers stand as before.

## C01 — The description does not say that `Suggested.lean` drops the abbreviation `L2`

The section "Suggested.lean" of the description accounts for the local `approximationNumber`, for `dualOp` and for `approximationNumber_id`, and a reader takes these to be all the declarations that leave the file. One more does: main's `abbrev L2 (𝕜) := lp (fun _ : ℕ => 𝕜) 2` (line 107 of `Suggested.lean` on main) is not in the head, where `hilbertNumber` spells the space out as `lp (fun _ : ℕ => 𝕜) 2` (lines 80–81). A sentence would do: "The abbreviation `L2` is dropped; `hilbertNumber` writes `lp (fun _ : ℕ => 𝕜) 2` directly."

## C02 — SN-E05 now cites Pietsch 1974, Theorem 7.2, which also covers the source exponent `∞`

With the locator added, a reader who opens the theorem finds a wider statement than the target: SN-E05 (line 975) asks for `1 ≤ p < q < ∞`, while the theorem is stated for source exponent up to and including `∞` (pietsch1974 lines 343–347; there the source exponent is called `p` and the target `q`), and its proof notes that the case `∞` is the easier one (lines 388–389). The target is true as written and the route given also works for `q = ∞` with `r = p` and `x = e`: for `p = 2`, `m = 3`, `n = 1`, `σ = (1, 1, 1)` the flat vector `(1, 1, t)` has `‖x‖₂ = √(2 + t²) ≥ √2 = (∑_{k ≥ 1} 1)^{1/2} ‖x‖∞`. The statement predates this change, so this does not block; it would be enough either to extend SN-E05 to `q ≤ ∞` or to say in a clause that the theorem cited also has `q = ∞`.

## N01 — `Additive`, `Multiplicative` and `bernstein` share their short names with Mathlib declarations

Inside `TauCetiRoadmap.SNumbers` these names (`Suggested.lean`, lines 418, 424 and 156) coincide with Mathlib's root `Additive`, `Multiplicative` and `bernstein`, so with the namespace open they are ambiguous. `IsAdditive`, `IsMultiplicative` and a longer name for the family would avoid it. Raised before; unchanged.

## N02 — `Submodule.orthogonalProjection` is deprecated at the pin

The *Needs:* line of SN-B02 (line 441) cites it; at the pinned Mathlib it is a deprecated alias of `Submodule.orthogonalProjectionOnto`. Raised before; unchanged.

## N03 — Several Mathlib names of the *Needs:* lines are absent from the list "From Mathlib"

For example `rank_fin_fun` (SN-A03), `Module.finrank_fin_fun` (SN-E03), `Submodule.complete_of_finiteDimensional` (SN-A14). All exist at the pin. Raised before; unchanged.

## Previous findings

The previous review, of `dbdedba`, had no findings. Its three small corrections and three format notes at this head:

- C01 (SN-E05: *Needs:* named the coercive-subspace bound; no route, no locator) — repaired: "`le_singularValue_iff` tests each `L` of rank `≤ n` on a vector of `ker L` chosen for that `L`", with Pietsch 1974, Theorem 7.2 and Lemma 7.1; the route was recomputed (table).
- C02 (Convention 9 pairings exchanged) — repaired: "`Submodule.orthogonalBilin` for the flip of `topDualPairing 𝕜 X` and for `topDualPairing 𝕜 X`", as at the pin.
- C03 (unused completeness in SN-C15 and SN-D12) — repaired: SN-C15 is "for compact `T` between normed spaces (Pietsch 1974, Theorem 6.3, there for Banach spaces)", the Lean statement has no `CompleteSpace`; SN-D12 is "from a complete inner product space to an inner product space".
- N01 (`Additive`, `Multiplicative`, `bernstein`) — not repaired; written again as N01.
- N02 (`Submodule.orthogonalProjection` deprecated) — not repaired; written again as N02.
- N03 (Mathlib names absent from the contracts) — not repaired; written again as N03.

No repair introduced a new problem. C02 of this report concerns a statement that the repair left unchanged and only gave a locator.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result; change |
|---|---|---|---|
| SN-C15, `gelfandNumber_precomp_of_isCompactOperator` (Milestone C3) | `n = 0`; `X = 0`; rank-one `T` into incomplete `Y`, `n = 1`; route at incomplete `X`, `Y` | `c₀(T') = ‖T'‖ = ‖T‖ = d₀(T)`; `0 = 0`; `c₁(T') = 0 = d₁(T)`; `infDist(Tx, R(W)) ≤ δ + (1+ε)(dₙ(T'')+ε)`, each input free of completeness at the pin | Pass; elaborated type has no `CompleteSpace` |
| SN-C13, SN-C14 (inputs of SN-C15) | pin | both stated for normed spaces; `cₙ(T') ≤ dₙ(T)` and `dₙ(T'') = cₙ(T')` give the reduction to `dₙ(T) ≤ dₙ(T'')` | Pass |
| SN-D12 | `id_ℝ`, `n = 0`; `H₂` incomplete | `a₀ = 1 ≤ 2 = 2e₀`; `1/2 ≤ eₙ(id_{ℓ₂^{n+1}}) ≤ γ⁻¹ ‖B‖ eₙ(T) ‖A‖`; SN-B02 asks completeness of `H₁` only | Pass |
| SN-E05, `singularValue_diagOp` (Milestone E1) | `p=2`, `q=10`, `m=3`, `n=1`, `σ=(1,1,1)`, `e=(1,1,t)`; `p=1`, `q=2`, `m=2`, `n=0,1` | `r = 5/2`; ratio `‖D_σx‖₂/‖x‖₁₀`: `2^{0.4} = 1.3195` at `t=0`, `1.3995` at `t=½`, `1.552` at `t=1`, bound `1.3195`; `√2`, `1` | Pass; C02 |
| SN-E05 route in general | `A = ∑\|σ_k\|^r\|e_k\|^p`, `S = ∑\|σ_k\|^r\|e_k\|^q` | `p + rp/q = r`; `‖D_σx‖_p = A^{1/p} = A^{1/r}A^{1/q} ≥ τ S^{1/q} = τ‖x‖_q`, since `A ≥ S` and `A ≥ τ^r` (at most `n` coordinates not of modulus 1, `\|σ\|` nonincreasing) | Pass |
| Flat vector, SN-C20 against SN-E05 | subspace of dimension `≥ m' − n` in `𝕜^{m'}` | SN-C20 form gives `≥ m' − n` coordinates of modulus 1, i.e. all but at most `n`; Lemma 7.1 one-based: codimension `< n+1`, fewer than `n+1` exceptions | Pass; pietsch1974 344–348 |
| Convention 9 | pin | annihilator of `S ≤ E`: `S.orthogonalBilin (topDualPairing 𝕜 E).flip`; preannihilator of `G`: `G.orthogonalBilin (topDualPairing 𝕜 E)` | Pass |
| Summary, duality sentence | against SN-C15 | "for compact T the Gelfand numbers of the dual are the Kolmogorov numbers", over ℝ or ℂ: the hypotheses of SN-C15 at this head | Pass |

The rows for the statements the change does not touch stand as in the previous review, of `dbdedba`.

- Source locators read at the text: 3, in pietsch1974, all in the changed passages and in the sampled Milestones C3 and E1: Theorem 6.3 (lines 296–332, compact `S`, `dₙ(S) = cₙ(S')`, by local reflexivity and a finite net), Theorem 7.2 (lines 343–347), Lemma 7.1 (lines 344–348). The other sampled milestones lie outside the change.
- Library declarations opened at the pinned Tau Ceti: `LinearIsometry.exists_continuousLinearMap_of_doubleDual` (`Analysis/Normed/Module/Dual/LocalReflexivity.lean`, normed `E`, no completeness, with the clause on the canonical embedding); `IsCompactOperator.totallyBounded_image_closedBall` (`Analysis/Normed/Operator/Compact/Basic.lean:95`, no completeness); `le_singularValue_iff` and `singularValue_le_nnnorm_sub` (`Analysis/OperatorIdeal/ApproximationNumber/Basic.lean:97` and `:89`); the two annihilator lemmas (`Analysis/Normed/Module/Annihilator.lean:53–62`); `TauCeti.HasMinMaxLowerBound.of_completeSpace` (complete source only).
- Cross-roadmap citations: none added or changed by the diff; no supplier added or dropped.
- Automatic checks: all pass on this head (rerun). Dependency check: `depcheck: 133 roadmaps, 1473 edges, 0 problem(s)`. No file outside the roadmap folder is changed.
- Elaboration of `Suggested.lean`: 56 `sorry` warnings and the one `#check`, nothing else. One-tactic probe on the changed theorem `gelfandNumber_precomp_of_isCompactOperator` (`simp`, `rfl`, `simp` after unfolding both sequences, antisymmetry with `gelfandNumber_precomp_le` and `simp`): none closes. Its elaborated type and that of `singularValue_diagOp` were compared with SN-C15 and SN-E05: generality equal.
- Description against the head and the README on main: 86 labels, 15 milestones, 19 Checks (8 of main, 11 added), 7 worked examples; main's SN-A06, SN-A07, SN-B02, SN-B03, SN-C15, SN-D05, SN-D12, SN-E05, SN-E09, SN-E13 and the retitled worked example read as the description says; the Lean renamings and the removal of `approximationNumber_id` agree. One omission: C01.
- Record: the diff removes or renumbers no part, label, milestone, Check or worked example.

Overlap check: read OperatorIdeals (main and its open revision), BanachSpaceTheory (main and its open revision), ConditioningAndPerturbation (open); nothing shared. The change adds no object; ownership stands as in the previous review.

Source independence: changed passages only: 4 passages (SN-C15, SN-D12, SN-E05, the docstring of `gelfandNumber_precomp_of_isCompactOperator`) compared with 1 source, pietsch1974 (Theorems 6.3 and 7.2, Lemma 7.1); none shared, and the route of SN-E05 replaces the source's weighted inequality (its Lemma 7.2) by a direct comparison. Largest share pietsch1974, 28 of 81 locators; the diff adds, removes or reorders no layer, so the arrangement was not compared again. Pietsch 1980, Pietsch 1987 and Carl–Stephani 1990 could not be read.

Research link: Parts C and E state the maximal difference theorem `aₙ ≤ e(n+1)hₙ` of Ullrich (2026, Theorem 1) and its sharpness, which settles conjectures of Mityagin–Henkin (1963) and Carl–Pietsch; Parts A and B are Pietsch's axiomatic theory (1974); Part D is Pietsch's and Carl–Stephani's entropy numbers. Rests on the ullrich2026 and pietsch1974 texts.

## Not verifiable

- Pietsch 1980 (*Operator Ideals*), Chapters 11 and 12: no open copy; none of its locators is in the changed passages.
- Pietsch 1987 (*Eigenvalues and s-Numbers*), Chapter 2: no open copy; none of its locators is in the changed passages.
- Carl–Stephani 1990, Chapters 1–2: no open copy; SN-D12 keeps its locator there, and its statement was recomputed instead.

## Source issues

- none

## For the human reviewers

- Licence: `Suggested.lean` line 2 reads "Copyright (c) 2026 Mario Ullrich", Apache 2.0, and its declaration names (`IsSNumberSequence.abs_sub_le`, `Additive`, `entropyNumber_pos`) are those of the Apache-2.0 Lean-SNumbers repository; both are on main already.
- Licence: README passages SN-A17, SN-B08, SN-C07, SN-C20–SN-C22, SN-D11 run step by step parallel to the Lean-SNumbers blueprint (lean-snumbers lines 183–229, 744–759, 1265–1274, 1322–1343), by the roadmap's original author; all but SN-C07 and SN-D11 are on main.
- Licence: the blueprint was read from the GitHub Pages site of its author, Mario Ullrich, vouched for as an author's page.
- Record: main's `## Definitions` summary (D1–D8) is not in the head; each entry abbreviated an item that stands in full under its `SN-` label, and the description says so.
- Not tested: Pietsch 1980, Pietsch 1987 and Carl–Stephani 1990 could not be read, so their 26 locators and the wording beside them were not compared with the texts.
