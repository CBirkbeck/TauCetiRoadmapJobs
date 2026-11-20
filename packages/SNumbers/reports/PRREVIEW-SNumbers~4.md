# Review of SNumbers (pull request #2648 at 2322e11)

**Verdict:** accepted

**Summary.** Accepted. There are no findings. Every statement, Check and worked example I computed holds, and the hypotheses in the Lean signatures match the README. `Suggested.lean` elaborates with only `sorry` warnings, and none of its 56 theorems closes with one tactic. There are five small corrections, none blocking: four locators credit a source with a claim it does not make; seven targets still carry no locator; the route sketched for §3.7 cannot work as written; the constants 8 and 16 are called "the Grothendieck constant"; and §1.3 needs a lemma that holds only over `RCLike`. There are also two format notes. The human reviewers are asked to decide how the roadmap's wording and Lean names relate to the Apache-2.0 Lean-SNumbers blueprint, whose text overlaps it in several passages.

## C01 — Four locators cite a source for a claim the source does not make

A reader who follows these citations finds a different statement, or a weaker one, at the place cited. I opened each source at the locator.

- **§1.2 (line 124).** The citation "(Pietsch 1974)" is attached to the axiom (S5) on `ℓ₂^{n+1}`. Pietsch 1974, §1, pp. 202–203 (pietsch1974 line 40), normalises differently: `sₙ(I_E) = 1` for every space with `dim E ≥ n`, counting from one. That is the strict axiom (S5′) of §1.3, not (S5). The Euclidean form appears in ullrich2026 §2, p. 3 (line 123) and lean-snumbers Definition 2.1, p. 4.
- **§1.17 (line 299).** The citation "Theorems 4.5, 4.6" includes Theorem 4.6, which says the Bernstein numbers are the smallest injective s-numbers (p. 208, pietsch1974 line 205). That is the content of §2.12. Strictness is Theorem 4.5 alone (p. 207). Moving 4.6 to §2.12 fixes both sections.
- **§5.6 (line 928).** The citation "(Pietsch 1974, §7)" points to a section that says the numbers aₙ, cₙ and dₙ seem to be unknown in exactly this exponent range, where the target exponent exceeds the source exponent (p. 215, pietsch1974 line 390). The README's upper bound is still true: it follows from the truncation step in the proof of Theorem 7.1. lean-snumbers Theorem 8.6, p. 32, states it as written.
- **§5.11 (line 970).** The equality `hₙ(I) = 1/(n+1)` is credited to Ullrich 2026. That paper gives only the order, `hₙ(I) ≍ 1/(n+1)`, and cites Heinrich–Linde 1984 for it (p. 5, ullrich2026 line 206). The equality is lean-snumbers Corollary 8.14, p. 37, and the README's own two-sided argument proves it.

## C02 — Seven targets still carry no locator

This is the part of the previous review's locator finding that remains. An implementer cannot tell where the hypotheses of these statements were checked. For each one I confirmed that the statement as written is supported at the locator given here:

- §1.13: Pietsch 1974, Theorem 5.1, p. 209 (real or complex Banach spaces); lean-snumbers Theorem 3.8, p. 10, for a complete field.
- §1.23: Pietsch 1974, Theorem 4.1, p. 206.
- §2.2: lean-snumbers Theorem 6.8, p. 20.
- §3.5: lean-snumbers Lemma 7.9, p. 26.
- §3.19: lean-snumbers Proposition 3.12, p. 13.
- §5.4: Pietsch 1974, Theorem 7.1, p. 213.
- §5.9: lean-snumbers Theorem 8.10, p. 35.

Two existing citations would also gain a theorem number: §2.11 is Pietsch 1974, Theorem 8.1, p. 217, and §2.12 is Theorem 4.6, p. 208.

## C03 — The route of §3.7 borders by the wrong approximant

The sketch at lines 574–577 says to border the pair by a vector "on which a near-best rank-`k` approximant of `T` is far from `T`", and its *Needs:* line names `exists_rank_le_nnnorm_sub_lt`. An implementer who follows this gets nothing. The bordered determinant of §3.6 evaluates to `λ^{2k} μ² · b((T − L)x) · det(BTA)` only for the operator `L = T A (B T A)⁻¹ B T` that the pair `(A, B)` determines. The estimate then uses only `‖T − L‖ ≥ a_k(T)`, which holds because `L` has rank at most `k`.

