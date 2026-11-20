# Review of OperatorIdeals (pull request #2614 at 2e05baa)
Folder: `TauCetiRoadmap/OperatorTheory/OperatorIdeals/`
**Verdict:** accepted

**Summary.** Accepted: the one finding of the previous review is repaired (the last clause of OI-A55 now says "over `ℝ` or `ℂ`"), and so are two of its three small corrections; the repairs introduce no new problem, and the changed statements were recomputed and compared with the pinned declarations. One small correction is carried over (the classical sources are cited by title alone) and there are no format notes; neither blocks. The humans have the roadmap's status and a provenance question to decide.

## C01 — The classical sources are cited by title alone, and the two open targets carry no locator

Carried over; the passages are unchanged. Pietsch, Gohberg and Kreĭn, Simon and Reed–Simon are cited as whole works, for example "(Gohberg and Kreĭn, symmetric norming functions; Mirsky 1960)" in §2.4 (line 585), so a reader cannot find the classical statements. The two targets an implementer will work on, OI-B72 in arbitrary universes (§2.4, line 626) and the block bounds for every family (§2.6), have no theorem or page locator. No stated result is left unsupported, since every other item names a declaration at the pin. Where the author holds the texts, chapter or theorem locators would close this, at least for faithfulness of the symmetric-gauge construction.

## Previous findings

- R01 — repaired: OI-A55 (§1.6, line 354) now reads "over `ℝ` or `ℂ`, every nonincreasing sequence in `ℝ≥0` arises this way", matching `[RCLike 𝕜]` in `lp.exists_singularValue_diagonalCLM_eq`.
- C01 — not repaired: the classical sources are still cited by title, and the two targets have no locator; written again as C01 above.
- C02 — repaired: §1.1 (lines 115 and 124–125) now says "on real or complex Banach spaces" and "On real or complex Banach spaces and in the one-based convention", as Ull24 line 21 fixes.
- C03 — repaired: OI-A56 (line 357) now reads "over a locally compact nontrivially normed field, such as `ℝ` or `ℂ`, the operator is compact by OI-A27, `ℓᵖ(ℕ, 𝕜)` being complete", which covers every `1 ≤ p ≤ ∞`.

The other changed lines add "Over `ℝ` or `ℂ`" to the Check of §1.2 on the diagonal `1/(n + 1)` and to the first two Examples of Layer 1; all three are true as now stated (table below).

## Verified sound

| Statement | Instances tried | Values computed, each side | Result |
| --- | --- | --- | --- |
| §1.6 OI-A55, last clause (was R01) | `𝕜 = ℚ₃`, `c = (2,0,0,…)`; `𝕜 = ℝ` or `ℂ`, `dₙ = cₙ` | `ℚ₃`: `|d₀| ∈ {0} ∪ 3^ℤ`, never `2`, now excluded by "over `ℝ` or `ℂ`"; `ℝ`: `‖dₙ‖ = cₙ`, so `a(D) = c` | holds; Lean `[RCLike 𝕜]`, Diagonal.lean:92 |
| §1.6 OI-A55, first half (unchanged, cited by the repair) | `𝕜 = ℚ₃`, `dₙ = 3ⁿ`, any `p` | `|dₙ| = 3⁻ⁿ` nonincreasing, `aₙ = 3⁻ⁿ`; pinned lemma has `[NontriviallyNormedField 𝕜]`, `[Fact (1 ≤ p)]` | holds over any field, as stated |
| §1.6 OI-A56 (was C03) | diagonal `1/(n+1)` on `ℓ¹` and `ℓ^∞` over `ℝ`; `dₙ = 3ⁿ` over `ℚ₃`; `d = (1,0,…)` over `ℂ_p` | `aₙ → 0`, target complete, field locally compact: compact by OI-A27; `ℂ_p` not locally compact: image of the unit ball is the unit ball of `ℂ_p`, not relatively compact, so the hypothesis is needed | holds; OI-A27 at the pin assumes `[LocallyCompactSpace 𝕜]`, `[CompleteSpace F]` (Compact.lean:115–121) |
| §1.2 Check, diagonal `1/(n+1)` | `𝕜 = ℝ`; `𝕜 = ℚ₃` as control | `ℝ`: `aₙ = 1/(n+1) > 0`, `→ 0`, Hilbert target, compact by OI-A29, `rank > n` all `n`; `ℚ₃`: `‖1/3‖ = 3`, magnitudes not `1/(n+1)`, so the restriction is right | holds |
| Layer 1 Examples, identity of `ℓ²(ℕ, 𝕜)` | `𝕜 = ℝ`, `k = 2` | `aₙ = 1` all `n` (OI-A51, rank infinite, Hamel dimension `2^ℵ₀`), not `→ 0`, not compact by OI-A29; `K₂ = 1 + 1 = 2` | holds |
| Layer 1 Examples, diagonal `1/(n+1)` | `𝕜 = ℝ`, `k = 2, 3` | `K₂ = 1 + 1/2 = 3/2`, `K₃ = 11/6`; compact by OI-A56 via OI-A27 (`ℓ²` complete, `ℝ` locally compact) | holds |
| §1.1 Ullrich citations (was C02) | Ull24 lines 21, 36–40 | source: real or complex Banach spaces, one-based (S1)–(S3); README: same words, with OI-A12/A13, A16, A20 zero-based | agrees |
| §2.4 OI-B72 route (cites OI-A55) | `𝕜` with `RCLike 𝕜`, bounded antitone `a` | route uses the last clause over `ℝ` or `ℂ` only; elaborated type keeps `[RCLike 𝕜]`, `Antitone a` | consistent with the repaired clause |

