# Review of OperatorIdeals (pull request #2614 at 9869dd1)
Folder: `TauCetiRoadmap/OperatorTheory/OperatorIdeals/`
**Verdict:** needs changes

**Summary.** Every library declaration the README names exists at the pins with the hypotheses the README gives it, every Check computes correctly, all 169 `OI-` labels of main are kept, and `Suggested.lean` elaborates with `sorry` as its only warning. Four findings block: the proof route for the one open headline, faithfulness of the symmetric-gauge construction in arbitrary universes, leaves out its only new input (a Hilbert space over 𝕜 in an arbitrary universe); the overview says rank statements hold over every nontrivially normed field, which OI-A24 refutes over ℚ; a Layer 1 example gives the rank of ℓ² as ℵ₀; and the Majorization labels this roadmap cites disappear in Majorization's open revision. There are three small corrections and one format note, none blocking, and the humans have the roadmap's status and a provenance question to decide.

## R01 (P2) — The route to faithfulness in arbitrary universes leaves out the one input the generalization needs: a Hilbert space over 𝕜 in an arbitrary universe

The universe-0 case is already Tau Ceti's `TauCeti.SymmetricGauge.extend_eq_of_operatorIdealFamily_eq`. So the only new content of the §2.4 target `symmetricGaugeFamily_injective` is its universe generality, and an implementer following the route gets stuck at exactly that step. The route (§2.4, lines 615–621) carries the diagonal operator on ℓ²(ℕ, 𝕜) "to a Hilbert space over `𝕜` in universe `v` and one in universe `w`", but nothing listed supplies such spaces:

- ℓ²(ℕ, 𝕜) lives in 𝕜's universe `u`.
- Mathlib at the pin has no inner-product-space structure on `ULift`, only `ULift.normedSpace` (`Mathlib/Analysis/Normed/Module/Basic.lean:139`).
- When `v` or `w` lies below `u`, a 𝕜-Hilbert space in that universe can only come from transporting the scalars along 𝕜 ≅ ℂ or ℝ (`RCLike.complexRingEquiv`, `Mathlib/Analysis/Complex/Basic.lean:381`; `RCLike.realRingEquiv`, `Mathlib/Analysis/RCLike/Basic.lean:1253`).

Every proof needs this step, not just this route, because the hypothesis speaks only about spaces in universes `v` and `w`. The statement itself is true, since the transported ℓ² works. It does not follow from the library lemma: in a copy of the file, `exact TauCeti.SymmetricGauge.extend_eq_of_operatorIdealFamily_eq h ha` fails on the universe mismatch, and the same line closes the universe-0 copy.

Smallest change: make the construction part of the target and add it to its *Needs:* line. For example: "for every universe `v`, a Hilbert space over `𝕜` in `Type v` with a linear isometric equivalence to ℓ²(ℕ, 𝕜), obtained from ℓ²(ℕ, ℂ) or ℓ²(ℕ, ℝ) by transporting scalars along `RCLike.complexRingEquiv` or `RCLike.realRingEquiv` and lifting with `ULift`". Finite-dimensional spaces would also do, because a symmetric gauge is determined by its values on finitely supported sequences, but they need the same transport.

## R02 (P2) — The overview says statements about norms and rank hold over any nontrivially normed field, but the rank characterization OI-A24 is false over ℚ

A reader who takes the overview's generality at face value (lines 9–10) drops the completeness hypothesis that OI-A24 states (line 175). Its Lean form, `ContinuousLinearMap.singularValue_eq_zero_iff_rank_le`, also carries `[CompleteSpace 𝕜]`.

A counterexample over ℚ: give ℚ² the max norm, view ℝ as a normed ℚ-space, and let `T(x, y) = x + √2·y`. Its range ℚ(√2) has ℚ-dimension 2. With rational `qₖ → √2`, the maps `Rₖ(x, y) = x + qₖ·y` have rank 1 and `‖T − Rₖ‖ = |√2 − qₖ| → 0`. So `a₁(T) = 0` although `rank T = 2`. OI-A26 and OI-A27 also need more than the overview says: a locally compact field.