A concrete case: `T = id` on `ℓ₂²`, `k = 1`, with the pair `A = e₁` and `B` the first coordinate. Here `L* = diag(0, 1)` is a best rank-one approximant, since `‖id − L*‖ = 1 = a₁`. The vector on which `id − L*` is largest is `x = e₁`, and bordering by `e₁` gives determinant 0. Bordering by `e₂`, the vector for `L = diag(1, 0)`, gives the required `1/4`.

The fix is to name `L = T A (B T A)⁻¹ B T` for an admissible pair with `det(B T A) ≠ 0` in the route, as lean-snumbers Lemma 7.11, pp. 26–27, does. The *Needs:* line would then cite `singularValue_le_nnnorm_sub` and `exists_dual_vector''` instead of `exists_rank_le_nnnorm_sub_lt`.

## C04 — 8 and 16 are not the Grothendieck constant

Lines 985–986 call `κ_𝕜` "the Grothendieck constant of BanachSpaceTheory B6 (`κ_ℝ = 8`, `κ_ℂ = 16`)". A reader will take this as the optimal constant, which is below 2. BanachSpaceTheory B6 calls 8 and 16 "finite universal constants" and says they "carry no optimality claim". Saying "the constant `κ_𝕜` with which B6 proves Grothendieck's theorem (8 over ℝ, 16 over ℂ)" would be accurate. The module docstring of `Suggested.lean` (line 25) could say the same.

## C05 — §1.3 needs a lemma that holds only over `RCLike`

§1.3 works over any nontrivially normed field, but its *Needs:* line (line 146) cites `finrank_euclideanSpace`. At the pin that lemma requires `[RCLike 𝕜]`, so it does not apply here. The rank of `EuclideanSpace 𝕜 (Fin (n+1))` over a general field comes from `WithLp.linearEquiv` together with `Module.finrank_fin_fun`, both already named in the supplier contracts.

## N01 — The numbering of Layer 1 skips §1.6

Layer 1 jumps from §1.5 to §1.7, so a reader may look for a §1.6 that does not exist. No other roadmap cites these sections, so renumbering §1.7–§1.24 would be safe. Keeping the gap so that the old labels still map one-to-one is also reasonable.

## N02 — `Additive` and `Multiplicative` shadow Mathlib's type tags

Inside `TauCetiRoadmap.SNumbers` (lines 416 and 422), these names hide Mathlib's `Additive α` and `Multiplicative α`. Code that opens the namespace then has to write `_root_.Additive`. A more specific name, such as `IsAdditive`, would avoid this.

## Earlier findings

- **Most targets had no claim-level locator.** Partly repaired. Most targets now cite at the claim, for example §1.9 "(Pietsch 1974, §4)", §2.9 "(Pietsch 1974, Theorem 9.3)" and §3.1 "(Pietsch 1987, 2.10.2)". The seven targets in C02, and §5.1–§5.3, §5.5 and §5.7–§5.8, still have none.
- **The README and the Lean file kept the catalogue shape.** Repaired. Layers 1–5 now have numbered prose sections with *Needs:* lines and close with Examples and Dependencies. `diagOp` is named at §5.4 (line 908). The Lean section comments follow the README order (lines 40, 240, 322, 459, 542), and the module docstring is titled "…: target signatures" (line 11).

## Verified sound

