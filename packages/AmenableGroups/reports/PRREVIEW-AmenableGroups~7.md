# Review of AmenableGroups (pull request #3170 at 9552dbc)

**Verdict:** accepted

**Summary.** An incremental re-review of 0 changed lines since `0c3be17`, with the pull request's title and description read against this head. Accepted with no findings: the folder is identical to the head the previous review accepted, `Suggested.lean` still elaborates with only its two `sorry` warnings, and the title and description agree with the head for this folder. There are no small corrections and four format notes, carried over unchanged; nothing is left for the human reviewers to decide.

## N01 — §7.6 leaves the packaged `AddEquiv` and `OrderIso` to a time "once those instances exist" (line 1113)

As written, the roadmap neither plans the packaged maps nor places them outside its scope, and the stated reason covers one side only: the `OrderIso` also needs an order on positive functionals, which the pinned Mathlib lacks (`Mathlib/Algebra/Order/Module/PositiveLinearMap.lean` has `Add` and `AddCommMonoid` instances and no `LE`). The clause could be dropped, or the packaged maps could become a target naming the sum of contents and the two orders they need; the matching sentence of the module docstring of `Suggested.lean` would change with it.

## N02 — The §7.6 paragraph on additivity and order (lines 1107–1121) does not say for which measures it holds

The surrounding text is about Haar measure on `G`; the Lean statement and the two-point Check take any measure on any measurable space. A clause such as "for every measure `μ` on a measurable space `α`" would make the README and the Lean agree.

## N03 — The *Needs:* line of the §7.6 order target closes the Checks paragraph (line 1121) instead of the statement's paragraph

The converse route also uses the continuity of positive functionals (§7.1) and `LinearMap.ext_linftyIndicator`. Moving the line up to the statement and naming both would match the route.

## N04 — Untouched text: README §4.3, line 625, uses "a section `s` of `φ`" for a `φ` that need not be surjective

The general statement takes any `φ : G →* Q` with `ker φ ≤ range ψ`; a trivial `φ` onto `ℤ/2` has no section. "After replacing `Q` by the range of `φ`" would say what is meant.

## Previous findings

The previous review, of `0c3be17`, raised no findings (no R-numbered point) and no small corrections. Its other remarks:

- N01–N04 — not repaired: the folder has not changed since `0c3be17`, so the passages stand as they were; the notes are written again above and none blocks.

The pull request's title and description against this head: the count of sixteen roadmaps equals the sixteen bullets and the sixteen folders changed (sixteen READMEs and fifteen `Suggested.lean` files, DynamicalDegreesOfRationalMaps being the folder without one in the change, as the description says); the AmenableGroups bullet (§7.6, additive and monotone, one declaration `le_iff_addContentLpTopEquiv_le`, additivity "stated in the README only" because it follows from `LinearMap.toAddContentLpTop_apply` and `LinearMap.toAddContentLpTop_of_not_measurableSet`) and the sentence "in ClassFieldTheory and AmenableGroups part of it" agree with the head; the pin `2fd255d` is the Tau Ceti revision of the manifest; the description says the change adds targets to existing roadmaps, and for this folder no heading, layer, declaration or supplier is removed. Nothing to correct.

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| §7.6 order, README line 1109 and `le_iff_addContentLpTopEquiv_le` (cited by the description's bullet) | `μ = 0`; counting measure on `{p, q}` with `M = (a,b)`, `M' = (a',b')`; nonmeasurable `s` | `L∞ = 0`: left vacuous, contents `0 ≤ 0`; left `ax+by ≤ a'x+b'y` for `x,y ≥ 0` iff `a ≤ a'`, `b ≤ b'`; right `0≤0`, `a≤a'`, `b≤b'`, `a+b≤a'+b'`: the same; `0 ≤ 0` | true in both directions; `simp` and `Iff.rfl` both fail on a copy, so not padding |
| Description: additivity follows from the two pinned evaluation lemmas | two-point counting measure; nonmeasurable `s` | `{p} ↦ a+a'`, `{q} ↦ b+b'`, whole set `a+a'+b+b'` by `map_add` at indicators; nonmeasurable `0 = 0+0` | true; both lemmas exist at the pin with the stated content |

The rows for the untouched statements stand as in the previous review, of `0c3be17`.

- Elaboration of `Suggested.lean` at the pins: two messages, the `sorry` warnings at lines 56 and 69; imports are `Mathlib` and one `TauCeti` module.
- One-tactic probe on a copy: `simp` leaves the order statement unsolved (it only unfolds the equivalence to `toAddContentLpTop`); `exact Iff.rfl` is a type mismatch.
- Library declarations opened at the pins: 5 (`LinearMap.toAddContentLpTop_apply` line 100, `LinearMap.toAddContentLpTop_of_not_measurableSet` line 106, `PositiveLinearMap.ofAddContentLpTop` line 209, `PositiveLinearMap.addContentLpTopEquiv` line 254 of `TauCeti/MeasureTheory/Function/Lp/AddContent.lean`; Mathlib `AddContent` instances, only `Inhabited` line 83 and `FunLike` line 89).
- Source locators checked against a text: 0; nothing changed in the folder and the seeded sample lies in untouched passages.
- Cross-roadmap citations: the change adds none; no open pull request changes this roadmap or drops an id it cites.
- Dependency check: `depcheck: 91 roadmaps, 1013 edges, 0 problem(s)`; no UPWARD or CYCLE line. Every automatic check passed on this head.
- Record: merge base and head have the same eight layers and headings; the change against the base is 38 insertions and 1 deletion in §7.6, the scope sentence and `Suggested.lean`; no item removed. No file changes outside the sixteen roadmap folders the pull request owns; since `0c3be17` only `TauCetiRoadmap/BelyiMaps/README.md` changed, which is the pull request's own.
- Pull request text: title and description checked sentence by sentence for this folder; no contradiction, no unstated change.

Overlap check: read KestenAmenabilityAndSpectralRadius (open), AmenableTracesOnCStarAlgebras, ClassicalErgodicTheory, OperatorAlgebraDynamics (main) as in the previous review, whose result is unchanged by an unchanged folder; one shared object, the dual of `L∞` as finitely additive charges: BanachSpaceTheory §5.8 owns the signed normed form and consumes this roadmap's positive correspondence, whose additivity and order belong here.

Source independence: changed passages only; 0 passages compared with 0 sources, since no passage of the folder changed since `0c3be17`. Largest share of locators: Garrido, unchanged. No layer added, removed or reordered, so the arrangement was not compared.

Research link: Layer 7's headline is the equivalence of amenability with an invariant mean on Haar `L∞` (Bekka–de la Harpe–Valette 2008, Theorem G.3.1); the §7.6 statements are the positive part of the duality of `L∞` with finitely additive set functions (Dunford–Schwartz §IV.8). Rests on the README and the pinned module's references.

## Not verifiable

- No source text was read: nothing in the folder changed, and the seeded sample lies in untouched passages that the previous reviews covered.

## Source issues

- none

## For the human reviewers

- none
