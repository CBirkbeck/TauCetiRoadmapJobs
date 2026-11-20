# Review of SNumbers (pull request #2648 at 2322e11)

**Verdict:** accepted

**Summary.** Accepted: there are no findings. Every statement, Check and worked example I recomputed holds, the Lean signatures carry the hypotheses the README states, and `Suggested.lean` elaborates with `sorry` as its only warning; none of its 56 theorems closes with one tactic. There are six small corrections, none blocking: four locators credit a source with a claim it does not make, a group of targets carries no locator, the route sketched for §3.7 does not work as written, 8 and 16 are called "the Grothendieck constant", §1.3 cites a lemma that needs `RCLike`, and §2.2–§2.3 assume a completeness they do not use. There are two format notes. One licence question is left for the human reviewers.

## C01 — Four locators cite a source for a claim the source does not make

A reader who opens these citations finds a different or weaker statement. I read each source at the place cited.

- **§1.2 (line 124).** "(Pietsch 1974)" is attached to the axiom list whose (S5) is the identity of `ℓ₂^{n+1}`. Pietsch 1974, §1, pp. 202–203 (pietsch1974 line 40) normalises on every space of dimension at least `n` (one-based): that is (S5′) of §1.3. The Euclidean form, zero-based, is in Ullrich 2026, §2, p. 3 (ullrich2026 lines 113–123).
- **§1.17 (line 299).** "Theorems 4.5, 4.6": strictness is Theorem 4.5, p. 207 (pietsch1974 lines 178–180). Theorem 4.6, p. 208 (line 205), says that the Bernstein numbers are the smallest injective s-numbers, which is §2.12; moving it there gives §2.12 its theorem number. The same pair is in the docstring of `isStrictSNumberSequence_bernstein`.
- **§5.6 (line 928).** "(Pietsch 1974, §7)": in the regime of §5.6, source exponent at most the target exponent, that section says that `aₙ`, `cₙ`, `dₙ` seem to be unknown (p. 215, pietsch1974 lines 390–392). The bound `sₙ(D_σ) ≤ |σₙ|` is true by the truncation of §2.1 (the tail has norm `max_{k ≥ n} |σ_k| = |σₙ|`), and it is stated in the Lean-SNumbers blueprint, Theorem 8.6, p. 32.
- **§5.11 (line 970).** The equality `hₙ(I) = 1/(n+1)` is credited to Ullrich 2026, which gives only the order `hₙ(I) ≍ 1/(n+1)`, citing another paper (p. 5, ullrich2026 line 206). The equality is the blueprint's Corollary 8.14, p. 37, and the two-sided argument written in §5.11 proves it.

## C02 — Several targets carry no locator

An implementer cannot tell where the hypotheses of these statements were checked. For each of the following I confirmed that the statement as written is supported at the place given:

- §1.13 and §1.24: Pietsch 1974, Theorem 5.1, p. 209 (real or complex Banach spaces).
- §1.23: Pietsch 1974, Theorem 4.1, p. 206.
- §2.2: Lean-SNumbers blueprint, Theorem 6.8, p. 20.
- §2.4: Ullrich 2026, p. 2 (ullrich2026 lines 43–46); blueprint, Theorem 4.2, p. 14.
- §3.3: Pietsch 1974, Theorem 8.4, p. 218, whose proof gives the factor `1 + √(n−1)` in one-based indexing.
- §3.5: blueprint, Lemma 7.9, p. 26.
- §3.19: blueprint, Proposition 3.12, p. 13.
- §3.20: blueprint, proof of Theorem 3.4, pp. 8–9; the extreme-point lemma is Pietsch 1974, Lemma 7.1, p. 214.
- §5.4: Pietsch 1974, Theorem 7.1, p. 213.
- §5.9: blueprint, Theorem 8.10, p. 35.

For §5.14 I found no statement in the three texts I could read; its derivation from §5.13 is correct (the numbers are in the table kept with this report), so "derived here from §5.13" would be an accurate attribution. Two citations would gain a theorem number: §2.11 is Pietsch 1974, Theorem 8.1, p. 217. The chapter-level citations of Pietsch 1987 could be sharpened to 2.3.4 (§2.1), 2.6.3 (§2.4) and 2.11.9 (§2.3), and §4.13 to Pietsch 1980, 12.3.1: these numbers are the ones Ullrich 2026 cites (lines 46, 131, 244); I could not open the books themselves.

## C03 — The route of §3.7 borders by the wrong approximant