Smallest change: "… hold over any nontrivially normed field unless a section says otherwise: the rank characterization needs a complete field, and the compactness criteria a locally compact one."

## R03 (P2) — The first example of Layer 1 gives the rank of ℓ²(ℕ, 𝕜) as ℵ₀, but it is 2^ℵ₀

Convention 2 makes rank the algebraic dimension `Module.rank`. Line 362 applies OI-A51 "with `r = ℵ₀`", which is the Hilbert dimension, not the algebraic one. For `0 < t < 1` the vectors `vₜ = (1, t, t², …)` lie in ℓ²(ℕ, 𝕜). Any finitely many of them with distinct `t` are linearly independent, because their leading coordinates form a Vandermonde matrix, so the rank is at least 2^ℵ₀. No infinite-dimensional Banach space has countable algebraic dimension, by Baire. The conclusion `aₙ = 1` for every `n` is unaffected, since `n < r` for every infinite `r`.

Smallest change: "(OI-A51; the rank of ℓ²(ℕ, 𝕜) is infinite, in fact 2^ℵ₀)".

## R04 (P2) — The Majorization labels cited as suppliers (MAJ-A26, MAJ-B01, MAJ-B31) break when Majorization's open revision merges, because that revision drops every MAJ label and gives no old-to-new table

Once that pull request merges, a reader following §1.5, §2.3 or the Majorization contract finds no MAJ-A26, MAJ-B01 or MAJ-B31 anywhere.

- On main the three labels are defined in `TauCetiRoadmap/OperatorTheory/Majorization/README.md`, lines 173, 231 and 321.
- At the head of #2612 (591e977, a template update of Majorization in the same series as this pull request), that README contains no `MAJ-` label and no table of the former numbering. The content sits at its §1.4 (Ky Fan sums), §2.1 (rectangular seminorms) and §2.5 (concrete seminorms).
- This README cites the three labels at lines 84, 308, 374, 539, 555, 560, 772, 945 and 1178–1180.

Smallest change, either of:

- give Majorization's revision a table mapping its former labels to its sections, after which nothing here needs to change; or
- cite those sections as they stand at that head, and name that revision in this pull request's merge order.

## C01 — The sources are cited by title only, with no chapter, theorem or page, so a reader cannot find the classical statements

Apart from Horn–Johnson Thm 4.2.6, every section cites whole works. For example, §1.1 (lines 111–121) cites "Pietsch, *Eigenvalues and s-Numbers*; Gohberg and Kreĭn". The two open targets, the universe-general OI-B72 (§2.4) and the block bounds for every family (§2.6), have no locator at all. Every other item rests on a declaration at the pin, so no stated result is left unsupported.

Add chapter or theorem locators. For the one text that is openly available: Ullrich 2024 defines `aₙ` (one-based, over `rank < n`) and states the axioms (S1)–(S5) on p. 2. Its Remark 1 on the same page states that `aₙ` is additive and multiplicative, the facts behind OI-A17 and OI-A22.

## C02 — The operator-norm and nuclear endpoints of §2.3 use Majorization's seminorms without naming Majorization as their supplier

Two §2.3 statements identify Schatten seminorms with Majorization's instances:

- the `p = ∞` case of OI-B47 (`TauCeti.UnitarilyInvariantSeminorm.schatten_top`, equal to `TauCeti.UnitarilyInvariantSeminorm.opNorm`), which is Majorization's operator-norm instance (MAJ-B30 on main, line 319);
- OI-B52 (`TauCeti.UnitarilyInvariantSeminorm.schatten_one`, equal to `TauCeti.UnitarilyInvariantSeminorm.nuclear`), which is Majorization's nuclear instance (MAJ-B33 and MAJ-B37 on main, lines 325 and 332).

