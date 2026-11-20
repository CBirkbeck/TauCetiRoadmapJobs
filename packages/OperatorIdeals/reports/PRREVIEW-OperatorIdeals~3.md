# Review of OperatorIdeals (pull request #2614 at 548eeea)
Folder: `TauCetiRoadmap/OperatorTheory/OperatorIdeals/`
**Verdict:** needs changes

**Summary.** Changes are needed, for one missing hypothesis: the last clause of OI-A55 (§1.6), that every nonincreasing sequence in `ℝ≥0` is the approximation-number sequence of a diagonal operator, is stated with no restriction on the field, and it holds over `ℝ` or `ℂ` only; adding those words repairs it. Everything else that was checked holds: the other statements were recomputed on small instances and compared with the pinned declarations, and `Suggested.lean` elaborates with `sorry` as its only warning. There are three small corrections (two carried over from the previous review of this same head) and no format notes. The humans have the roadmap's status and a provenance question to decide.

## R01 (P2) — OI-A55 says every nonincreasing sequence in `ℝ≥0` is the approximation-number sequence of a diagonal operator, without restricting the field; this is false over a non-archimedean field

An implementer reading §1.6 with Convention 1 takes OI-A55 over any nontrivially normed field: the statement involves only norms and rank, the pinned formula `lp.singularValue_diagonalCLM` is indeed stated for `[NontriviallyNormedField 𝕜]`, and the next item (OI-A56) restricts to `ℝ` or `ℂ` only for its last clause. In that generality the final clause of OI-A55 (line 354), "every nonincreasing sequence in `ℝ≥0` arises this way", is false.

Over `𝕜 = ℚ₃` the norms of scalars are `0` and the powers `3ᵏ`, and by the first half of OI-A55 a diagonal operator with nonincreasing magnitudes has `a₀ = |d₀|`. So the sequence `(2, 0, 0, …)` is `a(D)` for no such `D`. The declaration cited for the clause, `lp.exists_singularValue_diagonalCLM_eq`, assumes `[RCLike 𝕜]` (`TauCeti/Analysis/OperatorIdeal/ApproximationNumber/Diagonal.lean`, line 92), and its proof takes `dₙ = cₙ` as a real scalar.

The smallest change: "over `ℝ` or `ℂ`, every nonincreasing sequence in `ℝ≥0` arises this way". The use made of it in §2.4 (the route to OI-B72) is over `ℝ` or `ℂ` already and needs no change.

## C01 — The classical sources are cited by title alone, and the two open targets carry no locator

Carried over; the head is unchanged. Pietsch (8 citations), Gohberg and Kreĭn (6), Simon and Reed–Simon are cited as whole works, for example "(Gohberg and Kreĭn, symmetric norming functions; Mirsky 1960)" in §2.4 (line 584), so a reader cannot find the classical statements. The two targets an implementer will work on, OI-B72 in arbitrary universes (§2.4, line 625) and the block bounds for every family (§2.6, line 756), have no theorem or page locator. No stated result is left unsupported, since every other item names a declaration at the pin. Where the author holds the texts, chapter or theorem locators would close this, at least for faithfulness of the symmetric-gauge construction.

## C02 — The Ullrich citations say "on Banach spaces"; the source works with real or complex Banach spaces

Carried over. In §1.1 (lines 115 and 124–127) the surrounding text is over any nontrivially normed field, so "on Banach spaces" reads as Banach spaces over any complete field. Ull24 fixes real or complex Banach spaces at the start of its §1 (Ull24 line 21). Write "on real or complex Banach spaces".

## C03 — OI-A56 derives compactness from OI-A29, which does not cover the `ℓᵖ` operators of OI-A55 for `p ≠ 2`

OI-A56 (line 357) says "over `ℝ` or `ℂ` the operator is compact by OI-A29", where the operator is the diagonal operator of OI-A55, on `ℓ²(ℕ, 𝕜)` and on `ℓᵖ(ℕ, 𝕜)` for every `1 ≤ p ≤ ∞`. OI-A29 needs a Hilbert-space target. For `p ≠ 2` the conclusion is still true, by OI-A27 (a locally compact field and a complete target). Write "by OI-A27", which covers `p = 2` as well, or "by OI-A29 on `ℓ²`, and by OI-A27 on `ℓᵖ`".

