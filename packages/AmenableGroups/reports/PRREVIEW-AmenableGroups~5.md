# Review of AmenableGroups (pull request #3170 at dc6cd7c)

**Verdict:** accepted

**Summary.** A review of the change against `main`: 47 changed lines since `87e7f72`. Accepted with no findings. I checked the two new §7.6 statements (the functional–content correspondence is additive, and is an order isomorphism for the order by positivity of the difference), their route, their two Checks and the library claims at the pins; all hold, for every measure on every measurable space, and `Suggested.lean` elaborates with only `sorry` warnings. There is one small correction (the additivity statement holds by unfolding the definitions) and four format notes, one of them on untouched text; none blocks. Nothing is left for the human reviewers to decide.

## C01 — The additivity statement `addContentLpTopEquiv_add_apply` holds by unfolding the definitions, so as a target it asks an implementer for nothing

A reader of `Suggested.lean` takes it for one of the roadmap's acceptance tests, but it contains no work. At the pins the content of `M` at `s` is `M [1_s]` for measurable `s` and `0` otherwise (`LinearMap.toAddContentLpTop_apply` and `LinearMap.toAddContentLpTop_of_not_measurableSet`, `TauCeti/MeasureTheory/Function/Lp/AddContent.lean` lines 100 and 106), and a sum of positive maps evaluates pointwise (`Mathlib/Algebra/Order/Module/PositiveLinearMap.lean` line 163). On a copy of the file, a case split on `MeasurableSet s` followed by `simp` with those two lemmas closes it; `simp` alone and `rfl` do not. The README's own route says as much ("additivity is `map_add` at each indicator", line 1113). The order statement `le_iff_addContentLpTopEquiv_le` is different: `simp` does not close it, and its converse needs continuity and the density of simple classes.

Two repairs are possible. One is to mark `addContentLpTopEquiv_add_apply` in its docstring as a sanity check of the correspondence. The other is to keep additivity as a README statement, with its name in prose, and leave the order statement as the §7.6 test in `Suggested.lean`.

## N01 — §7.6 leaves the packaged `AddEquiv` and `OrderIso` to a time "once those instances exist" (line 1112)

As written, the roadmap neither plans the packaged maps nor places them outside its scope. The stated reason also covers one side only: the `OrderIso` needs an order on positive functionals too, and the pinned Mathlib has none (`Mathlib/Algebra/Order/Module/PositiveLinearMap.lean` has `Add` at line 163 and `AddCommMonoid` at line 193, and no `LE`). The clause could be dropped, since the two statements with the bijection already say everything, or the packaged maps could become a target naming the sum of contents and the two orders they need. The matching sentence of the module docstring of `Suggested.lean` would change with it.

## N02 — The new §7.6 paragraph (lines 1107–1121) does not say for which measures it holds

The surrounding text of §7.6 is about Haar measure on `G`; both Lean statements and the two-point Check take any measure on any measurable space. A clause such as "for every measure `μ` on a measurable space `α`" would make the README and the Lean agree.

## N03 — The *Needs:* line of the new targets closes the Checks paragraph (line 1121) instead of the statement's paragraph

The converse route also uses the continuity of positive functionals (§7.1) and `LinearMap.ext_linftyIndicator`. Moving the line up to the statement and naming both would match the route.

## N04 — Untouched text: README §4.3, line 625, uses "a section `s` of `φ`" for a `φ` that need not be surjective

The general statement takes any `φ : G →* Q` with `ker φ ≤ range ψ`; a trivial `φ` onto `ℤ/2` has no section. "After replacing `Q` by the range of `φ`" would say what is meant.

## Earlier findings