The README names Majorization only for the analogous Frobenius endpoint (MAJ-B31). Its "From Tau Ceti" list also files `TauCeti.UnitarilyInvariantSeminorm.nuclear` with this roadmap's own seminorms (line 1106). Add the two instances to the *Needs:* line of §2.3 and to the Majorization contract, in whatever numbering R04 settles on.

## C03 — The first Check of §2.6, read in order, pairs the two block bounds with the wrong gauges

Lines 752–753 say "the two bounds of OI-B93 and OI-B94 are attained by the `ℓ¹` and supremum gauges". OI-B93 is the lower bound `max(Φ(T₁), Φ(T₂))` and OI-B94 the upper bound `Φ(T₁) + Φ(T₂)`. The Check's own values show the opposite pairing: the supremum gauge attains the lower bound (`3 = max(3, 2)`) and the `ℓ¹` gauge the upper one (`8 = 4 + 4`). The `ℓ¹` gauge does not attain the lower bound (`8 > max(4, 4)`). Write "by the supremum and `ℓ¹` gauges respectively".

## N01 — `ENNReal.tsum_comm` is deprecated at the pinned Mathlib in favour of `tsum_comm`; cite `tsum_comm` at OI-B34 (line 469), in the *Needs:* line of §2.2 (line 502) and in the Mathlib contract (line 971).

## Verified sound