## Previous findings

The previous review read this same head and raised no finding, so there is none to check for repair. Its two small corrections are unrepaired because nothing changed, and are C01 and C02 above. R01 and C03 are new: the previous review did not test OI-A55 and OI-A56 over a field other than `ℝ` or `ℂ`, nor on `ℓᵖ` with `p ≠ 2`.

## Verified sound

| Statement | Instances tried | Values computed, each side | Result |
| --- | --- | --- | --- |
| §1.1 OI-A01, A12–A13, A16, A17, A20, A22 | `diag(3,1)`; `S = diag(1,0)`, `T = diag(0,1)`; Ull24 (S1)–(S3), Remark 1 | `a = (3,1,0)`; `a₁(S+T) = 1 > 0+0`, `a₁₊₀(S+T) = 1 ≤ 0+1`; one-based `s_{m+n−1}` is `a_{m'+n'}` | holds; agrees with Ull24 lines 38–46, 93–95 |
| §1.2 OI-A23–A29 | `T(x,y) = x+√2y` over `ℚ`; `S = diag(1,0)`; diagonal `1/(n+1)` | over `ℚ`: `a₁ = 0`, rank 2, so completeness needed; (S5) gives `a₁(S) = 0`; `aₙ = 1/(n+1) > 0`, compact, infinite rank | holds; Lean has `[CompleteSpace 𝕜]`, `[LocallyCompactSpace 𝕜]` |
| §1.3 OI-A30–A34 | `T = diag(3,1)`, `V = 𝕜²`, `c = 1`, `n = 1`; `E = 𝕜` with zero seminorm | rank `V = 2 > 1`, `1·‖x‖ ≤ ‖Tx‖`, so `1 ≤ a₁ = 1`; with a null vector the kernel argument gives nothing, so normed `E` needed | holds; README and Lean both assume a normed source |
| §1.4 OI-A35–A40 | `diag(3,1)`, `n = 1`, `V = span(e₀)`, `span(e₁)`; zero-seminorm source for OI-A40 | restricted norms `1` and `3`, infimum `1 = a₁`; on zero seminorm the coercivity set is unbounded while `a₀ = 0` | holds; §1.4 assumes an inner product source, Lean a normed one |
| §1.5 OI-A41–A50 | `S`, `T` as above; `(x,y) ↦ (x+y,0,0)` | `K₁(S+T) = 1 ≤ 2`, `K₂ = 2 = 1+1`; `T†T` eigenvalues `2, 0`, `σ = (√2, 0)`, `a₀ = √2 = ‖T‖` | holds |
| §1.6 OI-A51–A54 | identity of `𝕜²`; `D : 𝕜³ → 𝕜²`, entries `1, −2` | `aₙ(id) = 1, 1, 0`; `a(D) = (2, 1, 0)` | holds |
| §1.6 OI-A55, last clause (R01) | `𝕜 = ℚ₃`, `c = (2,0,0,…)`; `𝕜 = ℝ`, `d = c` | `ℚ₃`: `|d₀| ∈ {0} ∪ 3^ℤ`, never `2`; `ℝ`: `a(D) = c` | false without `ℝ` or `ℂ`; Lean `[RCLike 𝕜]`, Diagonal.lean:92 |
| §1.6 OI-A56 (C03) | diagonal `1/(n+1)` on `ℓ¹` | `aₙ = 1/(n+1) → 0`; target not Hilbert, so OI-A29 does not apply; OI-A27 applies | true, wrong reference |
| §2.1 OI-B01–B19 | `Φ = ‖·‖ₑ`; `c = −1`; `T = 0` | `Φ(−T) = ‖−1‖ₑΦ(T) = Φ(T)`; `Φ(0) = 0·Φ(0) = 0`; `Φ(T) = 0` forces `‖T‖ₑ = 0` | holds; universes `v`, `w` as in `Family.lean` 45–70 |
| §2.2 OI-B20–B41 | projection onto line `(1,1)`; identity of `ℓ²`; `diag(3,1)` | energies `½+½ = 1` and `1+0 = 1`; identity: energy `∞`, HS norm `0 < 1 = ‖id‖`, so finite energy needed; `√10 ≥ 3`, `ν = 4` | holds; Lean carries `≠ ∞` (Basic.lean:269, 286) |
| §2.3 OI-B42–B55 | `diag(3,4)`; OI-B51 right factor with `G = 0`, `c = −1` | `‖·‖₁ = 7`, `‖·‖₂ = 5`, `‖·‖_∞ = 4`; `AC = 0` but `c‖A‖ < 0`, so `c ≥ 0` needed on the right only | holds; matches Schatten.lean:156–181 |
| §2.4 OI-B56–B73 | `a = (1,1,0,…)`; constant `1`; `c = ∞, 0` in OI-B62 | sup gauge `1`, `ℓ²` gauge `√2`; `Φ∞ = 1` resp. `∞`; `Φ∞(∞·a) = ∞ = ∞·Φ∞(a)` for `a ≠ 0`, `0 = 0` for `c = 0` | holds |
| §2.4 OI-B72, `symmetricGaugeFamily_injective` (headline) | `a 0 = ∞`; bounded antitone `a`; five one-tactic closes | both sides `∞`; `a = a(D)` on `ℓ²`, carried to universes `v`, `w`; `exact` (lowest-universe lemma), `simp_all`, `rfl`, `simp [h]`, `aesop` all fail | true, not padding; type keeps `u_1, u_2, u_3` |
| §2.5 OI-B24, B74–B88, B90 | diagonal `(n+1)^(−1/r)`; diagonal `1/(n+1)`; non-antitone `b` in OI-B74 | in `S_q` iff `q > r`; both sides of OI-B90 are `π²/6`; truncations of `a` weakly majorized by those of `b` | holds |
| §2.6 OI-B89, B91–B94 and the target | `a = (3,1,0,…)`, `b = (2,2,0,…)`; `a = (1,1,…)`, `b = (½,0,…)`; `p ≠ 2` | merge `(3,2,2,1,0,…)`, trace norm `8 = 4+4`, norm `3 = max`; merge constant `1`; `ℓᵖ` sum: `‖T₁⊕T₂ − R₁⊕R₂‖ = max` | holds; target follows from subadditivity and the ideal inequality with contractions |
| §3.1 OI-C01–C14 | `fᵢ = bᵢ/(i+1)`; identity of `ℓ²` | `‖f‖² = π²/6 = E_b(T_f)`; identity columns have norm `1`, not in `ℓ²` | holds |
| §3.2 OI-C15–C17 | `V : 𝕜 → 𝕜²`, `x ↦ (x,0)`, `T = id` | `‖T‖_HS = √2`, `‖TV‖_HS = 1`; `V†` not norm-preserving | holds |
| §3.3 OI-C18–C20 | coordinate projections of `𝕜²`, `T = id` | `E(P₀) + E(P₁) = 1 + 1 = 2 = E(id)` | holds |
| Headlines OI-A29, A48, A49, B75, B88, B90, B91, C08, C14 | the nine `#check` lines, elaborated | source seminormed and target Hilbert (A29); source complete (A48, B90, B91); both finite-dimensional (A49); target complete (C08, C14) | each matches its README item |

