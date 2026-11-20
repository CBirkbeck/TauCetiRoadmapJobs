# Review of OperatorIdeals (pull request #2614 at 548eeea)
Folder: `TauCetiRoadmap/OperatorTheory/OperatorIdeals/`
**Verdict:** accepted

**Summary.** Accepted. All four findings of the previous round are repaired:
- the route to faithfulness in arbitrary universes now constructs its own Hilbert space over `𝕜` in each universe, and that construction is valid;
- the overview names the complete and locally compact fields that OI-A24 and OI-A26–OI-A27 need;
- the rank of `ℓ²` is given as `2^ℵ₀`;
- the Majorization citations use section titles that exist both on main and at Majorization's open head.

No new finding. There are two small corrections, neither blocking: one carried over and partly repaired (title-only citations), and one new (Ullrich's real or complex scalars). There are no format notes. The humans have the roadmap's status and a provenance question to decide.

## C01 — The classical sources are still cited by title alone, and the two open targets carry no locator

The new Ullrich citations locate the definition and the s-number laws of §§1.1–1.2. The other citations still name whole works: Pietsch (8 citations), Gohberg and Kreĭn (6) and Simon. For example, §2.4 cites "(Gohberg and Kreĭn, symmetric norming functions; Mirsky 1960)" (line 584).

So a reader still cannot find the classical statements. In particular, the two targets an implementer will actually work on have no theorem or page locator:
- the universe-general OI-B72 (§2.4, line 625);
- the block bounds for every family (§2.6, line 756).

No stated result is left unsupported, since every other item rests on a declaration at the pin. Where the author holds the texts, chapter or theorem locators would close this, at least for the faithfulness of the symmetric-gauge construction.

## C02 — The Ullrich citations say "on Banach spaces", but the source works only with real or complex Banach spaces

In §1.1 (lines 115 and 124–127) the citation qualifies itself as "one-based, on Banach spaces". The surrounding text is over any nontrivially normed field, so a reader may take the source to cover Banach spaces over any complete field. Ull24 fixes real or complex Banach spaces at the start of §1 (Ull24 line 21). Write "on real or complex Banach spaces".

## Previous findings

- R01 — repaired: "Those two spaces are part of the target … For every universe `v`, the target constructs a Hilbert space over `𝕜` in `Type v` with a `𝕜`-linear isometric equivalence to `ℓ²(ℕ, 𝕜)`" (§2.4, lines 630–643). The Mathlib inputs are in its *Needs:* line and in the Mathlib contract.
- R02 — repaired: "Statements about norms and rank hold over any nontrivially normed field unless a section says otherwise: the rank characterization needs a complete field, and the compactness criteria a locally compact one" (lines 9–11; Convention 1 matches).
- R03 — repaired: "(OI-A51, the rank `r` being infinite, in fact `2^ℵ₀`)" (Layer 1, Examples).
- R04 — repaired: the citations are now "Majorization, section *Ky Fan sums*", *Rectangular seminorms and transport* and *Concrete rectangular seminorms*. These headings exist on main (lines 168, 225, 313) and at Majorization's open head c754e3c (§1.4, §2.1, §2.5), which also maps its former labels.
- C01 — partly repaired: "Ullrich 2024, p. 2, one-based, on Banach spaces" now locates OI-A01, OI-A12–A13, OI-A16, OI-A17, OI-A20, OI-A22 and OI-A23. Pietsch and Gohberg–Kreĭn remain title-only, and the open targets have no locator (C01 above).
- C02 — repaired: "at `p = ∞` it is the operator-norm seminorm of Majorization (section *Concrete rectangular seminorms*…)" (line 550), likewise the nuclear endpoint (line 562). Both are in the *Needs:* line and in the Majorization contract.
- C03 — repaired: "the two bounds of OI-B93 and OI-B94 are attained by the supremum and `ℓ¹` gauges respectively" (line 774).
- N01 — repaired: `tsum_comm` at lines 476, 509 and 996.

## Verified sound

| Statement | Instances tried | Values computed, each side | Result |
| --- | --- | --- | --- |
| Overview and Convention 1, field generality (R02) | `T(x,y) = x+√2y` over ℚ; identity of ℂ_p | ℚ: a₁ = 0 with rank 2. ℂ_p: rank 1, aₙ → 0, unit ball not compact (residue field infinite) | holds; Lean `[CompleteSpace 𝕜]` Compact.lean:90, `[LocallyCompactSpace 𝕜]` Compact.lean:115, FiniteRank.lean:40 |
| §1.1 OI-A01, A12–A13, A16, A20 against Ull24 (S1)–(S3), lines 35–56 | shift sₙ = aₙ₋₁; `diag(3,1)` | s₁ = ‖T‖ = 3 = a₀; (S2) at n = 1 is OI-A16 at n = 0; (S3) is OI-A20 | agrees; source scalars real or complex (C02) |
| §1.1 OI-A17, A22 against Ull24 Remark 1, lines 88–95 | m = 2, n = 1; S = diag(1,0), T = diag(0,1) | s₂(S+T) ≤ s₂(S)+s₁(T) becomes a₁(S+T) ≤ a₁(S)+a₀(T): 1 ≤ 0+1 | agrees; Remark 1 says both hold for aₙ |
| §1.2 OI-A23 against Ull24 (S5), line 48 | S = diag(1,0), rank 1 | (S5), n = 2: rank 1 < 2 gives s₂ = a₁ = 0; computed a₁(S) = 0 | agrees |
| Layer 1 example, OI-A51 on ℓ²(ℕ, 𝕜), 𝕜 = ℝ or ℂ (R03) | vₜ = (tⁿ), 0 < t < 1; cardinality | 2^ℵ₀ independent vectors (Vandermonde); \|ℓ²\| = 2^ℵ₀ bounds the rank above; aₙ = 1 for all n | holds |
| §2.2 OI-B34 with `tsum_comm` (N01) | projection onto the line (1,1) in 𝕜², standard bases | ∑ᵢ∑ⱼ ‖⟪eⱼ,Peᵢ⟫‖² = 4·¼ = 1 in both orders; `tsum_comm` needs a complete lattice, canonically ordered, T3 | holds for ℝ≥0∞ (Order.lean:371) |
| §2.3 OI-B47 at p = ∞, OI-B52, OI-B54 (C02) | `diag(3,4)` | σ = (4,3): ‖·‖∞ = 4 = opNorm, ‖·‖₁ = 7 = nuclear = K₂, ‖·‖₂ = 5 = Frobenius | holds; Schatten.lean:112, 119, 127; KyFan.lean:65 |
| Majorization section citations (R04) | main; open head c754e3c | main headings at lines 168, 225, 313; head §1.4, §2.1, §2.5 with the same titles; former-label table at lines 746–762 | resolve on both |
| §2.4 OI-B72 route (R01) | 𝕜 = ℂ-type (im I = 1); ℝ-type (I = 0); target universe v below u | φ⁻¹⟪x,φ(c)y⟫ = c·φ⁻¹⟪x,y⟫; re φ⁻¹(‖x‖²) = ‖x‖²; conj commutes with φ; `ULift.{v}` of `Type 0` is `Type v` | valid; inner product on `ULift (lp _ 2)` fails to synthesize at the pin |
| Suggested.lean `symmetricGaugeFamily_injective` (headline OI-B72) | `exact extend_eq_of_operatorIdealFamily_eq h ha`; `simp_all` | universe-mismatch error; "simp_all made no progress" | not padding; file unchanged since 9869dd1 |
| §2.6 Check, OI-B93/B94 (C03) | a = (3,1,0,…), b = (2,2,0,…) | sup gauge: 3 = max(3,2) < 5; ℓ¹ gauge: 8 = 4+4 > max(4,4) | the stated pairing is right |

The rows for the untouched statements, including the other headlines (OI-A29, OI-A48, OI-A49, OI-B75, OI-B88, OI-B90, OI-B91, OI-C08 and OI-C14), stand as in the previous review of 9869dd1.

- **Source locators.** Ull24 lines 21, 35–56 and 88–95 were checked against the five new Ullrich citations (§1.1 twice, §1.2, References). The journal reference (Adv. Oper. Theory 9, art. 82, DOI 10.1007/s43036-024-00386-x) was confirmed on the arXiv abstract page.
- **Mathlib at the pin.** I opened:
  - `Mathlib/Analysis/RCLike/Basic.lean:299, 1253, 1264`;
  - `Mathlib/Analysis/Complex/Basic.lean:381, 408`;
  - `Mathlib/Analysis/Normed/Module/Basic.lean:139`;
  - `Mathlib/Analysis/Normed/Module/Shrink.lean:24–31` (normed space, no inner product);
  - `Mathlib/Topology/Algebra/InfiniteSum/Order.lean:371` and `.../ENNReal.lean:116` (the deprecation).

  `#check` elaborates all six new Mathlib names. No inner-product instance on `ULift` or `Shrink` exists in Mathlib or Tau Ceti.
- **Tau Ceti at the pin.** I opened `UnitarilyInvariantSeminorm/OpNorm.lean:43`, `.../KyFan.lean:65`, `.../Schatten.lean:112–131`, `OperatorIdeal/ApproximationNumber/Compact.lean:90–121`, `Normed/Operator/Compact/FiniteRank.lean:40–47` and `OperatorIdeal/Nuclear/Basic.lean:148–166`. Every section that needs a complete or locally compact field says so, as Convention 1 now claims.
- **Cross-roadmap citations.** The three Majorization section titles resolve on main and at c754e3c. The citations of OperatorIdeals in SchattenClassesAndSchurMultipliers, SchrodingerOperatorsAndSpectralTypes, SNumbers and NoncommutativeGeometry were read; none owns an OI object.
- **Automatic checks.** Every check passes, rerun at this head. The dependency check prints `depcheck: 200 roadmaps, 2201 edges, 0 problem(s)`, with no UPWARD or CYCLE line. Nothing outside the folder changed.
- **Elaboration.** `lake env lean` on `Suggested.lean` gives only "declaration uses `sorry`" (line 48). The elaborated type of `symmetricGaugeFamily_injective` keeps `RCLike 𝕜`, the universes u, v, w and `Antitone a`, as README §2.4 states.
- **Pull-request text.** The description matches the head: ten conventions, 22 Checks in 13 sections, nine Tau Ceti imports, and the section-title citations of Majorization.

Overlap check: read SchattenClassesAndSchurMultipliers, Majorization (on main and at its open head), NoncommutativeGeometry, SchrodingerOperatorsAndSpectralTypes, SpectralSubspacePerturbation and SNumbers.
- Approximation numbers, the Schatten, trace-class and Hilbert–Schmidt families, and symmetric gauges are owned by OperatorIdeals; the others cite it by OI label.
- Finite-dimensional Ky Fan sums and unitarily invariant seminorms (operator-norm, nuclear, Frobenius) are owned by Majorization and cited here.
- SpectralSubspacePerturbation consumes Majorization's seminorms, and shares nothing with this roadmap.

Source independence: changed passages only. Four passages (§1.1 lines 113–116 and 124–127, §1.2 line 179, References line 1232) were compared with one source (Ull24 lines 21–95), and nothing is shared beyond the axiom labels (S1)–(S5). The §2.4 construction has no source. The largest share of citations is Pietsch's two books, 8 of 28, which could not be read. The arrangement was not compared again: no layer was added, removed or reordered, and the *Needs:* lines of §§2.2–2.5 and 3.1 force the order Layer 1 → 2 → 3.

Research link: Layers 1–2 are the approximation-number and symmetric-ideal theory that current s-number research works in (Ullrich 2024, Ull24 §1–2). The NoncommutativeGeometry and NoncommutativeIntegration roadmaps consume them for Schatten classes and singular traces. Rests on Ull24 and the README's Downstream consumers.

## Not verifiable

- Pietsch, *Operator Ideals* (1980) and *Eigenvalues and s-Numbers* (1987): books with no legal open copy.
- Gohberg and Kreĭn (1969): only the paywalled AMS landing page.
- Simon, *Trace Ideals* (2005), and Reed and Simon I: books with no legal open copy.
- Bhatia, *Matrix Analysis* (1997), and Eckart and Young (1936): settled as uncertified (paywalled).
- Mirsky (1960) and Horn and Johnson, Thm 4.2.6: publisher landing pages only.

## Source issues

- none

## For the human reviewers

- Status: README line 951 on states that every item of Layers 1–3 is in Tau Ceti at the pin except two targets (§2.4 OI-B72 in arbitrary universes, §2.6 block bounds for every family). Whether to mark the roadmap completed or keep the two targets open is yours to decide.
- Licence: `Suggested.lean` line 2 carries "Copyright (c) 2026 Kitware, Inc.", as on main. Provenance (README lines 929–937) says an Apache-2.0 implementation exists in AIQ-Kitware/aiq-dkps-formalization. I did not compare `symmetricGaugeFamily_injective` with that repository.
- Not tested: Pietsch's two books, the most-cited source, and Gohberg–Kreĭn could not be read, so wording and arrangement were not compared with them.