| Statement | Instances tried | Values computed on each side | Result; change |
|---|---|---|---|
| 1.2 axioms (S1)–(S5) | `id` on `ℓ₂²`; Pietsch 1974 (5) | `s = (1, 1, 0)`; one-based (S5) forces `s₂ = 1` against (S4)'s `s₂ = 0`; Pietsch 1974 normalises on every `E` with `dim E ≥ n` | Pass; locator C01 |
| 1.8 Gelfand numbers | `diag(2,1)` on `ℓ₂²`; dimension variant | `c = (2, 1, 0)`; on line θ the norm is `√(4cos²θ+sin²θ) ≥ 1`; variant gives `c₀ = 0 ≠ 2` | Pass (Pietsch 1974 p. 206, codim < n one-based) |
| 1.13 Kolmogorov strict | ℝ, `X = ℓ₂`, n = 3; ℚ, `X = ℝ`, n = 1 | Riesz gives `‖π_V‖ ≥ r` for all r < 1, so `d₃ = 1`; over ℚ `d₁(id) = 0` though rank is 𝔠 | Pass; `[CompleteSpace 𝕜]` in Lean; C02 |
| 1.16 Bernstein numbers | `id: ℓ₂² → ℓ∞²`; sup variant | `b = (1, 1/√2, 0)`, attained at (1,1); sup variant gives `b₁ = 1 = ‖id‖` | Pass (Pietsch 1974 p. 207) |
| 1.23 Gelfand injective | `J: ℝ → ℓ∞²`, t ↦ (t,0); T = 3·id | `c(JT) = (3, 0, …) = c(T)` | Pass; C02 (Pietsch 1974 Thm 4.1) |
| 2.2 scalar factorization | `diag(3,1)`, n = 1, c = 1/2; c = 0 | A = id, B = diag(1/6, 1/2), ‖B‖ = 1/2, BTA = (1/2)·id; c = 0: B = 0 | Pass; completeness of H₂ unused (Tau Ceti needs only H₁) |
| 2.9 compactness, Banach | `diag(1/(k+1))` on ℓ₂; `id_{ℓ₂}`; 𝔽₂(u)((t)) | `cₙ = dₙ = 1/(n+1) → 0`, compact; `cₙ = dₙ = 1`, not compact; `d₁ = 0` yet not compact | Pass; RCLike excludes the third (Pietsch 1974 Thm 9.3, p. 220) |
| 2.11 b ≤ c | `id: ℓ₂² → ℓ∞²`, n = 0, 1 | `b₀ = c₀ = 1`; `b₁ = 1/√2`, `c₁ = min_θ max(\|cos θ\|, \|sin θ\|) = 1/√2` | Pass, equality; Pietsch 1974 Thm 8.1 |
| 3.1 `a ≤ (1+√n) c` | n = 0; `id: ℓ₂² → ℓ∞²`, n = 1 | `a₀ = c₀`; `a₁ = c₁ = 1/√2 ≤ 2/√2` | Pass; Pietsch 1987 unread; lean-snumbers Thm 7.5, p. 25 states it |
| 3.5 `∏ a_k = \|det\|` | `diag(3,1)`; `[[0,1],[0,0]]` | 3·1 = 3 = \|det\|; 1·0 = 0 = \|det\| | Pass; Mathlib `normDet_eq_prod_singularValues` at pin |
| 3.12 `max(c,d) ≤ e(n+1) b` | `id: ℓ₂² → ℓ∞²`, n = 0, 1 | 1 ≤ e; 1/√2 ≤ 2e/√2 ≈ 3.84 | Pass (ullrich2026 eq. (3), p. 5) |
| 3.17 c additive, multiplicative | S = diag(3,0), T = diag(0,1); S = diag(3,1), T = diag(1,2) | `c₁(S+T) = 1 ≤ 0 + 1`; `c₁(ST) = 2 ≤ c₁(S)c₀(T) = 2` and ≤ 3·1 | Pass (Pietsch 1974 Thm 9.5; lean-snumbers Thm 3.6) |
| 3.19 h additive | S = diag(3,0), T = diag(0,1) on ℓ₂², where h = a | `h₁(S+T) = 1 ≤ h₁(S) + h₀(T) = 1`; ≤ 3 + 0 | Pass; C02 |
| 5.9 factored operator | T₁ = T₂ = id_ℝ, n = 0; T₁ = diag(1, 1/2), n = 1; a = −1 | 1 ≤ 1 ≤ 1; 2·½ = 1 ≤ 1.5 ≤ √1.25·√2 ≈ 1.58; ab = −1 < 1, excluded by a ≥ 0 | Pass (lean-snumbers Thm 8.10) |
| 5.10 `cₙ(I) ≥ 1/2` | n = 0; n = 1, M = ker(e₀* − e₁*) | `c₀ = 1`; `e₀ − e₁ ∈ M` has ‖·‖∞/‖·‖₁ = 1/2; Ullrich: cₙ = 1/2 for n ≥ 1 | Pass |
| 2.1/2.4 sandwich | diag(3,1) for a, c, d, b, h; I: ℓ₁ → ℓ∞, n = 2 | all equal (3, 1, 0); h₂ = 1/3 ≤ c₂ = 1/2 ≤ a₂ = 1/2 | Pass |
| 2.3/2.5 Hilbert uniqueness | diag(3,1); zero map | s = (3, 1, 0) = σ; 0 = 0 | Pass |
| 3.9/3.10 maximal difference | n = 0, 1, 2; I, n = 1 | factors 1, 4, 27/4 against e(n+1) ≈ 2.72, 5.44, 8.15; a₁(I) = 1/2 ≤ 4·h₁(I) = 2 | Pass; `0^0 = 1` in Lean's ℝ |
| 3.11 any two sequences | s = a, t = h on I, n = 2 | 1/2 ≤ 3e·(1/3) = e | Pass |
| 3.13/3.15 duality | diag(3,1); T(z) = iz on ℂ | d(T′) = (3, 1, 0) = c(T); dual sends φ(z) = z to iz | Pass; 3.13 also holds for normed spaces, since `(V_⊥)ᗮ = V` for finite-dim V |
| 4.14 entropy bound | id_ℝ, n = 0, 1 | s₀ = 1 ≤ 2e·1; s₁ = 0 ≤ 4e·(1/2) | Pass |
| 4.6 compactness | id_{ℓ₂}; diag(1/(k+1)) | eₙ ≥ 1/2, not compact; eₙ → 0, compact | Pass; holds over any field (Tau Ceti hypotheses checked) |
| 5.11/5.12 sharpness | n = 0, 1, 2 | h = (1, 1/2, 1/3) from A, B = (n+1)^{−1/2}·id; (n+1)/2·hₙ = 1/2 ≤ cₙ | Pass; C01 locator |
| Conv. 5 density for 4.4 | ℚ₂ with ‖x‖ = (3/2)\|x\|₂, B = S = id, m = n = 0 | e₀(id∘id) = 3/4 > e₀(id)² = 9/16 | Pass; the hypothesis is needed |
| 1.14 lifting (Lean) | ℚ, X = Y = ℝ, T = id, n = 1 | d₁ = 0, a₁(Q) = 1 | Pass; `[CompleteSpace 𝕜]` present |
| 1.17, 5.6 locators | Pietsch 1974 Thms 4.5, 4.6; §7, p. 215 | 4.5 is strictness, 4.6 minimality; §7 leaves this exponent range open | C01 |
| 3.7 route | id on ℓ₂², k = 1, pair (e₁, e₁*) | via L = diag(1,0): det = 1/4; via best L* = diag(0,1), x = e₁: det = 0 | C03 |
| 5.13 constant | κ_ℝ = 8, n = 64, m = 65 | 8/√65 ≈ 0.9923 < 1; B6 says 8 and 16 are not optimal | Pass; C04 wording |
| 1.3 Needs | `finrank_euclideanSpace` at pin | requires `[RCLike 𝕜]`; §1.3 works over any nontrivially normed field | C05 |

