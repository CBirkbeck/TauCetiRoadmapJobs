# Review of AmenableGroups (pull request #3170 at 0c3be17)

**Verdict:** accepted

**Summary.** An incremental re-review of 24 changed lines since `dc6cd7c`, with the pull request's title and description read against this head. Accepted with no findings. The one small correction of the previous review is repaired: the additivity statement of §7.6 has left `Suggested.lean`, stays in the README in prose, and the docstring's claim that it follows from two pinned evaluation lemmas checks out in Lean. The title and the description agree with the head for this folder. There are no small corrections and four format notes, carried over unchanged; nothing is left for the human reviewers to decide.

## N01 — §7.6 leaves the packaged `AddEquiv` and `OrderIso` to a time "once those instances exist" (line 1113)

As written, the roadmap neither plans the packaged maps nor places them outside its scope, and the stated reason covers one side only: the `OrderIso` also needs an order on positive functionals, which the pinned Mathlib lacks (`Mathlib/Algebra/Order/Module/PositiveLinearMap.lean` has `Add` at line 163 and `AddCommMonoid` at line 193, and no `LE`). The clause could be dropped, or the packaged maps could become a target naming the sum of contents and the two orders they need; the matching sentence of the module docstring of `Suggested.lean` would change with it.

## N02 — The §7.6 paragraph on additivity and order (lines 1107–1121) does not say for which measures it holds

The surrounding text is about Haar measure on `G`; the Lean statement and the two-point Check take any measure on any measurable space. A clause such as "for every measure `μ` on a measurable space `α`" would make the README and the Lean agree.

## N03 — The *Needs:* line of the §7.6 order target closes the Checks paragraph (line 1121) instead of the statement's paragraph

The converse route also uses the continuity of positive functionals (§7.1) and `LinearMap.ext_linftyIndicator`. Moving the line up to the statement and naming both would match the route.

## N04 — Untouched text: README §4.3, line 625, uses "a section `s` of `φ`" for a `φ` that need not be surjective

The general statement takes any `φ : G →* Q` with `ker φ ≤ range ψ`; a trivial `φ` onto `ℤ/2` has no section. "After replacing `Q` by the range of `φ`" would say what is meant.

## Previous findings

The previous review, of `dc6cd7c`, raised no findings (no R-numbered point). Its other remarks:

- C01 — repaired: `addContentLpTopEquiv_add_apply` is no longer declared; README line 1109 reads "the content of `M + M'` is the sum of the contents", with no code-font name; the module docstring says additivity "is not restated here".
- N01–N04 — not repaired: the passages are unchanged and the notes are written again above; none blocks.

The repair introduced no new problem: the removed name occurs nowhere else in the folder, on main or in any open roadmap pull request, and the scope sentence of the README (line 1275, "the additivity and monotonicity of §7.6" among the remaining targets) still agrees with the README's statement.

