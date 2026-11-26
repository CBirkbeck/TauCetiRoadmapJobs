# Review of AmenableGroups (pull request #3170 at 57376f9)

**Verdict:** accepted

**Summary.** A review of the change against `main`: 47 changed lines since `87e7f72`. Accepted with no findings. The two new §7.6 statements are true for every measure on every measurable space: the functional–content correspondence is additive, and it is an order isomorphism for the order by positivity of the difference. Its two Checks compute correctly. The reason the README gives for stating both on values holds at the pinned Mathlib, and `Suggested.lean` elaborates with only `sorry` warnings. There are two small corrections, none blocking: the additivity statement holds by unfolding the definitions, and the description's count of roadmaps is wrong. There are four format notes, one of them on untouched text. Nothing is left for the human reviewers to decide.

## C01 — The additivity statement `addContentLpTopEquiv_add_apply` holds by unfolding the definitions, so as a target it asks an implementer for nothing

A reader of `Suggested.lean` would take it for one of the roadmap's acceptance tests, but it contains no work. At the pins the content of `M` at `s` is `M [1_s]` for measurable `s` and `0` otherwise (`LinearMap.toAddContentLpTop_apply` and `LinearMap.toAddContentLpTop_of_not_measurableSet`, `TauCeti/MeasureTheory/Function/Lp/AddContent.lean` lines 100 and 106), and the sum of positive maps evaluates pointwise (`Mathlib/Algebra/Order/Module/PositiveLinearMap.lean` line 163). I ran the statement on a copy of the file: a case split on `MeasurableSet s`, followed by `simp` with those two lemmas, closes it. The README's own route says the same ("additivity is `map_add` at each indicator", line 1113). The order statement `le_iff_addContentLpTopEquiv_le` is different: `simp` does not close it, and its converse needs continuity and the density of simple classes.

There are two possible repairs. One is to mark `addContentLpTopEquiv_add_apply` in its docstring as a sanity check of the correspondence. The other is to keep additivity as a README statement, with its name written in prose, and leave the order statement as the §7.6 test in `Suggested.lean`.

## C02 — The description says the pull request adds targets to fifteen roadmaps; it changes sixteen

The sentence "This PR adds planned targets to fifteen roadmaps" disagrees with the title ("sixteen roadmaps") and with the description's own list, which has sixteen bullets. The pull request changes sixteen roadmap folders, AmenableGroups among them. "sixteen roadmaps" would be right.

## N01 — §7.6 leaves the packaged `AddEquiv` and `OrderIso` to a time "once those instances exist" (line 1112)

As written, the roadmap neither plans the packaged maps nor places them outside its scope. The stated reason also covers only one side: the `OrderIso` needs an order on positive functionals as well, and the pinned Mathlib has none (`Mathlib/Algebra/Order/Module/PositiveLinearMap.lean` gives `Add` and `AddCommMonoid` at lines 163 and 193, and no `LE`). The clause could be dropped, since the two statements together with the bijection already say everything. Alternatively, the packaged maps could become a target that names the sum of contents and the two orders they need. The matching sentence in the module docstring of `Suggested.lean` would change with it.

## N02 — The new §7.6 paragraph (lines 1107–1121) does not say for which measures it holds

The surrounding text of §7.6 is about Haar measure on `G`. Both Lean statements, and the two-point Check, take any measure on any measurable space. A clause such as "for every measure `μ` on a measurable space `α`" would make the README and the Lean agree.

## N03 — The *Needs:* line of the new targets closes the Checks paragraph (line 1121) instead of the statement's paragraph

The converse route also uses the continuity of positive functionals (§7.1, line 907) and `LinearMap.ext_linftyIndicator`. Moving the line up to the statement's paragraph and naming both would match the route.

## N04 — Untouched text: README §4.3, line 625, uses "a section `s` of `φ`" for a `φ` that need not be surjective

The general statement takes any `φ : G →* Q` with `ker φ ≤ range ψ`. A trivial `φ` onto `ℤ/2` has no section. The library first corestricts `φ` to its range (`TauCeti.Amenable.of_ker_le_range`, `TauCeti/GroupTheory/Amenable/Extension.lean`), and "after replacing `Q` by the range of `φ`" would say so.

## Earlier findings