The sketch (lines 574–577) borders an admissible pair by a vector "on which a near-best rank-`k` approximant of `T` is far from `T`", and its *Needs:* line names `exists_rank_le_nnnorm_sub_lt`. An implementer who follows it gets nothing: the bordered determinant of §3.6 evaluates to `λ^{2k} μ² · b((T − L)x) · det(B T A)` only for `L = T A (B T A)⁻¹ B T`, the rank-`k` operator that the pair `(A, B)` itself determines, and the estimate uses only `‖T − L‖ ≥ a_k(T)`.

A case: `T = id` on `ℓ₂²`, `k = 1`, `A = e₁`, `B` the first coordinate. `L* = diag(0, 1)` is a best rank-one approximant (`‖id − L*‖ = 1 = a₁`); `id − L*` is largest at `e₁`, and bordering by `e₁` gives determinant `0`. Bordering by `e₂`, the vector for `L = diag(1, 0)`, gives `1/4`, the required value. Ullrich 2026, proof of Lemma 4, pp. 8–9 (ullrich2026 lines 358–421), proceeds with this `L`. The repair is to name `L = T A (B T A)⁻¹ B T` for a pair with `det(B T A) ≠ 0`; the *Needs:* line would then cite `singularValue_le_nnnorm_sub` and `exists_dual_vector''`.

## C04 — 8 and 16 are not the Grothendieck constant

Lines 985–986 call `κ_𝕜` "the Grothendieck constant of BanachSpaceTheory B6 (`κ_ℝ = 8`, `κ_ℂ = 16`)". A reader takes that for the optimal constant, which is below 2. BanachSpaceTheory B6 calls them "finite universal constants" and says they "carry no optimality claim". "The constant `κ_𝕜` with which B6 proves Grothendieck's theorem (8 over `ℝ`, 16 over `ℂ`)" would be accurate; the module docstring of `Suggested.lean` (line 25, "the constant as Grothendieck's") would say the same.

## C05 — §1.3 cites a lemma that holds only over `RCLike`

§1.3 is over any nontrivially normed field, but its *Needs:* line (line 146) cites `finrank_euclideanSpace`, which at the Mathlib pin stands under `[RCLike 𝕜]` (`Mathlib/Analysis/InnerProductSpace/PiL2.lean`, lines 72 and 220). Over a general field the rank of `EuclideanSpace 𝕜 (Fin (n+1))` comes from `WithLp.linearEquiv` with `Module.finrank_fin_fun`, both already in the supplier contracts.

## C06 — §2.2 and §2.3 assume the target Hilbert space complete, and their route does not use it

The scalar factorization and uniqueness are stated for complete `H₁` and `H₂` (lines 402, 413, and the Lean signatures). The input, `TauCeti.HasMinMaxLowerBound.of_completeSpace`, asks completeness of the source only (`MinMax.lean`, line 460), as the supplier contract itself says, and the orthogonal projection onto the finite-dimensional `T(V)` exists in any inner product space. With `H₂` incomplete the route goes through unchanged: `B := c • (T A)⁻¹ ∘ P_{T(V)}` has norm at most `c/c′ < 1`. The hypothesis on `H₂` would be dropped in §2.2 and §2.3; §2.10 needs it, through the compactness criterion.

## N01 — The numbering of Layer 1 skips §1.6

Layer 1 goes from §1.5 to §1.7, so a reader looks for a section that is not there. Keeping the gap so that the former labels map one to one is reasonable; a clause in the layer's opening paragraph saying so would do.

## N02 — `Additive` and `Multiplicative` shadow Mathlib's type tags

Inside `TauCetiRoadmap.SNumbers` (`Suggested.lean`, lines 416 and 422) these names hide Mathlib's `Additive α` and `Multiplicative α` for any code that opens the namespace. `IsAdditive` and `IsMultiplicative` would avoid it.

## Earlier findings

