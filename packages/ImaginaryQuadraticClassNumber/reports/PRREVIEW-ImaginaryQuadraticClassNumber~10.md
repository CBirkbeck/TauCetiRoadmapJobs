# Review of ImaginaryQuadraticClassNumber (pull request #2593 at 1eb5b47)

**Verdict:** accepted

**Summary.** Accepted: no finding. The one small correction of the previous review is repaired: the radicand-form theorem no longer takes the generation hypothesis, the remaining statement is true and equivalent to the old one, and the README, the docstring and the pull request's description all say so. No small correction; one format note is carried over (the old heading anchor of §3.1, still linked from two open roadmaps). Three facts are left for the human reviewers, as before.

## N01 — Eleven links to the old §3.1 heading anchor in two open roadmaps will land at the top of the README

ArithmeticStatisticsPartVII (README line 2518) and ComplexMultiplicationAndExplicitReciprocity (README lines 131, 428, 480, 552, 592, 614, 618, 622, 644, 673) link to `#h31-modular-functions-and-the-imaginary-quadratic-cm-dictionary`. Convention 9 (line 99) maps the labels and the description states the anchor change, so nothing is wrong; an inline anchor with the old id before the heading `### 3.1` would keep those links working.

## Previous findings

The previous review, of `11adb83`, had no finding (no R-numbered point). Its two other remarks:

- C01 — repaired: `classNumber_eq_one_iff_negative_squarefree_mem` now has hypotheses `hdeg`, `hd`, `hmin` only (`Suggested.lean` lines 77–80); the docstring and §3.6 (README lines 972–975) say that such a `θ` generates the field. The repair introduced no new problem.
- N01 — not repaired (a format note, stated in the description): carried as N01 above.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §3.6 `classNumber_eq_one_iff_negative_squarefree_mem`, without `hgen` | d = −1 (θ = i), −5, −163; d = 0, 1; d = −4 (θ = 2i); d > 0 | h = 1, 1 ∈ list; h = 2, 5 ∉ list; h = 1, 163 ∈ list; `X²`, `X² − 1` reducible, so `hmin` impossible; −4 excluded by `hd`; d > 0 excluded by total complexity | true | none |
| Dropped hypothesis is implied | θ ∈ 𝓞 K, `minpoly ℤ θ = X² − d`, `[K : ℚ] = 2` | `minpoly ℚ θ = X² − d` (ℤ integrally closed), so `[ℚ(θ) : ℚ] = 2 = [K : ℚ]`, `ℚ(θ) = K` | old and new statements equivalent | none |
| §1.1 presented field (cited by the changed text; untouched) | definition with `Algebra.adjoin ℚ {θ} = ⊤`, lines 135–136 | the adjoin clause is now a consequence of the other two with degree two; definition and theorem describe the same fields | consistent | none |
| §3.6 Check "the radicand form needs squarefreeness" (line 1018) | θ = 2i in ℚ(i) | `minpoly ℤ (2i) = X² + 4`, d = −4, 4 ∉ {1, 2, 3, 7, 11, 19, 43, 67, 163}, h = 1 | iff would fail without `hd`; Check true | none |

The rows for the untouched statements stand as in the previous review, of `11adb83`.