- Source locators: 15 sampled targets. Nine cite a locator, and eight of those I read at the text (pietsch1974 pp. 202–222, ullrich2026 pp. 2–9, lean-snumbers pp. 4–37). The ninth, §3.1, cites Pietsch 1987, which I could not read; lean-snumbers Theorem 7.5 supports the statement. Six carry no locator (C02).
- Library declarations opened at the pins: 26 in Tau Ceti, all present with the README's hypotheses (e.g. `MinMax.lean:139`, `:460`; `ApproximationNumber/Compact.lean:171`; `Operator/Compact/Basic.lean:95`, `:102`; `EckartYoung.lean:65`; `Dual/Functoriality.lean:81`). I also ran `#check` on 25 Mathlib names; the only mismatch is C05.
- Cross-roadmap citations: BanachSpaceTheory B4 (Schmidt series, main line 299), B6 (κ_ℝ = 8, κ_ℂ = 16, main lines 1236–1259) and B7 (projection theorems, main lines 1309–1315) say what is consumed. The open BanachSpaceTheory revision keeps the ids B1–B7 and both constants. OperatorIdeals assigns the other s-number sequences to this roadmap.
- Automatic checks: all passed, so none were set aside. Dependency check output: `depcheck: 200 roadmaps, 2195 edges, 0 problem(s)`.
- Elaboration: `lake env lean` on a copy of the file gave 56 `sorry` warnings and no other diagnostic. The one-tactic probe (`rfl`, `simp`, `infer_instance`, `norm_num`, `positivity`, each required to close the goal) closed none of the 56. `#check @` of 25 declarations matches the README. No `def` loses a binder.
- Duplication: neither pinned library has Gelfand, Kolmogorov, Bernstein, Hilbert or entropy numbers, or the s-number axioms (the Tau Ceti pin `2fd255d`, 2026-11-04, has no `Operator/SNumbers`). The same-name hits `Additive`, `Multiplicative` and `bernstein` are unrelated Mathlib objects.
- Pull request description: checked against the head. The README has 21 Checks (8 old, 13 new); the labels map to k.n with SN-A06 dropped; the supplier names exist; no other roadmap cites the SN labels. Nothing to correct.

