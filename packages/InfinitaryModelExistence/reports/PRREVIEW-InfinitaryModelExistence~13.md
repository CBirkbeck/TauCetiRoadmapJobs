# Review of InfinitaryModelExistence (pull request #1615 at 050522d)

**Verdict:** accepted

**Summary.** Accepted: this was an incremental re-review of the 10 lines changed since `660240a`, which add a Check against variable capture for the infinitary `toFormula` in §0.4 and a sentence to the docstrings of `Fragment.slice` and `fragmentType`; the Check's values are right, the docstring claim is true of CountableModelCounting on main, and no statement changes. No finding; one small correction (a sentence of the description that the new Check makes out of date) and no format note, none blocking. One provenance question is left for a human.

## C01 — The description still says that the bound-opening `toFormula` has no Check

Under “Checks and dependencies” the description says “there are `**Checks**` lists for every definition Tau Ceti lacks at the pin except the bound-opening `toFormula` (§0.4)”. The head gives it one (README, §0.4, lines 224–226), so a reader of the description looks for a gap that is no longer there. The sentence would read “… for every definition Tau Ceti lacks at the pin, including the bound-opening `toFormula` (§0.4)”, with `toFormula` added to the list of those only the README specifies.

## Previous findings

The previous report had no finding (no R-numbered remark); its two small corrections and its format note are accounted for here.

- C01 (previous) — repaired: the description's Interfaces paragraph now says “The README is in the repository layout: the opening paragraph is the summary, ‘Scope and dependency order’ is ‘How to read the build’ … no layer or section number changes.”
- C02 (previous) — repaired: both docstrings now end “No statement of this file uses it; it is kept as the named interface that CountableModelCounting consumes”, which CountableModelCounting's README on main (M2, lines 329–330) bears out.
- N01 (previous) — repaired: §0.4 has “*Check* (for `toFormula`): `∀ y, x₀ = y` … becomes `∀ y, inr 0 = y`, with `y` still bound”; the values are recomputed in the table below. The repair makes one sentence of the description stale (C01 above).

## Verified sound

| Statement | Instance | Left / input value | Right / output value | Result |
|---|---|---|---|---|
| Check of `toFormula` (§0.4, new) | carrier `{0, 1}`, bound position `x₀ = 0` | `∀ y, x₀ = y`: at `y = 1`, `0 = 1` fails, so false | image `∀ y, inr 0 = y` at `inr 0 ↦ 0`: fails at `y = 1`, false | Agree; Check true |
| same, capturing variant | same carrier | `∀ y, y = y`: `0 = 0`, `1 = 1` | true, against false for the source formula | The Check separates the wrong variant |
| same, against Mathlib's recursion | `BoundedFormula.toFormula`, `all` clause (`ModelTheory/Syntax.lean:608–614`) | old position goes to `inr 0` through `Sum.map Sum.inr id ∘ finSumFinEquiv.symm`; new binder stays bound | README: `inr 0` free, `y` bound | Same shape as the Check states |
| `Fragment.slice`, `fragmentType` (docstrings changed, bodies not) | `A` the fragment, `n = 0`, `M` one point | slice = sentences of `A`; type of the empty tuple = sentences of `A` true in `M` | `fragmentType ⊆ slice`; equal iff every sentence of `A` holds in `M`, false as soon as `A` has `⊥` | Bodies unchanged; statement of use (“no statement of this file uses it”) true: names occur only at their declarations |

The rows for every statement the diff does not touch stand as in the previous review, of `660240a`.

- Diff since `660240a`: README 4 inserted lines (one Check), `Suggested.lean` 4 inserted and 2 deleted lines (two docstrings); nothing outside the folder.
- Library declarations opened at the pins: Mathlib `ModelTheory/Syntax.lean:608` (`BoundedFormula.toFormula`); the pinned Tau Ceti has no infinitary `toFormula` (only `AtomicIdx.toFormula`, `ModelTheory/Scott/AtomicDiagram.lean:41`, a different object), as the Needs line says.
- Cross-roadmap citations resolved: 1 (CountableModelCounting on main, M2, cites `fragmentType` and `Fragment.slice` by name); no open pull request changes this folder, no dropped id.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0, prints the one `#check` signature (`Fragment.generated_countable`) and seven `declaration uses sorry` warnings, nothing else; the elaborated types of the two definitions are unchanged (docstring edit only).
- Automatic checks at this head: every check passed.
- Dependency check: `depcheck: 133 roadmaps, 1473 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Record: the diff touches no layer heading and removes no item; the nine layers keep their ids. The source sample falls in no changed passage (the diff adds or changes no locator); the padding probes of the earlier reviews stand, no statement having changed.
- Description against the head: the Validation paragraph (7 warnings, one `#check`) and the Interfaces paragraph agree with the head; one sentence is stale (C01).

Overlap check: read HanfNumbers, CountableModelCounting, CountableStructureSpaces and InfinitaryLogic for the objects the changed passages name; nothing shared: `Fragment.slice` and `fragmentType` are owned here and consumed by CountableModelCounting by name, and the infinitary `toFormula` is stated by no other roadmap.

Source independence: changed passages only; 3 passages compared (the new Check, the two docstring sentences), all the roadmap's own text with no counterpart in a source (the Check's formula is not in `marker2013`), 0 sources opened this round, none shared; largest share `marker2013`, 17 of 19 locators as counted in the earlier review; the diff adds, removes and reorders no layer, so the contents were not compared again.

Research link: the headline targets are the model existence, omitting types and interpolation theorems of Lω₁ω (López-Escobar 1965; Malitz 1969; Keisler 1971; Marker 2016), with Malitz interpolation as restated by Harrison-Trainor and Kretschmer (2024, Theorem 4.5); `pcSeparation` is consumed by CountableStructureSpaces. Rests on the README's summary and References.

## Not verifiable

- `marker2016`, `keisler1971`, `malitz1969`, `gao2009`: no legal full text, as in the previous reviews; no changed passage cites them.
- The Provenance table's file names of the external formalisation were not opened.

## Source issues

- none

## For the human reviewers

- Licence/provenance: `TauCetiRoadmap/InfinitaryModelExistence/README.md`, the Provenance section, cites an Apache-2.0 external formalisation as the origin of the constructions; an earlier review confirmed the licence header only, and whole-repository reuse was not audited.