| Statement | Instances tried | Values computed, each side | Result |
| --- | --- | --- | --- |
| §1.1 calculus (OI-A12, A16, A17) | `diag(3,1)`; `S = diag(1,0)`, `T = diag(0,1)` | a = (3,1,0,…), a₀ = ‖T‖ = 3; a₁(S+T) = 1 vs a₁(S)+a₁(T) = 0; a₁₊₀(S+T) = 1 = a₁(S)+a₀(T) | holds; the same-index form fails, as the Check says |
| Convention 3 against Ull24 p. 2 | one-based aₙ over rank < n (Ull24 lines 52–56) | s₁ = inf over rank < 1 = ‖T‖ = a₀; sₙ = aₙ₋₁ | agrees |
| §1.2 OI-A24 | `T(x,y) = x+√2y` over ℚ; diag 1/(n+1) on ℓ² | over ℚ: a₁ = 0, rank 2; diag: aₙ = 1/(n+1) > 0, so rank > n for all n | section correct (complete 𝕜); overview overclaims, R02 |
| §1.2 OI-A29 (headline) | identity of ℓ²; diag 1/(n+1) | identity: aₙ = 1, not → 0, not compact; diag: aₙ → 0, compact | holds; Lean: E seminormed, F complete inner product |
| §1.3 OI-A30, A31 | Lean signatures at pin | adjoint and modulus need E, F complete; README says "between Hilbert spaces" | match |
| §1.4 OI-A35 | `diag(3,1)`, n = 1 | V = span e₀ gives 1 = a₁; V = span e₁ gives 3; sup over V would be 3 = a₀ | holds; Check separates inf from sup |
| §1.5 OI-A48, A49 (headline) | S, T as above; `T(x,y) = (x+y,0,0)` | K₁(I) = 1 ≤ 2; K₂ = 2 = 1+1; T†T eigenvalues 2, 0, so σ = (√2, 0) = a; diagonal reading gives 1 | holds |
| §1.6 OI-A53, A55 | `D: 𝕜³ → 𝕜²`, d = (1, −2) | a = (2, 1, 0, …), ‖D‖ = 2; unsorted reading gives a₀ = 1 | holds |
| §2.1 OI-B01–B19 | structure fields, `Family.lean` lines 47–74 | four fields match Convention 6; Φ(T) = 0 forces ‖T‖ₑ = 0 | holds |
| §2.2 OI-B35, B38, B40 | projection onto line (1,1); identity of ℓ² | energies 1/2+1/2 = 1 and 1+0 = 1; unsquared √2 vs 1; ‖id‖ = 1 > junk ‖id‖_HS = 0 | holds with the finite-energy hypotheses |
| §2.3 OI-B47–B54 | `diag(3,4)` | σ = (4,3): ‖·‖₁ = 7, ‖·‖₂ = 5 = √(9+16), ‖·‖∞ = 4 | holds; endpoints unsourced, C02 |
| §2.4 OI-B56–B73 | constant 1; rank-one x ↦ ⟪u,x⟫v; (1,1,0,…) | sup gauge 1 vs ℓᵖ ∞; ‖u‖‖v‖ vs 2‖u‖‖v‖ for twice the sup; 1 vs √2 | holds |
| §2.5 OI-B75 (headline) | S = diag(1,1), T = diag(2,0) | K₁: 1 ≤ 2, K₂: 2 ≤ 2; sup 1 ≤ 2, ℓ² √2 ≤ 2, ℓ¹ 2 ≤ 2 | holds |
| §2.5 OI-B88, B90 (headlines) | diag (n+1)^(−1/r); diag 1/(n+1) | in S_q iff q > r, so strict for p < r < q; both sides π²/6 | holds |
| §2.6 OI-B89, B91–B94 (headline B91) | a = (3,1,0,…), b = (2,2,0,…); a ≡ 1, b = (1/2,0,…) | merge (3,2,2,1,0,…): ℓ¹ 8 = 4+4, sup 3 = max; merge ≡ 1, so 1/2 never appears | holds; Check wording, C03 |
| §2.6 block bounds for every family | splitting T = Q₁TP₁ + Q₂TP₂, ‖Pᵢ‖, ‖Qᵢ‖ ≤ 1 | upper bound by `gauge_add_le`; Φ(QᵢTPᵢ) ≤ ‖Qᵢ‖Φ(T)‖Pᵢ‖ ≤ Φ(T) | holds; universes fit (E₁, E₂ in v) |
| §3.1 OI-C08, C14 (headline) | fᵢ = (1/(i+1))bᵢ; identity | ‖f‖² = π²/6 = E_b(T_f); identity columns of norm 1, not in ℓ² | holds |
| §3.2 OI-C16 | V: 𝕜 → 𝕜², x ↦ (x,0); T = id | ‖TV‖_HS = 1 vs ‖T‖_HS = √2, so the isometry fails; the coisometry hypothesis is needed | holds |
| §3.3 OI-C18 | coordinate projections of 𝕜², T = id | 1 + 1 = 2 = E(id) | holds |
| OI-B72, all universes (Suggested.lean) | u > v; universe-0 copy | universe 0 closes with the library lemma; general case needs a 𝕜-Hilbert space in Type v, none at the pins | true; route lacks that input, R01 |
| Layer 1 example, OI-A51 on ℓ² | vₜ = (tⁿ), 0 < t < 1 | 2^ℵ₀ independent vectors, so rank = 2^ℵ₀ ≠ ℵ₀; aₙ = 1 either way | value of r wrong, R03 |
| MAJ-A26, B01, B31 citations | main and Majorization revision head 591e977 | main lines 173, 231, 321; revision: no MAJ labels, content at §1.4, §2.1, §2.5 | break at merge, R04 |