The previous review, of this same head, had no findings. Its five small corrections and two format notes are all still present, since the text is unchanged: they are C01–C05 and N01–N02 above. C02 is extended by the targets of this round's sample, and C06 is new.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result; change |
|---|---|---|---|
| 1.1 s-number families | Lean `SNumberFamily`; Pietsch 1974 §1 | one universe `u`, `ℝ≥0`-valued; source: map from all operators to nonnegative sequences (pp. 202–203) | Pass |
| 1.2 axioms | `id` on `ℓ₂²`; one-based (S5) | `s = (1, 1, 0)`; one-based reading forces `s₂ = 1` against (S4) `s₂ = 0` | Pass; locator C01 |
| 1.17 Bernstein strict | `id: ℓ₂² → ℓ∞²`; `X = 0`; rank `T ≤ n` | `b = (1, 1/√2, 0)`; empty supremum `0`; kernel meets every `(n+1)`-space, gain `0` | Pass; Pietsch Thm 4.5 only (C01) |
| 1.18 Hilbert numbers | `id` on `ℓ₂^{n+1}`; `X = 0`; rank-one `T` | projection/embedding give `aₙ = 1`; only `A = 0`, `h = 0`; `h₀ = ‖φ‖‖y‖` | Pass; ullrich2026 lines 171–173 has this definition |
| 2.4 `hₙ ≤ sₙ` | `diag(3,1)`; `I: ℓ₁ → ℓ∞`, `n = 2` | `h = s = (3,1,0)`; `h₂ = 1/3 ≤ c₂ = 1/2` | Pass; no locator (C02) |
| 2.9 compactness | `diag(1/(k+1))`; `id_{ℓ₂}`; `𝔽₂(u)((t))` | `cₙ = dₙ = 1/(n+1) → 0`; `cₙ = dₙ = 1`; `d₁ = 0` but not compact | Pass; Pietsch Thm 9.3, p. 220, for Banach spaces |
| 3.3 combined bound | `n = 0`; `id: ℓ₂² → ℓ∞²`, `n = 1` | `a₀ = c₀ = d₀`; `a₁ = 1/√2 ≤ 2 · 1/√2` | Pass; no locator (C02) |
| 3.4 determinant quantities | `diag(1,t)`; `k = 0`; no norm constraint | `Δ₁ = 1`, `Δ₂ = t`; `Δ₀ = 1` (empty determinant); supremum infinite | Pass; ullrich2026 lines 249–255 |
| 3.7 lower recursion | `k = 0`; `diag(1,t)`, `k = 1`; `id` on `ℓ₂²` | `a₀ · 1 ≤ Δ₁ = ‖T‖`; `t/4 ≤ t`; route by `L*`: `0`, by `L`: `1/4` | Statement pass (Lemma 4, constant `nⁿ/(n+1)ⁿ⁺¹`); route C03 |
| 3.8 upper recursion | `diag(1,t)`, `n = 1` | `Δ₂ = t ≤ h₁ Δ₁ = t · 1` | Pass, equality; Ullrich Lemma 3 |
| 3.9/3.10 maximal difference | `n = 0, 1, 2`; `I`, `n = 1` | factors `1, 4, 27/4` against `e(n+1) ≈ 2.72, 5.44, 8.15`; `a₁(I) = 1/2 ≤ 4 · 1/2` | Pass; `0⁰ = 1` in Lean's `ℝ` |
| 3.11 any two sequences | `s = a`, `t = h` on `I`, `n = 2` | `1/2 ≤ 3e · 1/3 = e` | Pass |
| 3.12 `max(c,d) ≤ e(n+1) b` | `id: ℓ₂² → ℓ∞²`, `n = 0, 1` | `1 ≤ e`; `1/√2 ≤ 2e/√2` | Pass; ullrich2026 eq. (3), lines 216–221; conjecture lines 47–50 |
| 3.13 `dₙ(T′) = cₙ(T)` | `diag(3,1)`; `V = 0` | both `(3,1,0)`; `n = 0`: `‖T′‖ = ‖T‖` | Pass; Pietsch Thm 6.2, p. 211; no completeness used |
| 3.14 `cₙ(T′) ≤ dₙ(T)` | `diag(3,1)`; `n = 0` | `(3,1,0) ≤ (3,1,0)`; `‖T′‖ ≤ ‖T‖` | Pass; Pietsch p. 212, lines 298–299 |
| 3.15 compact duality | `diag(1/(k+1))` on `ℓ₂` | `cₙ(T′) = dₙ(T) = 1/(n+1)` | Pass; Pietsch Thm 6.3 |
| 3.20 Bernstein of identities | `N = 2, n = 1`; `N = 3, n = 1`; `ℂ` | first: `1/√2`, attained; second bound `√(3/2)`; extreme-point step works over `ℂ` | Pass; no locator (C02) |
| 3.21/3.22 | dims 3 and 71 | `√(3/2) · 1/√2 = 0.866 < 1`; `1/6 + √71/54 = 0.3227 < 1/3` | Pass |
| 4.2 monotone, `e₀ = ‖T‖` | `id_ℝ`; `ℚ₂` with `(3/2)|x|₂` | `e₀ = 1`; `e₀ = 3/4 < 1 = ‖id‖` | Pass; Carl–Stephani unread, blueprint Prop. 10.2, 10.5 |
| 4.4 multiplicativity | `ℚ₂` with `(3/2)|x|₂`, `B = S = id` | `e₀(id∘id) = 3/4 > 9/16 = e₀(id)²` | Pass; density is needed and present |
| 4.6 entropy and compactness | `id_{ℓ₂}`; `diag(1/(k+1))` | `eₙ ≥ 1/2`; `eₙ → 0` | Pass; Tau Ceti lemmas need no `RCLike` |
| 4.5 `eₙ > 0` | `id_ℝ` | `eₙ = 2⁻ⁿ = ‖x‖/2ⁿ`, attained | Pass |
| 4.11 `max(c,d) ≤ (n+1) eₙ` | `id_ℝ`, `n = 0`; `id_{ℝ²}`, `n = 1` | `1 ≤ 1`; `1 ≤ 2 e₁`, `e₁ ≥ 1/√2` | Pass |
| 4.14 entropy bound | `id_ℝ`, `n = 0, 1` | `1 ≤ 2e`; `0 ≤ 4e · 1/2` | Pass |
| 2.1/2.3/2.5 | `diag(3,1)`; zero map | `s = a = σ = (3,1,0)`; `0 = 0` | Pass; `H₂` completeness unused (C06) |
| 5.6 reverse regime | `σ = (2,1)`, `q = 1`, `p = 2`, `n = 1`; `σ = (0,1)` | tail norm `1 = |σ₁|`; unordered: `a₀ = 1 > 0` | Pass; locator C01 |
| 5.10 `1/2 ≤ cₙ(I) ≤ 1` | `n = 0`; `n = 1`, `M = ker(e₀* − e₁*)` | `c₀ = 1`; `e₀ + e₁`: ratio `1/2`; Ullrich: `cₙ = 1/2`, `n ≥ 1` | Pass; ullrich2026 line 204 |
| 5.11/5.12 | `n = 0, 1, 2` | `h = 1, 1/2, 1/3` from `(n+1)^{-1/2} id` twice; `(n+1)/2 · hₙ = 1/2 ≤ cₙ` | Pass; locator C01 |
| 5.13 | `κ_ℝ = 8`, `n = 64`, `m = 65` | lower `65^{-1/2} = 0.124`; upper `8/√65 = 0.9923 < 1` | Pass; wording C04 |
| 5.14 not multiplicative | `κ = 8`, `n = 8192`, `m = 16385` | `8193² = 67125249 > 67112960 = 8⁴ · 16385`; `h₁₆₃₈₄ ≥ 16385^{-1/2} > 64/8193 ≥ h₈₁₉₂²` | Pass; no source found (C02) |
| 1.3 Needs | `finrank_euclideanSpace` at pin | under `[RCLike 𝕜]`; §1.3 is over any nontrivially normed field | C05 |
| 1.13, 1.14 controls | `ℚ`, `X = ℝ` | `d₁(id) = 0` with rank `𝔠`; `a₁(Q_X) = 1` | Pass; `[CompleteSpace 𝕜]` in both Lean statements |