The rows for the untouched statements stand as in the previous review, of `548eeea`.

- Source locators checked against the text: Ull24 line 21 (real or complex Banach spaces) and lines 36–40 (axioms (S1)–(S3)) for the two changed citations of §1.1.
- Library declarations opened at the pin: Tau Ceti `Analysis/OperatorIdeal/ApproximationNumber/Diagonal.lean` 36–103 (`lp.singularValue_diagonalCLM`, `lp.tendsto_singularValue_diagonalCLM`, `lp.exists_singularValue_diagonalCLM_eq`) and `Compact.lean` 115–121 and 171 (`isCompactOperator_of_tendsto_singularValue`, `isCompactOperator_iff_tendsto_singularValue`).
- Cross-roadmap citations: none in the changed passages; the internal citations they make (OI-A24, A27, A29, A51, A55, A56) each resolve to the item they are used for.
- Dependency check: `depcheck: 200 roadmaps, 2201 edges, 0 problem(s)`; no UPWARD or CYCLE line. Nothing outside the folder changed (the diff against the base touches only the folder's `README.md` and `Suggested.lean`).
- Elaboration: `lake env lean` on `Suggested.lean` gives only "declaration uses `sorry`" (line 48); the file is unchanged since `548eeea`, and the elaborated type of `symmetricGaugeFamily_injective` keeps `[RCLike 𝕜]` and `Antitone a` as §2.4 states.
- Pull-request text against the head: the change adds a field restriction to one clause of OI-A55 and corrects a reference in OI-A56; the description's sentences on OI-A55 ("holds for complex coefficients and on every `ℓᵖ`") and its counts remain true; nothing to correct.
- The automatic checks all pass on this head.

Overlap check: read SchattenClassesAndSchurMultipliers, Majorization, NoncommutativeGeometry, SNumbers, SpectralSubspacePerturbation, SchrodingerOperatorsAndSpectralTypes as in the previous review; the change touches no shared object and the overlap listing shows no dropped or conflicting id; owners unchanged (approximation numbers, Schatten families, symmetric gauges: OperatorIdeals; finite-dimensional Ky Fan sums and unitarily invariant seminorms: Majorization, cited here).

Source independence: changed passages only; 2 passages compared with 1 source (Ull24 lines 21 and 36–40 against the two citations of §1.1), none shared beyond the four words "real or complex Banach spaces", which the mathematics forces; the other changed passages are the roadmap's own examples. Largest share Pietsch's two books, 8 of 28 citations, which could not be read; contents not compared again, the diff adding, removing and reordering no layer.

Research link: Layers 1–2 are the approximation-number and symmetric-ideal theory in which s-number research is stated (Ullrich 2024, Ull24 §1); NoncommutativeGeometry, NoncommutativeIntegration and SchattenClassesAndSchurMultipliers consume them for Schatten classes, singular traces and Schur multipliers. Rests on Ull24 and the README's Downstream consumers.

## Not verifiable

- Pietsch, *Operator Ideals* (1980) and *Eigenvalues and s-Numbers* (1987): no legal copy found (as in the previous review; not requested again, no changed passage rests on them).
- Gohberg and Kreĭn (1969), Simon, *Trace Ideals* (2005), Reed and Simon I, Mirsky (1960), Horn and Johnson: no open copy; untouched by the change.
- Bhatia, *Matrix Analysis* (1997), and Eckart and Young (1936): settled as uncertified (paywalled).

## Source issues

- none

## For the human reviewers

- Status: README line 952 on says every item of Layers 1–3 is in Tau Ceti at the pin except two targets (§2.4 OI-B72 in arbitrary universes; §2.6 block bounds for every family). Whether the roadmap stays open is yours.
- Licence: `Suggested.lean` line 2 carries "Copyright (c) 2026 Kitware, Inc.", as on main; Provenance (README lines 930–938) names an Apache-2.0 implementation in AIQ-Kitware/aiq-dkps-formalization. The one stated theorem was not compared with that repository.
- Not tested: Pietsch's two books, the most-cited source, and Gohberg–Kreĭn could not be read, so wording and arrangement were not compared with them.