- Library names: all 278 backticked names of the README were `#check`ed at the pins. 256 elaborated; the 22 in modules without object files were read in source (e.g. `HilbertSchmidt/Isometry.lean:58–104`, `Pythagoras.lean:44–96`, `ApproximationNumber/Isometry.lean:68`, `FiniteDiagonal.lean:128–190`, `Family/BlockSum.lean:79–189`). Each signature was compared with its README hypotheses, and all match.
- Mathlib at the pin: no `HilbertSchmidt`, trace-class or Schatten objects; no inner product on `ULift`; `ENNReal.tsum_comm` deprecated; supplier paths `SingularValues.lean`, `FiniteRange.lean` and `Compact/Basic.lean:459` exist.
- Cross-roadmap citations: PD-A36 (PolarDecomposition, main line 211) and MAJ-A26/B01/B31 (Majorization, main) resolve on main; 11 downstream links resolve on main, and their cited ids exist; the 169 OI ids are identical on main and at the head.
- Source locators: Ull24 lines 35–56 and 88–95 checked against Convention 3 and the §1.1 laws. No other exact locator exists except Horn–Johnson Thm 4.2.6, which is paywalled.
- Automatic checks: every check passed. Dependency check output: `depcheck: 200 roadmaps, 2201 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `Suggested.lean` gives only "declaration uses `sorry`" (line 48). The elaborated type of `symmetricGaugeFamily_injective` keeps `RCLike 𝕜`, the universes `{u, v, w}` and `Antitone a`, matching README §2.4; nothing changed.
- One-tactic probe: `exact extend_eq_of_operatorIdealFamily_eq h ha` fails on universes and `simp_all` makes no progress, so the theorem is not padding. The `#check` lines pin library declarations only.
- The automatic overlap scan did not report that Majorization's open revision drops its labels (R04); I found it by reading that head.

Overlap check: read SNumbers, Majorization (main and its open revision), NoncommutativeGeometry, SchattenClassesAndSchurMultipliers, SpectralSteepestDescent and CompactOperators. Approximation numbers and the Schatten, trace-class and Hilbert–Schmidt families are owned by OperatorIdeals, and all the others cite it. SNumbers SN-A06 restates the identity case of OI-A51 with an unneeded completeness hypothesis, which is a repair for SNumbers. Finite-dimensional Ky Fan sums and unitarily invariant seminorms are owned by Majorization and cited here (see C02).

Source independence: 7 passages compared with 1 source (Ull24 lines 35–56 and 88–95, against Convention 3 and the §1.1 laws OI-A12–A17, OI-A20–A23); nothing shared beyond forced formulas. Largest share: Pietsch's two books, 8 of about 30 title-only citations, not readable. Contents not compared with them; the order Layer 1 → Layer 2 → Layer 3 is forced by the *Needs:* lines of §§2.2–2.5 and 3.1.

Research link: Layers 1–2 are the approximation-number and symmetric-ideal theory that current s-number research works in (Ullrich 2024, Ull24 §1–2). The NoncommutativeGeometry and NoncommutativeIntegration roadmaps consume them for Schatten classes and singular traces. Rests on Ull24 and the README's Downstream consumers.

## Not verifiable

- Pietsch, *Operator Ideals* (1980) and *Eigenvalues and s-Numbers* (1987): books; the sources service found no legal copy.
- Gohberg and Kreĭn (1969): only the AMS ebook landing page, which is paywalled.
- Simon, *Trace Ideals* (2005): no legal copy found. Reed and Simon I: a book; the search hit a network error, and no open copy is expected.
- Bhatia, *Matrix Analysis* (1997), and Eckart and Young (1936): Springer DOIs, paywalled.
- Mirsky (1960): the publisher's landing page refused access.
- Horn and Johnson, Thm 4.2.6: only the Cambridge landing page.

## Source issues

- none

## For the human reviewers

- Status: README lines 928–932 state that every item of Layers 1–3 is in Tau Ceti at the pin except two targets. Whether the roadmap should be marked completed or keep the two open targets is yours to decide.
- Licence: `Suggested.lean` line 2 carries "Copyright (c) 2026 Kitware, Inc.", as on main. The Provenance section (README lines 906–914) says the content is implemented in the Apache-2.0 repository AIQ-Kitware/aiq-dkps-formalization. I did not compare `symmetricGaugeFamily_injective` with that repository.
- Not tested: Pietsch's two books, the most-cited source, and Gohberg–Kreĭn could not be read, so wording and arrangement were not compared with them.