The previous review of this roadmap, on an earlier pull request that has since merged, raised no findings. Two of its small corrections are repaired on main. The sentence calling the §7.4 smoothing a Bochner integral of translates is gone, and the §7.3 route (lines 999–1010) now names the interchange of integrals and its inputs. Its three format notes concern untouched text. The note on §4.3 still stands and is N04 above. The other two still stand and are not repeated: the module docstring of `Suggested.lean` presents seven results as headlines where the README summary names four, and several statements lack locators. The worker's automatic checks all passed on this head.

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| §7.6 additivity, README and `addContentLpTopEquiv_add_apply` | `μ = 0`; two-point counting measure; nonmeasurable `s` | `0 = 0+0`; singletons `a+a'`, `b+b'`, whole set `a+a'+b+b'`; `0 = 0+0` | true; closes by case split and `simp` (C01) |
| §7.6 order, README and `le_iff_addContentLpTopEquiv_le` | `μ = 0`; `⊥` σ-algebra with `μ univ = 1`; two-point counting | `L∞ = {0}`, both sides true; `M = a·`, contents `(0, a)`, `a ≤ a'` on both sides; see next rows | true in both directions |
| Check: pointwise order on all `φ` | general; two-point | `M(−φ) = −Mφ ≤ −M'φ` gives `M'φ ≤ Mφ`, so `M = M'`; `(a,b) ≤ (a',b')` only when equal | true; separates it from the positivity order |
| Check: two-point set | `M(x,y) = ax + by`, `a, b ≥ 0` | contents `∅↦0`, `{p}↦a`, `{q}↦b`, `{p,q}↦a+b`; both orders `a ≤ a'`, `b ≤ b'` | true |
| Route, converse of monotonicity | `M' − M` against integration of `ν' − ν` | agree at `1_s`: `ν'(s) − ν(s)`; continuity `continuous_lpTop` (One.lean 89); equality `ext_linftyIndicator` (Indicator.lean 147) | sound; inputs pinned |
| "Pinned `AddContent` has no addition or order" | Mathlib `AddContent.lean`; `PositiveLinearMap.lean` | instances only `Inhabited` (83) and `FunLike` (89); positive maps `Add` (163), `AddCommMonoid` (193), no `LE` | true; order on functionals also missing (N01) |
| Scope sentence, §7.6 remaining targets | pinned Tau Ceti searched for additivity or order of `toAddContentLpTop` | no declaration outside `AddContent.lean`, and none there | consistent |
| Headline §7.5, `amenable_iff_exists_lpTop_invariant_of_isHaarMeasure` (unchanged) | trivial `G`; `F₂` discrete with counting measure | `M = id` on `ℝ`, both sides true; neither side holds | true; pin has only the reverse (Linfty.lean 159) and the discrete case (234) |
| Headline Følner, `TauCeti.amenable_iff_exists_finset` (DiscreteFoelner.lean 169) | `ℤ`, `K = {1}`, `F = {0..n−1}`; `F₂` | `|(1+F) △ F| = 2 < εn` for `n > 2/ε`; none | true; `[DiscreteTopology G]` in scope |
| Headline Tarski and free group (Tarski.lean 98; Paradoxical.lean 61) | `ℤ`; `FreeGroup Unit ≅ ℤ`; `F₂` | amenable, not paradoxical; `[Nontrivial α]` excludes rank 1; paradoxical | true |
| C02, description count | diff stat; bullets; title | 16 folders changed, 16 bullets, title "sixteen", text "fifteen" | wrong count |
| N04, §4.3 section | trivial `φ : G → ℤ/2` | `φ(s(1)) = 0 ≠ 1`, so no section | needs corestriction |

- Elaboration of `Suggested.lean` at the pins: three messages, the `sorry` warnings at lines 54, 66 and 77. `#check @` of both new theorems shows the README's binders: any measurable space, any measure, two positive functionals. Nothing was changed.
- One-tactic probe: `simp` and `rfl` fail on both new theorems. Additivity closes with `by_cases` and `simp` using two pinned lemmas (C01). The forward half of the order statement closes in a few lines; the converse needs density.
- Library declarations opened at the pins: 14. They are `toAddContentLpTop`, its `_apply` and `_of_not_measurableSet` lemmas, `ofAddContentLpTop`, `addContentLpTopEquiv`, `coe_addContentLpTopEquiv_apply`, `LinearMap.ext_linftyIndicator`, `PositiveLinearMap.ext_linftyIndicator`, `continuous_lpTop`, Mathlib `AddContent` (structure and instances), the `PositiveLinearMap` instances, `Amenable.of_ker_le_range`, `amenable_iff_exists_finset` and `amenable_iff_not_paradoxical_univ`.
- Cross-roadmap citations: the change adds none. BanachSpaceTheory §5.8 (on main, around line 1114, and at its open revision, lines 1665–1702) takes `PositiveLinearMap.addContentLpTopEquiv` as the positive case of its signed dual and cites AmenableGroups Layer 7, so supply runs from here to there.
- Dependency check: `depcheck: 122 roadmaps, 1386 edges, 0 problem(s)`; no UPWARD or CYCLE line. Every automatic check passed. No file changes outside the roadmap folders the pull request owns.
- Record: the README at the merge base and at this head have the same eight layers and the same headings; no item is removed.

Overlap check: I read KestenAmenabilityAndSpectralRadius (open), BanachSpaceTheory (on main and at its open revision), and AmenableTracesOnCStarAlgebras, ClassicalErgodicTheory and OperatorAlgebraDynamics (main). One shared object: the dual of `L∞` as finitely additive charges. BanachSpaceTheory §5.8 owns its signed, normed form and consumes this roadmap's positive correspondence. The additivity and order of the positive correspondence belong here. Nothing else is shared.

Source independence: changed passages only. Five passages compared: the §7.6 statement, its route, its Checks, the scope sentence, and the two new docstrings with the docstring paragraph in `Suggested.lean`. None of them cites a source, so they were compared with the nearest texts, the pinned module docstring of `TauCeti/MeasureTheory/Function/Lp/AddContent.lean` and BanachSpaceTheory §5.8. They share only declaration names. Largest share of locators: Garrido, unchanged by this change. No layer is added, removed or reordered, so the arrangement was not compared.

Research link: Layer 7's headline is (i) ⇔ (v) of Bekka–de la Harpe–Valette, Theorem G.3.1 (2008). Layer 8 is Tarski's alternative, from Ceccherini-Silberstein–Grigorchuk–de la Harpe (1999). The new §7.6 statements are the positive part of the duality `(L∞)* ≅ ba(μ)`, which BanachSpaceTheory §5.8 develops. This rests on the README, its References and the `Suggested.lean` docstring.

## Not verifiable

- No source text was read. The change cites no source, and the seeded sample (§§1.1–8.3) lies outside the changed and affected passages, so it was not rechecked in this review.

## Source issues

- none

## For the human reviewers

- none
