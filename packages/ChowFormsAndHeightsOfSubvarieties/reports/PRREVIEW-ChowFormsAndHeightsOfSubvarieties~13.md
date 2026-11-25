# Review of ChowFormsAndHeightsOfSubvarieties (pull request #3027 at f0da4ff)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/ChowFormsAndHeightsOfSubvarieties/`
**Verdict:** accepted

**Summary.** An incremental re-review of the 42 lines changed since `cd123f8`: accepted, with no finding, three small corrections and one format note, none blocking. The two earlier corrections on the routes of 5.1 and 6.2 (a7) are repaired, and the new locators into [FormalProof] in 6.1 and 6.2 (b) were opened in its Lean source and say what the README says, with the constant `((d + 1)/2)·H_{N−1}·deg Z` recomputed from the source's definition. The corrections concern the References entry for [FormalProof], which still gives (b) "for a free lattice", one declaration cited under a file that does not contain it, and the pull request's description, which still does not say that this roadmap gains a supplier. A human still has to settle the two points of the previous review: Bost–Gillet–Soulé could not be read, and the licence of the formal proof was not checked.

## C01 — The References entry for [FormalProof] gives (b) "for a free lattice", but the form that 6.2 (b) now records is for a lattice spanned by finitely many vectors and for an integral `Z`

A reader who compares the two places cannot tell which form the family uses. The sentence of 6.2 (b) added here (lines 423–428) says "For `J = K^N` and `M_J` spanned over `O_K` by finitely many vectors … for an integral `Z` with an irreducible Chow form", and that is what [FormalProof] states: in `Development/WeilBound/CoreStatements/HomogeneousNonvanishing/VuSelfKnownTheorem.lean`, `PositivityTheory.UnitarySelfGeneration.ChowFormHeight` takes an `N × m` matrix `g` over `K` whose columns span `K^N` over `K`, with no freeness of their `O_K`-span (for `K = ℚ(√−5)`, `N = 1`, `g = (2, 1 + √−5)` the span is a non-principal ideal), and a Chow form with the field `irred`. The References entry (line 678) still reads "and (b) for a free lattice, that the family uses".

A fix: in line 678, "(b) for an integral `Z` and a lattice of `K^N` spanned by finitely many vectors". The `*Method of the formal proof:*` label of 6.2 (line 339, "for the lattice `O_K^N` with an arbitrary Hermitian metric") describes the core induction correctly; it would be complete with a clause that the form for a spanned lattice follows by a linear substitution.

## C02 — `ChowFormHeightComparison₂.chow_form_height_bound` is cited under a file that does not declare it

In the route of 6.1 (lines 169–170) the parenthesis after `Development/WeilBound/CoreStatements/HomogeneousNonvanishing/VuSelfKnownTheorem.lean` reads "(`PositivityTheory.UnitarySelfGeneration.ChowFormHeight`, proved as `ChowFormHeightComparison₂.chow_form_height_bound`)". That file holds the statement only (one definition). The theorem is declared in `Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/HodgeBundleWeights/ChowFormHeightComparison.lean`, line 9, so a reader who opens the cited file does not find it. Give the theorem its own file path, as the README does for the other proofs it cites (5.1, 6.1 (iii)).

## C03 — The pull request's description does not say that this roadmap gains a supplier

The README at the merge base does not name DiophantineApproximationAndTranscendence; this head has a contract "From TauCetiRoadmap.DiophantineApproximationAndTranscendence" for §1.3a, the spherical height in which HeightsRationalPointsAndObstructions §5.9b.1 states the general theorem of 6.1. The description names the new suppliers of other roadmaps of the family and does not mention this one. A clause would do: "ChowFormsAndHeightsOfSubvarieties gains DiophantineApproximationAndTranscendence §1.3a (added here) as a supplier, through HeightsRationalPointsAndObstructions §5.9b.1, of which its 6.1 is a corollary".

## N01 — `Chow.properPushforward` (Exact supplier contracts, line 659) is in code font

SchemeAndStackFoundations §5.2 writes it in italics as a proposed name, and no declaration has that name at the pins. Write it the way that roadmap does.

## Previous findings

The previous review, of `cd123f8`, had no finding. Its three small corrections and its format note:

- C01 — repaired: "(a1)–(a6) and (b) are proved here, by these routes; (a7), with the value and the bound of the height of `ℙ^{N−1}`, is deduced from the general theorem" (line 435); the overview (line 9) now "deduces its value on the whole space".
- C02 — repaired: "The route written here is that of HeightsRationalPointsAndObstructions §5.17a.1, recalled" (line 75); "the route written below is that of HeightsRationalPointsAndObstructions §5.9b.2, recalled" (line 437).
- C03 — not repaired: the description names no change of supplier for this roadmap; carried as C03.
- N01 — not repaired: "§5.2: `Chow.properPushforward`, with the residue-degree weights" (line 659); carried as N01.

## Verified sound

