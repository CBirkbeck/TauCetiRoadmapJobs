# Review of ImaginaryQuadraticClassNumber (pull request #2593 at be58763)

**Verdict:** accepted

**Summary.** Accepted: no finding. The folder is unchanged since the previous review; this round read the pull request's description against the head and against the change from main, and found no sentence the head contradicts and no removed section, declaration or supplier left unstated. The one small correction of the previous review (the sentence about the old §3.1 anchor) is repaired in the description. No small correction and no format note; three facts are left for the human reviewers, as before.

## Previous findings

The previous review, of `be58763`, had no finding (no R-numbered point). Its one other remark:

- C01 — repaired: the description now reads "the old anchor of §H3.1, the only one other roadmaps link to (two open roadmaps use it), is kept as an inline anchor before §3.1, and a link to any other old anchor lands at the top of the README"; README line 634 has that anchor.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §3.6 radicand form, as the description says it now stands (no generation hypothesis) | `K = ℚ(i)`, `θ = i`, `d = −1`; `K = ℚ(√−5)`, `θ = √−5`; `d = 2`; `d = 1`; `θ = 2i` | `h = 1`, `1 ∈ {1,2,3,7,11,19,43,67,163}`; `h = 2`, `5` not in the list; `√2` real, no totally complex degree-2 `K`: vacuous; `X² − 1` reducible, no `θ`; `d = −4` not squarefree, excluded | true; `minpoly` of degree 2 gives `[ℚ(θ):ℚ] = 2 = [K:ℚ]`, so generation is implied | none |
| §3.6 thirteen orders, as the description lists them among the six theorems | `f = 2, D = −7`; `f = 2, 3, D = −3`; `f = 2, D = −4`; `f = 4, D = −3` | `2(1 − 1/2) = 1`; `2(1 + 1/2)/3 = 1`, `3/3 = 1`; `2/2 = 1`; `4(1 + 1/2)/3 = 2`, so `−48` rightly absent | true | none |
| Description: "45 Checks" | bullets under the fourteen `**Checks.**` lists of the README | 45 counted | equal | none |
| Description: "the same six theorems … five are unchanged" | diff of `Suggested.lean` against main | 6 theorems on each side; 5 statements identical up to binders moved into the signature; one loses `hgen` | as described | none |

The rows for the untouched statements stand as in the previous review, of `be58763`.

- Changed passages: none in the folder (0 lines since `be58763`); nothing changed outside the folder (the diff against main outside it is empty).
- Description against the head, sentence by sentence: the README's outline (Summary, Conventions, Layers 1–3 each ending with Examples and Dependencies, fourteen `*Needs:*` lines for fourteen sections, Downstream consumers, Scope, supplier contracts, References); Convention 9 (every former label H1.1–H3.6 and H1–H3 mapped); the anchor at README line 634; the five supplier subsections (Mathlib, Tau Ceti, ClassFieldTheory Layers 10–13, ModularForms §10D, ModularCurvesPartII §1.1); each of the fourteen listed statement changes located at its section at the head and, where the description describes the old text, in the README on main; all agree.
- Against the change from main: no headline theorem or Lean declaration removed (6 before, 6 after); sections renumbered H k.n → §k.n and the removed "Required tests" list, both stated; one roadmap newly named as supplier (ModularCurvesPartII, on main), stated; none dropped; EffectiveClassNumbers confirmed absent from main, as the description says.
- Cross-roadmap links to the old §3.1 anchor at the open heads and on main: ArithmeticStatisticsPartVII (1) and ComplexMultiplicationAndExplicitReciprocity (10), two open roadmaps as the description says.
- Lean: `Suggested.lean` elaborates with six `sorry` warnings and nothing else.
- Dependency check: `depcheck: 182 roadmaps, 2081 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line. The automatic checks on this head all passed.
- Source locators: none in a changed passage; the seeded sample (§§1.1–3.6) falls in untouched text, verified in the earlier reviews. Library declarations opened this round: none (nothing changed names one).

Overlap check: read QuadraticCharactersAndReduction and AnalyticNumberTheoryPartI on main, EffectiveClassNumbers and ComplexMultiplicationAndExplicitReciprocity at their open heads (scopes as in the previous review; nothing changed touches ownership). `χ_D`: owned by the pinned Tau Ceti library, consumed here and by QuadraticCharactersAndReduction. Siegel's ineffective bound, the class-number-one theorem, the CM dictionary of §3.1: owned here, cited by EffectiveClassNumbers and ComplexMultiplicationAndExplicitReciprocity. Effective bounds of Goldfeld's type: EffectiveClassNumbers. Complex uniformization: ModularForms §10D and ModularCurvesPartII §1.1, consumed here.

Source independence: changed passages only; 0 passages compared (the folder did not change); largest share shin2010, 14 of 22 locators; contents not compared again (no layer added, removed or reordered; independent in the earlier review).

Research link: Siegel's theorem (1935, via Davenport Chapter 21) and the Heegner–Stark class-number-one theorem (Heegner 1952, Stark 1967 and 1969) proved by Shin's Siegel-function route (2010); consumed by EffectiveClassNumbers and ComplexMultiplicationAndExplicitReciprocity. Rests on the README's References and Downstream consumers and on shin2010 lines 61–66.

## Not verifiable

- davenport1980, Chapters 6 and 21 (§§2.1–2.4): settled as uncertified; not opened.
- stark1969 (§3.3) and Stark 1967: settled as uncertified or no legal open copy; not opened.
- Cox, *Primes of the Form x² + ny²*, Theorems 7.7 and 7.24 (§§1.3–1.4): no legal open copy; not opened.
- The description's "about 21 old tests, about 24 new" split of the 45 Checks and its "about 180 names checked with `#check`": the total and the names are at the head; the split and the author's checking were not recounted.

Automatic checks set aside as false positives: none failed; the listing of Lean declarations added against main reports one, `of`, that does not exist: it is the word after "theorem" in the module docstring of the Lean file.

## Source issues

- none

## For the human reviewers

- AnalyticNumberTheoryPartI on main says the effective forms of this roadmap's §§2.3–2.4 follow from its own exclusion of Landau–Siegel zeros, an open problem; this README states no effective form and relies on none (Scope).
- The group isomorphism `ℂ/Λ ≅ E_Λ(ℂ)` is stated by two roadmaps on main, ModularForms §10D and ModularCurvesPartII §1.1; this README consumes both (§3.1).
- Davenport, Stark 1967/1969 and Cox could not be read, so the wording of §§1.3–1.4 and Layer 2 was not compared with them; shin2010, the source with the largest share, was read in full in an earlier review.