The previous review of this change raised no findings; the folder's text is the same as at the head it read. Of its two small corrections, the one on the description is repaired: the description now reads "adds planned targets to sixteen roadmaps", in agreement with its title and its sixteen bullets. The one on the additivity statement is not repaired and is C01 above. Its four format notes stand unchanged and are N01–N04. The automatic checks all passed on this head, and no file changes outside the roadmap folders the pull request owns.

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| §7.6 additivity, README and `addContentLpTopEquiv_add_apply` | `μ = 0`; two-point counting measure; nonmeasurable `s` | `0 = 0+0`; singletons `a+a'`, `b+b'`, whole set `a+a'+b+b'`; `0 = 0+0` | true; closes by case split and `simp` (C01) |
| §7.6 order, README and `le_iff_addContentLpTopEquiv_le` | `μ = 0`; trivial σ-algebra, `μ univ = 1`; nonmeasurable `s` | `L∞ = 0`, both sides true; `M = a·`, contents `(0, a)`, `a ≤ a'` both sides; `0 ≤ 0` | true in both directions |
| Check: pointwise order on all `φ` | general; two-point | `M(−φ) = −Mφ ≤ −M'φ` gives `M'φ ≤ Mφ`, so `M = M'`; `(a,b)`, `(a',b')` comparable only when equal | true; separates the two orders |
| Check: two-point set | `M(x,y) = ax + by`, `a, b ≥ 0` | contents `∅↦0`, `{p}↦a`, `{q}↦b`, `{p,q}↦a+b`; both orders are `a ≤ a'`, `b ≤ b'` | true |
| Route, converse of monotonicity | `M' − M` against integration of `ν' − ν` | `ν' − ν ≥ 0`, additive, zero on null sets (`[1_A] = 0`); both give `ν'(s) − ν(s)` at `1_s`; continuity One.lean 89; extensionality Indicator.lean 147 | sound; inputs pinned |
| "Pinned `AddContent` has no addition or order" | Mathlib `AddContent.lean`, `PositiveLinearMap.lean` | instances only `Inhabited` (83), `FunLike` (89); positive maps `Add` (163), `AddCommMonoid` (193), no `LE` | true; order on functionals also absent (N01) |
| Scope sentence, §7.6 remaining targets (line 1275) | pinned Tau Ceti searched for additivity or order of the content | `addContentLpTopEquiv` occurs only in `AddContent.lean`; no additivity or order lemma there | consistent |
| Headline §7.5, `amenable_iff_exists_lpTop_invariant_of_isHaarMeasure` (unchanged, cited by the change's docstring) | trivial `G`; `F₂` discrete | `M = id` on `ℝ`, both sides true; neither side holds | true |
| N04, §4.3 section | trivial `φ : G → ℤ/2` | `φ(s(1)) = 0 ≠ 1`: no section | needs corestriction |

- Elaboration of `Suggested.lean` at the pins: three messages, the `sorry` warnings at lines 54, 66 and 77. The elaborated types of both new theorems carry the README's binders (any measurable space, any measure, two positive functionals); nothing was changed.
- One-tactic probe on a copy: `simp` and `rfl` fail on additivity, `simp` fails on the order statement; additivity closes with `by_cases` and `simp` using two pinned lemmas (C01).
- Library declarations opened at the pins: 9 (`toAddContentLpTop`, its `_apply` and `_of_not_measurableSet` lemmas, `ofAddContentLpTop`, `addContentLpTopEquiv`, `LinearMap.ext_linftyIndicator`, `PositiveLinearMap.continuous_lpTop`, Mathlib `AddContent` instances, `PositiveLinearMap` instances).
- Source locators checked against a text: 0; the change cites no source.
- Cross-roadmap citations: the change adds none. BanachSpaceTheory §5.8 at its open revision (lines 1668, 1701) takes `PositiveLinearMap.addContentLpTopEquiv` as the positive case of its signed dual, so supply runs from here to there.
- Dependency check: `depcheck: 122 roadmaps, 1386 edges, 0 problem(s)`; no UPWARD or CYCLE line. Every automatic check passed.
- Record: the README at the merge base and at this head have the same eight layers and headings; no item is removed.
- Pull request text: the AmenableGroups bullet (§7.6, two declarations) and the count of sixteen roadmaps agree with the head.

Overlap check: read KestenAmenabilityAndSpectralRadius (open), BanachSpaceTheory (open revision), AmenableTracesOnCStarAlgebras, ClassicalErgodicTheory, OperatorAlgebraDynamics (main); one shared object, the dual of `L∞` as finitely additive charges: BanachSpaceTheory §5.8 owns the signed normed form and consumes this roadmap's positive correspondence, whose additivity and order belong here.

Source independence: changed passages only; 5 passages compared (the §7.6 statement, its route, its Checks, the scope sentence, the new docstrings) with 0 sources, since none cites one; set beside the module docstring of the pinned `AddContent.lean` and BanachSpaceTheory §5.8 they share only declaration names. Largest share of locators: Garrido, unchanged. No layer added, removed or reordered, so the arrangement was not compared.

Research link: Layer 7's headline is the equivalence of amenability with an invariant mean on Haar `L∞` (Bekka–de la Harpe–Valette 2008, Theorem G.3.1); the new §7.6 statements are the positive part of the duality of `L∞` with finitely additive set functions (Dunford–Schwartz §IV.8). Rests on the README and the pinned module's references.

## Not verifiable

- No source text was read: the change cites no source, and the seeded sample (§§1.3–7.4) lies in untouched passages the change does not affect.

## Source issues

- none

## For the human reviewers

- none