- Source locators: 15 sampled targets. Read at the text: pietsch1974 (pp. 202–221), ullrich2026 (pp. 2–10), lean-snumbers (pp. 4–47). Eleven sampled targets cite a locator; eight were read at it (1.1, 1.17, 2.9, 3.4, 3.7, 3.12, 3.14, 5.10), 1.18 cites Pietsch 1987 and 4.2, 4.6 Carl–Stephani, unread; four carry none (2.4, 3.3, 3.20, 5.14).
- Library declarations opened at the pins: 38 Tau Ceti names located, hypotheses read for `singularValue` (`Basic.lean:77`), `singularValue_id` (`MinMax.lean:139`), `le_singularValue_of_lt_rank` (`:105`), `HasMinMaxLowerBound.of_completeSpace` (`:460`), the two compactness lemmas (`Compact/Basic.lean:95`, `:102`), `norm_precomp` (`Dual/Functoriality.lean:81`), `quotientAnnihilatorEquivDual` (`Dual/Submodule.lean:78`); 20 Mathlib names located, mismatch only C05.
- Cross-roadmap citations: BanachSpaceTheory B4 (Schmidt series, main line 299), B6 (`κ_ℝ = 8`, `κ_ℂ = 16`, lines 1238–1259), B7 (both projection theorems, for normed `𝕜`-spaces, lines 1309–1313); OperatorIdeals and PolarDecomposition are on main. All resolve.
- Automatic checks: all passed; none set aside. Dependency check: `depcheck: 200 roadmaps, 2195 edges, 0 problem(s)`.
- Elaboration of a copy of `Suggested.lean`: 56 `sorry` warnings and the one `#check`; no other diagnostic. One-tactic probe (`rfl`, `simp`, `infer_instance`, `norm_num`, `positivity`, `exact?`): none of the 56 closes.
- Signatures: the 76 elaborated types were compared with the README statements; no `def` or theorem lost a binder, and the field hypotheses (`CompleteSpace 𝕜`, `DenselyNormedField`, `RCLike`) agree with Convention 5.
- Duplication: neither pin has Gelfand, Kolmogorov, Bernstein, Hilbert or entropy numbers or the s-number axioms; no other roadmap, on main or open, states them.
- Pull request description against the head: 21 Checks counted; label mapping, removed and renamed declarations, imports and supplier names agree. Nothing to correct.

