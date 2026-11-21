# Review of AxKochenErshov (pull request #2868 at 0c305d6)

**Verdict:** accepted

**Summary.** Accepted: the one finding of the previous review is repaired. Section 3.1 now states the Hensel configuration in full for `f ∈ K[X]`, with the ball of the root, and I recomputed its definition, its route and both of its Checks; the four small corrections and two format notes of the previous review are repaired as well, and none of the repairs introduces a false statement. There are one small correction (the description does not name RandomGraphs as a supplier) and two format notes, none blocking. The main source (van den Dries's lectures) could again not be read legally, so its locators and page numbers are unchecked; that is left to the human reviewers.

## C01 — The description's list of dependencies does not name RandomGraphs, which the README now lists as a supplier

A reader of the pull request cannot tell that it must merge after RandomGraphs, which is still an open pull request of another author. The head adds a supplier contract "From RandomGraphs" (README lines 584–588) for §5.2 of that roadmap (`boundedCode`, `FormulaAlphabet`, `boundedDecode`), which 0.2 uses for "computable on the codes of formulas"; I resolved the three names in RandomGraphs §5.2 at the head of its pull request (README lines 765–769 there). The description's **Dependencies** list names SaturationAndQuantifierElimination, LocalFieldsRamificationPartII, Mathlib and Tau Ceti only. Text that would be right, as one more bullet: "RandomGraphs §5.2 (the coding of formulas, `boundedCode`), for the computability of the translations of 0.2. This PR merges after it."

## N01 — The route of 3.1 applies Hensel's lemma to `g(Y) = 1 + Y + Σ cᵢYⁱ`, which is not monic, while the henselian axiom of 0.1 and Mathlib's `HenselianLocalRing.is_henselian` (`Mathlib/RingTheory/Henselian.lean`, line 95) are for monic polynomials. The step is true; a clause would save an implementer the search: apply the axiom to the reversed polynomial `Yⁿ + Yⁿ⁻¹ + c₂Yⁿ⁻² + … + cₙ`, monic with simple residue root `−1`, and invert the unit root.

## N02 — Kuhlmann 2010 is cited as "Example 4.16, p. 434". In the arXiv version (1003.5639v1) the example with these data is Example 4.17 (pp. 41–42 there), and 4.16 is a lemma; the page 434 fits the journal's pagination. Adding "(Example 4.17 in arXiv:1003.5639v1)" would let a reader without the journal find it.

## Previous findings

- R01 — repaired: "`f, a` is in *Hensel configuration* … when `f'(a) ≠ 0` and either `f(a) = 0`, or `f(a) ≠ 0` and, with `γ = |f(a)/f'(a)|`, `|f_i(a)|·γⁱ < |f(a)|` for every `i ≥ 2`" (3.1, lines 241–252), with the unique root in `|b − a| ≤ γ`.

The previous small corrections and format notes: C01 repaired (Layer 1, lines 156–159, points and `K` counted as balls); C02 repaired (5.2, lines 357–360, the data on `K`, `K'`, the elementary form of 5.1, the language `valLang`); C03 repaired (2.2 line 197 now derives the absence of a pseudolimit; 3.5 lines 293–298 drops "`Γ` divisible" with the splitting argument); C04 repaired (Boundaries, lines 559–563); N01 repaired (module docstring lines 27–30; 0.2 lines 117–118); N02 repaired (the contract "From RandomGraphs"; the labels [Ershov 1965] and [Ershov 1965b] in the References). The question on Kuhlmann's numbering is answered by a page number that I could not check in the published version (N02); the question on van den Dries's Introduction is answered by "p. 57, stated there without proof", which I could not check.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 3.1 definition and root | `g(Y) = f(a + (f(a)/f'(a))Y)/f(a)`; `f(a) = 0` | `g = 1 + Y + Σ cᵢYⁱ`, `|cᵢ| = |f_i(a)|γⁱ/|f(a)| < 1`; residue `1 + Y`, root `−1` simple; lifted root a unit, so `|b − a| = γ`; `f(a) = 0`: `γ = 0`, `b = a` | true | none |
| 3.1 route, non-monic `g` | reversed polynomial, degree `n` | `Yⁿ + Yⁿ⁻¹ + …`, residue `Yⁿ⁻¹(Y + 1)`; derivative at `−1` is `(−1)ⁿ⁻²(−n + n − 1) = ±1`, a unit | true; monic axiom suffices | N01 |
| 3.1 Check 1 (`f ∈ V[X]`, `a ∈ V`) | `|f(a)| < |f'(a)|²`, `f(a) ≠ 0` | `γ = |f(a)|/|f'(a)| < |f'(a)| ≤ 1`; `|f_i(a)|γⁱ ≤ γ²`; `γ² < |f(a)|` iff `|f(a)| < |f'(a)|²` | true | none |
| 3.1 Check 2 | `f = p⁻²X² + X + p`, `a = 0`, all `p` | `γ = |p|`; `|f_2(0)|γ² = 1 ≮ |p|`; Newton points `(0,1), (1,0), (2,−2)`, line at `1` is `−1/2 < 0`, roots of valuation `3/2`; discriminant `(p − 4)/p`, `−1` for `p = 2` | true | none |
| 2.2 transcendental type has no pseudolimit in `K` | pseudolimit `a ∈ K`, `f = X − a` | `|f(aᵢ)| = |aᵢ − a|` eventually strictly decreasing: algebraic type by the definition of 2.1 | true | none |
| 3.5 without "`Γ` divisible" | `Γ` arbitrary, `k×` divisible; `Γ` free, any `k` | `1 + 𝔪` divisible (`Xⁿ − u` has simple residue root `1`, `n` a unit); `O× ≅ k× × (1 + 𝔪)` divisible, hence injective, sequence splits; `Γ` free: projective, splits; then `K` and `HahnSeries Γ k` are maximal immediate over `k(s(Γ))`, isomorphic by 3.4 | true | none |
| Layer 1, one-variable definable sets | `{0}`; `K` | with points and `K` counted as balls, `{0}` is a ball and a Swiss cheese; without, every cheese is infinite | true as now worded | none |
| 5.2 | reduct from the structure with lifting and cross-section to `valLang` | a map elementary in an expansion is elementary in the reduct; the stated conclusion is at most the source's | consistent | none |
| 0.2 against `exists_residueSentence`, `exists_valueGroupSentence` | `n = 0` free variables | Lean: `∃ ψ, ∀ K V, (K ⊨ ψ ↔ k ⊨ φ)`, sentences only; README now says "state the case of sentences" | README and Lean agree | none |
| Boundaries: PadicallyClosedFields against LogicAndDefinabilityInNumberTheory §2.2 | `d = 1`, `F = ℚ_p` | `pcLang 1`: `u₁ = 1`, parameter-free, for the theory; §2.2: ring language with coefficients from `F`, one field | two different statements, said so | none |

The rows for the untouched statements stand as in the previous review, of `95fc24d`.

- Source locators checked against the text: 1 (Kuhlmann 2010, in the arXiv version: Kuhlmann2010 lines 1633–1651 give the field, the polynomial, the unique prolongation and immediacy as the Check of 3.5 uses them; numbered Example 4.17 there). van den Dries 2014 (Def. 4.19 p. 108, Lem. 4.20 p. 109, Introduction p. 57): not readable.
- Library declarations opened at the pin: `HenselianLocalRing` (`Mathlib/RingTheory/Henselian.lean`, line 95; monic polynomials only).
- Cross-roadmap citations resolved: RandomGraphs §5.2 at the head of its pull request (`boundedCode`, `FormulaAlphabet`, `boundedDecode`, lines 765–769); PadicallyClosedFields at the head of its pull request (`pcLang d`, constants for a basis of `O/pO`, power predicates, lines 66, 339–350, 510–513); LogicAndDefinabilityInNumberTheory §2.2 at the head of its pull request (lines 271–273).
- Dependency check: `depcheck: 171 roadmaps, 1989 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks: all passed. Elaboration of `Suggested.lean`: `sorry` the only warning (11); no `set_option`; nothing changed outside the folder. The diff changes only the module docstring of `Suggested.lean`, no statement; the elaborated signatures (21 declarations, none with a lost binder) stand.
- Pull request text read against the head: one omission (C01); no sentence contradicted.
- Overlap check: read PadicallyClosedFields, SaturationAndQuantifierElimination, LogicAndDefinabilityInNumberTheory, LogicAndDefinabilityInNumberTheoryPartII, RandomGraphs, LocalFieldsRamificationPartII, QuadraticFormInvariantsPartII; the coding of formulas (`boundedCode`): owner RandomGraphs, cited here; the elimination in `pcLang d`: owner PadicallyClosedFields, not stated here; Macintyre's elimination over a fixed field: owner LogicAndDefinabilityInNumberTheory, not stated here; the other shared objects as in the previous review.

Source independence: changed passages only: 1 passage compared with 1 source (Kuhlmann 2010, arXiv version), none shared; the passages of 3.1 could not be compared with van den Dries 2014, which is unreadable; largest share van den Dries 2014, about 71 of 86 locators; its table of contents could not be read, and no layer was added, removed or reordered.

Research link: The headline targets are the theorems of Ax–Kochen (1965–66) and Ershov (1965) on henselian valued fields and `ℚ_p`, and of Basarab (1978) for finite ramification; Anscombe–Jahnke (2022), which the previous review read, extends the unramified case to imperfect residue fields from the same statements. Rests on the README's references and that text.

## Not verifiable

- van den Dries 2014 (Def. 4.19 and Lem. 4.20 with their pages 108–109, the hypothesis "`Γ` divisible" that 3.5 attributes to the source, the Introduction at p. 57, and every sampled target except 5.8): the DOI resolves only to a paywalled page; no locator, page, hypothesis or wording was checked against the text.
- The published numbering and page of Kuhlmann 2010 (Example 4.16, p. 434): the publisher's page offered no text; only the arXiv version was read.
- Basarab 1978, Ax–Kochen II and III, Ershov 1965 (both papers), Robinson 1956, Kaplansky 1942, Serre: as in the previous review.

## Source issues

- none

## For the human reviewers

- **Not tested.** van den Dries 2014 carries about 71 of 86 locators and could not be read. By the README's own locators, Layers 1, 2–3 and 5.1–5.7 draw on its Chapters 3, 4 and 5–7 in that order; Layers 0, 4, 6 and 5.8 do not map to one chapter.
- **Scope.** The description places the roadmap in a series planned in an issue on the author's fork. Of the two series roadmaps the README names, PadicallyClosedFields is open as pull request #2905; CiFieldsAndArtinsConjecture is proposed nowhere yet.
