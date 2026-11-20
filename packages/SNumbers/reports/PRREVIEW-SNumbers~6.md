# Review of SNumbers (pull request #2648 at 8c8ec43)

**Verdict:** accepted

**Summary.** Accepted: there are no findings. This is an incremental re-review of the 134 lines changed since `2322e11`: the six small corrections of the previous review are all repaired, every new locator was read at the source and supports the statement beside it, the corrected route of §3.7 computes to the stated constant, and the two statements whose hypotheses were weakened (§2.2, §2.3) hold with an incomplete target and elaborate as the README states them. The description of the pull request agrees with the head, including the Lean changes, which I compared type by type against the base. There are no small corrections and three format notes, none blocking; one licence question and the unread books are left for the human reviewers.

## N01 — The numbering of Layer 1 still skips §1.6

Layer 1 goes from §1.5 to §1.7 and its opening paragraph ("Sections 1.1–1.7 set up the axioms…", line 109) does not say that no §1.6 exists. A clause there saying that the number is left unused would do.

## N02 — `Additive`, `Multiplicative` and `bernstein` share their short names with Mathlib declarations

Inside `TauCetiRoadmap.SNumbers` these names (`Suggested.lean`) coincide with Mathlib's root `Additive`, `Multiplicative` and `bernstein` (the Bernstein polynomials); with the namespace open, `@Additive`, `@Multiplicative` and `@bernstein` are reported as ambiguous. `IsAdditive`, `IsMultiplicative` and a longer name for the family would avoid it.

## N03 — `rank_fin_fun` is used in §1.3 and absent from the Mathlib supplier contracts

The *Needs:* line of §1.3 (line 146) now cites `rank_fin_fun`, which exists at the pin (`Mathlib/LinearAlgebra/Dimension/Constructions.lean`, line 316) but is not in the list "From Mathlib"; the same holds for `Module.finrank_fin_fun` of §5.3. Adding both beside `Module.rank` would keep the list complete.

## Previous findings

The previous review, of `2322e11`, had no findings (no R-numbered remark). Its small corrections and format notes at this head:

- C01 — repaired: §1.2 cites "Ullrich 2026, §2"; §1.17 and its docstring "Pietsch 1974, Theorem 4.5"; §5.6 "Lean-SNumbers blueprint, Theorem 8.6"; §5.11 "Lean-SNumbers blueprint, Corollary 8.14". Each read at the source.
- C02 — repaired: §1.13, §1.23, §1.24, §2.2, §2.4, §2.11, §2.12, §3.3, §3.5, §3.19, §3.20, §4.13, §5.4, §5.9 carry a theorem number; §5.14 says "derived here from §5.13".
- C03 — repaired: §3.7 now borders by "a vector `x ∈ B_X` on which `T − L` nearly attains its norm" for `L := T A (B T A)⁻¹ B T`; *Needs:* cites `singularValue_le_nnnorm_sub` and `exists_dual_vector''`.
- C04 — repaired: "with `κ_𝕜` the constant with which BanachSpaceTheory B6 proves Grothendieck's theorem (`κ_ℝ = 8`, `κ_ℂ = 16`)", and the module docstring says the same.
- C05 — repaired: the *Needs:* line of §1.3 reads "Mathlib `Module.rank`, `WithLp.linearEquiv`, `rank_fin_fun`"; both hold over any field (format note N03 on the contracts list).
- C06 — repaired: §2.2 and §2.3 ask "a complete inner product space `H₁`, an inner product space `H₂`"; `[CompleteSpace H₂]` is gone from both Lean signatures; §2.10 keeps it.
- N01 — not repaired: Layer 1 still passes from §1.5 to §1.7 without a word; written again as N01.
- N02 — not repaired: `Additive` and `Multiplicative` keep their names; written again as N02.