Overlap check: read OperatorIdeals (main and its open revision), BanachSpaceTheory (main); nothing shared. OperatorIdeals owns the approximation numbers and assigns the other s-number sequences and the entropy numbers to SNumbers; BanachSpaceTheory owns duality, the Schmidt series, Grothendieck's theorem and the projection theorems, consumed here through B1, B4, B6, B7.

Source independence: 29 passages compared with 3 sources (pietsch1974, ullrich2026, lean-snumbers); none shared with pietsch1974 or ullrich2026; several sentences shared with lean-snumbers (longest run about 11 words), all already in the README on main, which the blueprint's author contributed; largest share pietsch1974, 18 of 51 locators; contents compared with pietsch1974 §§0–9 and the blueprint's chapters 1–11: independent (Layer 1 merges Pietsch §§1, 3, 4, 5; duality sits in Layer 3; entropy and `ℓ₁^m` have no counterpart). Pietsch 1987, Pietsch 1980 and Carl–Stephani 1990 could not be read.

Research link: Layers 3 and 5 state the maximal difference theorem `aₙ ≤ e(n+1)hₙ` of Ullrich (2026, Theorem 1) and its sharpness, which settles conjectures of Mityagin–Henkin (1963) and Carl–Pietsch on bounds between s-numbers; Layers 1–2 are Pietsch's axiomatic theory (1974). Rests on the ullrich2026 and pietsch1974 texts.

## Not verifiable

- Pietsch 1987 (*Eigenvalues and s-Numbers*): no open copy; locators in §1.7, §1.18, §1.20, §2.1, §2.3, §3.1, §3.2 unread (Ullrich 2026 confirms 2.3.4 and 2.6.3 at second hand).
- Pietsch 1980 (*Operator Ideals*): no open copy; locators in §1.21, §1.22, §3.16, §4.1, §4.5, §4.10, §4.11 unread (Ullrich 2026 confirms 12.3.2 at second hand).
- Carl–Stephani 1990: no open copy; its nine chapter-level locators in Layers 2 and 4, among them the sampled §4.2 and §4.6, are unread. The statements were checked by computation and against the blueprint, Propositions 10.2, 10.5 and Theorem 10.7.
- Pietsch 2008, Garling–Gordon 1971, Kadets–Snobar 1971, Mityagin–Henkin 1963 and Ullrich 2024 beyond its Remark 1 were outside the sample.

## Source issues

- **Misprint** in ullrich2026 at the proof of Lemma 4, printed page 9: the source says the new coordinate τ of the bordered operator is real; it should be a scalar of the field 𝕂, so that the operator is defined on all of ℓ₂^{n+1} over ℂ; affects nothing.

## For the human reviewers

- Licence: `Suggested.lean` line 2 reads "Copyright (c) 2026 Mario Ullrich", Apache 2.0, and README sentences (lines 327–328, 449–452, 699–702) match the Apache-2.0 Lean-SNumbers blueprint; all are already on main, committed there by Mario Ullrich.
- Not tested: Pietsch 1987, Pietsch 1980 and Carl–Stephani 1990 could not be read, so their 20 locators and the wording beside them were not compared with the texts.