- Source locators: Ull24 lines 21, 35–56 and 88–95 against the four Ullrich citations (§1.1 twice, §1.2, References); all agree up to C02.
- Library declarations opened at the pin: Tau Ceti `Normed/Operator/Compact/FiniteRank.lean` 40–55; `OperatorIdeal/ApproximationNumber/Compact.lean` 90–175, `Diagonal.lean` 36–103, `MinMax.lean` 105–150 and 395–448, `Modulus.lean` 75–86, `BlockSum.lean` 150; `OperatorIdeal/Family.lean` 45–175, `Family/BlockSum.lean` 69–195, `Family/SymmetricGauge.lean` 84–230, `Family/SymmetricGauge/Faithfulness.lean` 46–80; `OperatorIdeal/DecreasingMerge.lean` 55–200; `OperatorIdeal/SymmetricGauge/Basic.lean` (structure, 260); `OperatorIdeal/Nuclear/Basic.lean` 152–170; `InnerProductSpace/HilbertSchmidt/Basic.lean` 176–292, `Columns.lean` 65–254; `InnerProductSpace/UnitarilyInvariantSeminorm/Schatten.lean` 81, 156–181; Mathlib `Analysis/InnerProductSpace/SingularValues.lean` 95–206.
- Cross-roadmap citations resolved: PD-A36 (PolarDecomposition on main, line 211); the three Majorization section titles on main (lines 168, 225, 313), and the same three headings in the copy the roadmap index serves for Majorization; the eleven roadmaps of Downstream consumers exist on main and name this roadmap.
- No general-family block bound exists in Tau Ceti at the pin: the only uses of the field `gauge_add_le` are the instances and `gauge_sum_le`, so the §2.6 target is not already proved.
- Dependency check: `depcheck: 186 roadmaps, 2058 edges, 0 problem(s)`; no UPWARD or CYCLE line. Nothing outside the folder changed.
- Elaboration: `lake env lean` on `Suggested.lean` gives only "declaration uses `sorry`" (line 48). `#check @symmetricGaugeFamily_injective` with universes printed keeps `RCLike 𝕜`, three universe parameters and `Antitone a`, as §2.4 states.
- Pull-request text against the head: ten conventions, 22 Checks in 13 sections, nine Tau Ceti imports, one stated theorem, the removed declarations and both suppliers are all as described; nothing to correct.
- The automatic checks all pass on this head.