Overlap check: read OperatorIdeals (main and its open revision) and BanachSpaceTheory (main and its open revision). Nothing shared: OperatorIdeals owns the approximation numbers, which this roadmap consumes; BanachSpaceTheory owns duality, the Schmidt series, Grothendieck's theorem and the projection theorems, consumed here through B1, B4, B6 and B7; this roadmap owns the other s-number sequences and the entropy numbers.

Source independence: 26 passages compared with 3 sources (pietsch1974, ullrich2026, lean-snumbers). Wording is shared with lean-snumbers in five passages (longest run 13 words); which text borrowed from which is unsettled, so this goes to the human reviewers. The largest share of locators is pietsch1974, 22 of 64. The layers do not map one-to-one onto pietsch1974 §§1–9 or onto the lean-snumbers table of contents: Layer 1 merges §§1, 3, 4 and 5; entropy and the ℓ₁^m examples have no counterpart; duality sits inside Layer 3. Independent.

Research link: Layers 3 and 5 state Ullrich's theorem `aₙ ≤ e(n+1)hₙ` and its sharpness (Ullrich 2026, Theorem 1, p. 4; pp. 4–5). It settles conjectures of Mityagin–Henkin (1963) and Carl–Pietsch (1978) that ullrich2026 records on p. 2. Based on the ullrich2026 text.

## Not verifiable

- pietsch1987 (*Eigenvalues and s-Numbers*, CUP 1987): no open copy, and the sources service found none. Locators in §1.7, §2.1, §2.3, §3.1 (2.10.2) and §3.2 are unread.
- pietsch1980 (*Operator Ideals*, North-Holland 1980): no open copy. Locators in §1.21, §1.22, §3.16, §4.1, §4.5 and §4.10 are unread; ullrich2026 p. 6 confirms 12.3.2 at second hand.
- Carl–Stephani 1990 (CUP): the publisher copy only, so its locators in Layer 4 are unread.
- Pietsch 2008, Garling–Gordon 1971, Kadets–Snobar 1971, Mityagin–Henkin 1963 and Ullrich 2024 were outside the sample and not fetched.

## Source issues

- **Misprint** in ullrich2026 at the proof of Lemma 4, printed p. 9: the source takes the new coordinate τ real; it should range over the scalar field 𝕂, so that A₀ is defined on all of ℓ₂^{n+1} over ℂ; affects nothing.

## For the human reviewers

- Licence: README lines 225–227, 242–243, 327–328, 390 and 843–846 share wording with the Apache-2.0 Lean-SNumbers blueprint (lean-snumbers lines 277–279, 302–305, 378–379, 1213, 1370–1376). The longest run is 13 words.
- Licence: the blueprint's revisions of 2–3 November 2026 match corrections first made in this roadmap, so I could not settle which text borrowed from which.
- Licence: the header of `Suggested.lean` (line 2) reads "Copyright (c) 2026 Mario Ullrich", Apache 2.0. Several declaration names agree with github.com/mario-ullrich/Lean-SNumbers, e.g. `IsSNumberSequence.abs_sub_le` and `entropyNumber_pos` (lean-snumbers lines 112, 1296).