| Statement | Instances tried | Values computed (this side / other side) | Result |
|---|---|---|---|
| 6.2 (b), constant, against `GlobalTheory.ChowHt.formHeight` of [FormalProof] | `d = 0`, `N = 2`, `deg = 1`; general `d`, `N`, `δ` | README `((d+1)/2)·H_{N−1}·deg Z = ½`; source: `B·δ·H_{N−1}/2` per embedding, summed and divided by `[K:ℚ]`, `B = d + 1`: `½` | agree |
| 6.2 (b), form recorded from [FormalProof] | `K = ℚ(√−5)`, `N = 1`, `g = (2, 1 + √−5)` | hypotheses: columns of `g` span `K^N` over `K`; `irred` on the Chow form; nonsingular matrix at every embedding. The example's lattice is not free | sentence of 6.2 right; References entry: C01 |
| 6.1, the two forms of [FormalProof] | standard lattice `g = 1`; reachability from the main theorems | `FubiniStudyChowHeight`: integral closed subscheme of `ℙ^N_{O_K}`, `g = 1`. Kernel export: its proof occurs, its only consumers (`isSelfInter_pull_fs`, `selfInter_le_of_chow`) occur 0 times | "no step … applies" holds |
| 6.2 (a7), value and bound, against HeightsRationalPointsAndObstructions §5.9b.2 | `N = 1, 2, 3, 4` | `½·Σ_{m<N} H_m = (N/2)(H_N − 1)`: `0, ½, 5/4, 13/6`; bound `(N/2)·log N`: `0, 0.693, 1.648, 2.773`; from `H_N ≤ 1 + log N` | holds; §5.9b.2 derives the bound from the value, as line 439 says |
| 5.1, route against HeightsRationalPointsAndObstructions §5.17a.1 | `f = t` constant | both: multilinearity, Cartier recursion along `s`, `‖s‖ → e^{−f}‖s‖`; `f = t` adds `[K:ℚ]·t·deg` on both sides | same route; "recalled" is right |

The rows of the previous review for the untouched statements stand as in that review, of `cd123f8`.

- [FormalProof] locators opened in its Lean source: 6 declarations in 6 files (`ChowFormHeight`, `FubiniStudyChowHeight`, `formHeight`, `IsChowFormInt`, `CF.StMain`, `CF.D.formHeight_one_eq`), and `chow_form_height_bound` in a seventh (C02).
- Kernel export of [FormalProof] scanned twice for 16 names: `ChowFormHeight`, `chow_form_height_bound`, `StMain`, `formHeight_one_eq` and `chowFormHeight_of_arch` occur; the two consumers of `FubiniStudyChowHeight` do not.
- Cross-roadmap citations resolved at this head: HeightsRationalPointsAndObstructions §5.17a.1 (line 2809) and §5.9b.2 (line 2512), both with the routes the changed text attributes to them; SchemeAndStackFoundations §5.2 (line 8059).
- Seeded sample (5.1, 6.1, 6.2): the changed passages in them cite no published source anew; their [FormalProof] and supplier citations are the ones above.
- Merge base against head: no layer or section removed, renamed or renumbered; no Lean declaration changed; the diff since `cd123f8` touches `README.md` only.
- Changes outside the folder: every other changed roadmap folder is one of this pull request's own.
- Dependency check: `depcheck: 119 roadmaps, 1369 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks: the worker's run passed every check. Elaboration: `lake env lean` on `Suggested.lean` exits 0 with no message; the file declares nothing (single `import Mathlib`, no `set_option`, no `sorry`), so there is no signature to compare and no one-tactic probe to run.
- Overlap check: read HeightsForLogSingularMetrics, SlopesOfHermitianVectorBundles, ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties and HeightsRationalPointsAndObstructions at this head, and HeightsRationalPointsAndObstructionsPartII (open) as for the previous review. HeightsRationalPointsAndObstructions owns the change-of-metric formula, the comparison identity and the height in `ℙ(J^∨)` with (a7); DiophantineApproximationAndTranscendence §1.3a and SlopesOfHermitianVectorBundles §6.6 own the spherical heights; this roadmap cites each. Nothing else is shared.

Source independence: changed passages only. Five passages were compared with one source, [FormalProof] (the two sentences of 6.1 and the sentence of 6.2 (b) that record its forms, and the two route sentences of 5.1 and 6.2): they share file paths and declaration names only, and no published source's wording is touched. The largest share is unchanged: BGS94 (unreadable) and Philippon91, 10 of about 34 mentions each. The arrangement was not compared, since no layer is added, removed or reordered.

Research link: 6.1 compares the Arakelov height of a projective cycle with Philippon's spherical height of its Chow form (Soulé 1991, Théorème 3; Philippon 1991, Théorème 2; Bost–Gillet–Soulé 1994). 6.2 (a7) is the height of projective space with Sombra's (2005) bound from successive minima. The line rests on the README's References and on Soule91, Philippon91 and Sombra05 as read.

## Not verifiable

- BGS94 (Proposition 3.2.1 (iv), (3.2.2), Lemma 3.3.1, §4.1, Proposition 4.1.2, (4.1.4), Theorem 4.3.2, (4.3.12), Theorem 4.3.8): no legal copy in the sources cache or through the sources service. The change since `cd123f8` adds no locator into it.

## Source issues

- none

## For the human reviewers

- Not tested: BGS94 shares the largest number of source mentions (10 of about 34, with Philippon91) and could not be read. Its locators and wording were not compared, apart from two numbers that Sombra05 restates.
- The convention on corollaries (README lines 28–35) keeps in the family, with their own routes, statements that a general roadmap now owns: 5.1, the identity of 6.1 and 6.2 (a7) are those of HeightsRationalPointsAndObstructions §§5.17a.1, 5.9b.1 and 5.9b.2.
- [FormalProof] (README line 678) is an external formalisation; its licence was not checked.
- In [FormalProof], `chow_form_height_bound` takes a bundle of published statements as a hypothesis and uses its component on the existence of arithmetic intersection numbers; the README's "proved as" (line 170) leaves that implicit.