- Changed passages read: 2 (README §3.6 export bullet, lines 972–975; the docstring and signature of the radicand theorem, `Suggested.lean` lines 71–81). No section, layer, supplier or `*Needs:*` line changed.
- Library declarations opened at the pin: `TauCeti.heegnerNumbers` (`NumberTheory/ClassNumberOne/HeegnerNumbers.lean:70`, values 1, 2, 3, 7, 11, 19, 43, 67, 163), `classNumber_eq_one_of_mem_heegnerNumbers` (:121, one direction on the model only), `NumberField.exists_minpoly_eq_X_sq_sub_C_and_adjoin_eq_top_of_isTotallyComplex` (`NumberTheory/NumberField/Quadratic/Radicand.lean`, used at :108). The changed theorem is not in the pinned libraries.
- Lean: `Suggested.lean` elaborates with six `sorry` warnings and nothing else; one `import Mathlib` and three Tau Ceti modules, no `set_option`, no sorried data. The elaborated type of the changed theorem was compared with the README statement: same hypotheses (`hdeg`, squarefree `d`, `minpoly ℤ θ = X² − d`), all binders explicit.
- One-tactic probe on the changed theorem (`simp`, `rfl`, `infer_instance`, `exact` with the discriminant form): none closes it; `simp` only unfolds the membership to the nine values of `d`.
- Dependency check: `depcheck: 200 roadmaps, 2209 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line. No path outside the folder changed. The automatic checks all passed.
- Pull-request text read against the head: it states that the roadmap on main is rewritten, the renumbering H → Layer with Convention 9, the anchor change, the two added suppliers (ModularForms §10D, ModularCurvesPartII §1.1), the EffectiveClassNumbers sections no longer cited, and the dropped hypothesis `hgen` with its justification; "the same six theorems, five unchanged" agrees with the file. No sentence is contradicted and no change is left unstated.
- Source locators: none in the changed passages; the seeded sample (§§1.1–3.6) falls in untouched text, verified in the previous review.

Overlap check: read QuadraticCharactersAndReduction, AnalyticNumberTheoryPartI and MultiquadraticPartII on main, EffectiveClassNumbers and ComplexMultiplicationAndExplicitReciprocity at their open heads (scopes as in the previous review; the change touches no shared object). `χ_D`: owned by the pinned Tau Ceti library, consumed here and by QuadraticCharactersAndReduction. Siegel's ineffective bound, the class-number-one theorem, the CM dictionary of §3.1: owned here, cited by EffectiveClassNumbers and ComplexMultiplicationAndExplicitReciprocity. Effective bounds of Goldfeld's type: EffectiveClassNumbers. Complex uniformization: ModularForms §10D and ModularCurvesPartII §1.1, consumed here.

Source independence: changed passages only; 2 passages compared with 1 source (shin2010, Theorem 5.2 and Table 1, which states the result by discriminant and has no radicand form), none shared; largest share shin2010, 14 of 22 locators; contents not compared again (no layer added, removed or reordered; independent in the previous review).

Research link: Siegel's theorem (1935, via Davenport Chapter 21) and the Heegner–Stark class-number-one theorem (Heegner 1952, Stark 1967 and 1969) proved by Shin's Siegel-function route (2010); consumed by EffectiveClassNumbers and ComplexMultiplicationAndExplicitReciprocity. Rests on the README's References and Downstream consumers and on shin2010 lines 61–66.

## Not verifiable

- davenport1980, Chapters 6 and 21 (§§2.1–2.4): settled as uncertified; not opened.
- stark1969 (§3.3) and Stark 1967: settled as uncertified or no legal open copy; not opened.
- Cox, *Primes of the Form x² + ny²*, Theorems 7.7 and 7.24 (§§1.3–1.4): no legal open copy; not opened.

Automatic checks set aside as false positives: none failed; the listing of elaborated signatures reports two declarations that do not exist, read from the words after "theorems" and "class" in docstrings of the Lean file.

## Source issues

- **Misprint** in shin2010 at Proposition 2.5, p. 5: the source lists ±[[−1, −3], [1, −2]], of determinant 5, in the kernel for ℚ(√−3); it should be ±[[1, −3], [1, −2]], the matrix of the unit τ_K − 2; affects nothing.

## For the human reviewers

- AnalyticNumberTheoryPartI on main says the effective forms of this roadmap's §§2.3–2.4 follow from its own exclusion of Landau–Siegel zeros, an open problem; this README states no effective form and relies on none (Scope).
- The group isomorphism `ℂ/Λ ≅ E_Λ(ℂ)` is stated by two roadmaps on main, ModularForms §10D and ModularCurvesPartII §1.1; this README consumes both (§3.1).
- Davenport, Stark 1967/1969 and Cox could not be read, so the wording of §§1.3–1.4 and Layer 2 was not compared with them; shin2010, the source with the largest share, was read in full in the previous review.