No repair introduced a new problem.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result; change |
|---|---|---|---|
| 2.2 scalar factorization, `H₂` incomplete | `diag(3,1)` from `ℓ₂²` into finitely supported sequences, `n = 1`, `c = 1/2`; `n = 2`; `c = 0` | `A = id`, `B = ½ diag(1/3,1) ∘ P`, `‖B‖ = 1/2`, `B T A = ½ id`; `a₂ = 0`, no admissible `c`; `A = B = 0` | Pass; Lean type has `[CompleteSpace H₁]` only |
| 2.3 uniqueness, `H₂` incomplete | same `T`; `n = 0` | `s = a = (3, 1, 0)`; `s₀ = ‖T‖ = a₀ = 3` | Pass; input `HasMinMaxLowerBound.of_completeSpace` asks completeness of the source only |
| 3.7 lower recursion, corrected route | `id` on `ℓ₂²`, `k = 1`, `A = e₁`, `B = e₁*`; `k = 0`; `diag(1,t)`, `k = 1` | `L = diag(1,0)`, `x = e₂`: `λ²μ² = 1/4 = 1¹/2² · a₁ Δ₁`; `μ² b(Tx) → ‖T‖`, factor `0⁰ = 1`; `t/4 ≤ Δ₂ = t` | Pass; block determinant gives `λ^{2k} μ² b((T−L)x) det(BTA)`, maximum at `λ² = k/(k+1)` |
| 1.3 (S5′) ⇒ (S5), new *Needs:* | `𝕜 = ℚ₂`, `n = 0, 1` | rank of `ℓ₂^{n+1}` through `WithLp.linearEquiv` and `rank_fin_fun`: `1 > 0`, `2 > 1`; neither lemma needs `RCLike` | Pass |
| 1.24 Kolmogorov numbers surjective (sampled) | `Q : ℓ₂² → ℝ` a coordinate projection, `T = id_ℝ` | `d₀(TQ) = ‖Q‖ = 1 = d₀(T)`; `d₁ = 0` on both sides | Pass; Pietsch 1974, Theorem 5.1 states it (pietsch1974 lines 238–240) |
| 3.3 combined bound, locator | `n = 0`; source's one-based proof | `a₀ ≤ c₀`, factor `1`; projection of norm `(n−1)^{1/2}` gives `1 + (n−1)^{1/2}`, zero-based `1 + √n` | Pass; pietsch1974 lines 468–488 |
| 3.20 first bound, locator | `N = 2, n = 1`; `N = 3, n = 1` | `(1,1)`: ratio `1/√2`; codimension `1 < 2` leaves fewer than `2` coordinates of modulus `< 1`, so at least `2` of modulus `1` | Pass; Pietsch 1974, Lemma 7.1 (line 344); blueprint lines 199–213 |
| 5.4 same exponent, locator | `diag(3,1)`, `n = 0, 1` | `s = (3, 1)` for every strict sequence | Pass; Pietsch 1974, Theorem 7.1 (line 321) |
| 5.6 reverse regime, locator | `σ = (2,1)`, `q = 1`, `p = 2`, `n = 1` | bound `|σ₁| = 1`; tail norm `1` | Pass; blueprint Theorem 8.6 (lean-snumbers lines 898–900) |
| 5.11 Hilbert numbers of `I`, locator | `n = 0, 1` | `h₀ = ‖I‖ = 1`, `h₁ = 1/2` | Pass; blueprint Corollary 8.14 (line 1046) |
| 5.13 constant, wording | BanachSpaceTheory B6 on main | `κ_ℝ = 8`, `κ_ℂ = 16`, "no optimality claim" (its README lines 1238, 1255) | Pass |

The rows of the previous review, of `2322e11`, stand for every statement this change does not touch. Of the seeded sample only §1.24 lies in a changed passage; §1.1, §1.7, §1.8, §1.16, §2.10, §3.11, §3.12, §3.17, §3.18, §3.21, §4.4, §5.1, §5.2, §5.10 are unchanged since that review.