Overlap check: read SchattenClassesAndSchurMultipliers, Majorization (main and open head), NoncommutativeGeometry, SNumbers, SpectralSubspacePerturbation, NoncommutativeIntegration. Approximation numbers, the Schatten families for `1 ≤ p ≤ ∞`, trace class, Hilbert–Schmidt and symmetric gauges: owner OperatorIdeals, the others cite it (SchattenClassesAndSchurMultipliers defines only the compact endpoint, a different object). Finite-dimensional Ky Fan sums and unitarily invariant seminorms: owner Majorization, cited here. SchrodingerOperatorsAndSpectralTypes was read only through its citations of OI-C14.

Source independence: 9 passages compared with 1 source (Ull24: Convention 3, §1.1 twice, OI-A16–A17, OI-A20–A22, OI-A23, OI-A51, the docstring of `Suggested.lean`, References), none shared beyond the axiom labels (S1)–(S5) and formulas; largest share Pietsch's two books, 8 of 28 citations, which could not be read; contents not compared with Pietsch. The order Layer 1 → 2 → 3 is forced by the *Needs:* lines of §§2.2–2.5 and 3.1.

Research link: Layers 1–2 are the approximation-number and symmetric-ideal theory in which s-number research is stated (Ullrich 2024, Ull24 §1); NoncommutativeGeometry, NoncommutativeIntegration and SchattenClassesAndSchurMultipliers consume them for Schatten classes, singular traces and Schur multipliers. Rests on Ull24 and the README's Downstream consumers.

## Not verifiable

- Pietsch, *Operator Ideals* (1980) and *Eigenvalues and s-Numbers* (1987): the sources service finds no legal copy.
- Gohberg and Kreĭn (1969): only the AMS landing page, not open.
- Simon, *Trace Ideals* (2005), and Reed and Simon I: no legal copy found.
- Mirsky (1960): the publisher's page refuses access (HTTP 403).
- Horn and Johnson, Thm 4.2.6: a book, no open copy; not fetched.
- Bhatia, *Matrix Analysis* (1997), and Eckart and Young (1936): settled as uncertified (paywalled).

## Source issues

- none

## For the human reviewers

- Status: README line 951 on says every item of Layers 1–3 is in Tau Ceti at the pin except two targets (§2.4 OI-B72 in arbitrary universes; §2.6 block bounds for every family, a consequence of two family laws). Whether the roadmap stays open is yours.
- Licence: `Suggested.lean` line 2 carries "Copyright (c) 2026 Kitware, Inc.", as on main; Provenance (README lines 929–937) names an Apache-2.0 implementation in AIQ-Kitware/aiq-dkps-formalization. The one stated theorem was not compared with that repository.
- Not tested: Pietsch's two books, the most-cited source, and Gohberg–Kreĭn could not be read, so wording and arrangement were not compared with them.