The pull request's title and description against this head: the count of sixteen roadmaps equals the sixteen bullets and the sixteen folders changed; the AmenableGroups bullet (§7.6, one declaration `le_iff_addContentLpTopEquiv_le`, additivity "stated in the README only") and the sentence "in ClassFieldTheory and AmenableGroups part of it" agree with the head; the pin `2fd255d` is the Tau Ceti revision of the manifest; the description says the change adds targets to roadmaps (a revision), and for this folder no heading, layer or supplier is removed or added. Nothing to correct.

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| §7.6 order, README and `le_iff_addContentLpTopEquiv_le` (kept; cited by the changed docstring) | `μ = 0`; counting measure on `{p, q}`; nonmeasurable `s` | `L∞ = 0`: left vacuous-true, contents `M 0 = 0`, `0 ≤ 0`; `M = (a,b)`, `M' = (a',b')`: left `ax+by ≤ a'x+b'y` for `x,y ≥ 0` iff `a ≤ a'`, `b ≤ b'`; right `0≤0`, `a≤a'`, `b≤b'`, `a+b≤a'+b'`, the same; `0 ≤ 0` | true both directions; `simp` and `Iff.rfl` fail on a copy, so not padding |
| §7.6 additivity, README prose (line 1109) and docstring claim "follows from the pinned evaluation lemmas" | two-point counting measure; nonmeasurable `s`; Lean probe | `{p} ↦ a+a'`, `{q} ↦ b+b'`, whole set `a+a'+b+b'`; `0 = 0+0`; `by_cases` on `MeasurableSet s` then `simp` with `toAddContentLpTop_apply`, `toAddContentLpTop_of_not_measurableSet` closes it | true; docstring claim confirmed |
| Docstring: `AddContent` at the pins lacks addition and a pointwise order | Mathlib `MeasureTheory/Measure/AddContent.lean` | instances only `Inhabited` (83) and `FunLike` (89) | true |
| Headline §7.5, `amenable_iff_exists_lpTop_invariant_of_isHaarMeasure` (untouched) | trivial `G` | `L∞ = ℝ`, `M = id`, `M 1 = 1`, invariant; `Amenable` holds: both sides true | true |

The rows for the untouched statements stand as in the previous review, of `dc6cd7c`.

- Elaboration of `Suggested.lean` at the pins: two messages, the `sorry` warnings at lines 56 and 69. Elaborated types of both theorems compared with the README (§7.5: locally compact Hausdorff group, regular Haar measure; §7.6: any measurable space, any measure, two positive functionals); no binder lost, nothing changed.
- One-tactic probe on a copy: `simp` and `exact Iff.rfl` both fail on the order statement.
- Library declarations opened at the pins: 5 (`LinearMap.toAddContentLpTop_apply` line 100, `LinearMap.toAddContentLpTop_of_not_measurableSet` line 106, `PositiveLinearMap.addContentLpTopEquiv` line 254 of `TauCeti/MeasureTheory/Function/Lp/AddContent.lean`; Mathlib `AddContent` instances; `PositiveLinearMap` instances lines 163, 193).
- Source locators checked against a text: 0; the change cites no source and the seeded sample lies in untouched passages.
- Cross-roadmap citations: the change adds none; the removed name is cited by no roadmap on main or open.
- Dependency check: `depcheck: 100 roadmaps, 1122 edges, 0 problem(s)`; no UPWARD or CYCLE line. Every automatic check passed on this head.
- Record: merge base and head have the same eight layers and headings; no item removed. No file changes outside the sixteen roadmap folders the pull request owns.
- Pull request text: title and description checked sentence by sentence for this folder; no contradiction, no unstated change.

Overlap check: read KestenAmenabilityAndSpectralRadius (open), BanachSpaceTheory (open revision), AmenableTracesOnCStarAlgebras, ClassicalErgodicTheory, OperatorAlgebraDynamics (main); one shared object, the dual of `L∞` as finitely additive charges: BanachSpaceTheory §5.8 owns the signed normed form and consumes this roadmap's positive correspondence, whose additivity and order belong here (as in the previous review; the change does not bear on it).

Source independence: changed passages only; 2 passages compared (the README sentence of line 1109 and the module docstring's §7.6 paragraph) with 0 sources, since neither cites one; beside the module docstring of the pinned `AddContent.lean` they share only declaration names. Largest share of locators: Garrido, unchanged. No layer added, removed or reordered, so the arrangement was not compared.

Research link: Layer 7's headline is the equivalence of amenability with an invariant mean on Haar `L∞` (Bekka–de la Harpe–Valette 2008, Theorem G.3.1); the §7.6 statements are the positive part of the duality of `L∞` with finitely additive set functions (Dunford–Schwartz §IV.8). Rests on the README and the pinned module's references.

## Not verifiable

- No source text was read: the change cites no source, and the seeded sample lies in untouched passages the change does not affect.

## Source issues

- none

## For the human reviewers

- none