- Source locators read at the text: 17. Pietsch 1974, Theorems 4.1, 4.5, 4.6, 5.1, 7.1, 8.1, 8.4 and Lemma 7.1 (pietsch1974 lines 160–162, 178–180, 205–206, 238–240, 321–325, 421–425, 468–488, 344–348); Ullrich 2026, §1 and §2 (ullrich2026 lines 43–46, 111–123) and the proof of Lemma 4 (lines 356–402); blueprint, Theorems 6.8, 4.2, 8.6, 8.10, Lemma 7.9, Proposition 3.12, Corollary 8.14 and the proof of Theorem 3.4 (lean-snumbers lines 522, 399, 898, 986, 712, 364, 1046, 199–213). Pietsch 1980, 12.3.1 (§4.13) only at second hand, through ullrich2026 lines 244–245.
- Library declarations opened at the pins: `rank_fin_fun` (`Mathlib/LinearAlgebra/Dimension/Constructions.lean:316`), `WithLp.linearEquiv` (`Mathlib/Analysis/Normed/Lp/WithLp.lean:236`), `exists_dual_vector''` (`Mathlib/Analysis/Normed/Module/HahnBanach.lean:85`), `singularValue_le_nnnorm_sub` (`TauCeti/Analysis/OperatorIdeal/ApproximationNumber/Basic.lean:89`), `TauCeti.HasMinMaxLowerBound.of_completeSpace` (`…/ApproximationNumber/MinMax.lean:460`, target only `SeminormedAddCommGroup` with an inner product).
- Cross-roadmap citations resolved on main: BanachSpaceTheory B4, B6, B7. OperatorIdeals on main and its open revision leave the other s-number sequences and the entropy numbers to this roadmap.
- Automatic checks: all passed on this head when run again; none set aside. Dependency check: `depcheck: 200 roadmaps, 2195 edges, 0 problem(s)`. No file outside the roadmap folder is changed.
- Elaboration of `Suggested.lean`: 56 `sorry` warnings and the one `#check`, nothing else. One-tactic probe (`simp`, `rfl`, `infer_instance`, `aesop`) on the two changed theorems: neither closes.
- Signatures: `#check @name` on every declaration of the base file and of the head; 64 elaborated types agree up to the renaming `approximationNumber` → `singularValue`, and the others differ exactly as the description says (three hypotheses dropped, `dualOp` and `L2` inlined, four declarations removed).
- Description against the head: 21 Checks counted; the label mapping, the removed, renamed and restated declarations, the import, the locator changes and the three corrected passages agree. Nothing to correct.

Overlap check: read OperatorIdeals (main and its open revision), BanachSpaceTheory (main); nothing shared. OperatorIdeals owns the approximation numbers and assigns the remaining s-number sequences and the entropy numbers to SNumbers; BanachSpaceTheory owns the Schmidt series, Grothendieck's theorem and the projection theorems, consumed here through B4, B6, B7.

Source independence: changed passages only; 17 passages compared with 3 sources (pietsch1974, ullrich2026, lean-snumbers), none shared; largest share pietsch1974, 26 of 77 locators; no layer added, removed or reordered, so the contents comparison of the previous review (independent) stands. Pietsch 1987, Pietsch 1980 and Carl–Stephani 1990 could not be read.

Research link: Layers 3 and 5 state the maximal difference theorem `aₙ ≤ e(n+1)hₙ` of Ullrich (2026, Theorem 1) and its sharpness, which settles conjectures of Mityagin–Henkin (1963) and Carl–Pietsch on bounds between s-numbers; Layers 1–2 are Pietsch's axiomatic theory (1974). Rests on the ullrich2026 and pietsch1974 texts.

## Not verifiable

- Pietsch 1980 (*Operator Ideals*): no open copy; the new locator 12.3.1 of §4.13 is confirmed only at second hand (ullrich2026 lines 244–245).
- Pietsch 1987 and Carl–Stephani 1990: no open copy; their locators are in passages this change does not touch.

## Source issues

- **Misprint** in ullrich2026 at the proof of Lemma 4, printed page 9: the source says the new coordinate τ of the bordered operator is real; it should be a scalar of the field 𝕂, so that the operator is defined on all of ℓ₂^{n+1} over ℂ; affects nothing.

## For the human reviewers

- Licence: `Suggested.lean` line 2 reads "Copyright (c) 2026 Mario Ullrich", Apache 2.0, and README sentences (for example in §1.17 and §3.20) run close to the Apache-2.0 Lean-SNumbers blueprint; all are already on main, committed there by Mario Ullrich.
- Not tested: Pietsch 1987, Pietsch 1980 and Carl–Stephani 1990 could not be read, so their 25 locators and the wording beside them were not compared with the texts.
