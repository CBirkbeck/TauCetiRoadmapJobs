# Review of ArithmeticGaloisRepresentations (pull request #3178 at 4157143)

**Verdict:** accepted

**Summary.** An incremental re-review of the 11 lines changed since `6c07fb0`: the two sentences added to *Absolute-value places* of §2.1 (a finite place as a valuation into `ℝ≥0`, and the valuation subring of the absolute value attached to a valuation) and the three names added to its *Needs:* line. The three statements are true as written, with the hypotheses they need (nonarchimedean; strictly monotone; rank at most one): accepted. There are five small corrections (two of them about the library names in the added sentence, two carried from the previous review, one about the description) and one format note, none blocking. One point is left for a human: Neukirch Ch. II could not be read.

## C01 — `Valuation.toAbsoluteValue` is Tau Ceti's, not Mathlib's, and its homomorphism is only monotone

The added sentence (line 1179) says "Mathlib's `Valuation.toAbsoluteValue`", and the *Needs:* line (line 1237) lists the name among the Mathlib declarations. Mathlib at the pin has no such declaration (its only `toAbsoluteValue`s are `IsAbsoluteValue.toAbsoluteValue`, `MulRingNorm.toAbsoluteValue` and `NormedField.toAbsoluteValue`); the declaration is Tau Ceti's, `TauCeti/RingTheory/Valuation/AbsoluteValue.lean:32` at the pin, and a reader who looks for it in Mathlib finds nothing.

Its signature also differs from the description in the sentence: it takes `f : Γ₀ →*₀ S` on the whole value monoid `Γ₀` (not on the value group), with `S` an ordered semiring, assumed monotone and zero-reflecting, together with `∀ x, v x = 0 ↔ x = 0`. Strict monotonicity is the hypothesis of the statement to prove, not of the construction, and it is needed: for `f` sending every nonzero value to `1` the absolute value is trivial with subring `L`, whatever `v` is. Writing "Tau Ceti's `Valuation.toAbsoluteValue`, for a strictly monotone `f`" and moving the name to the Tau Ceti part of the *Needs:* line would make both right.

## C02 — `AbsoluteValue.toValuation` is in neither library

The added sentence (line 1176) gives the valuation of a finite place as "`AbsoluteValue.toValuation`, defined for every nonarchimedean real absolute value", in the indicative and without "prove" or "define", beside two names that are library declarations. Neither the pinned Mathlib nor the pinned Tau Ceti has a valuation built from an `AbsoluteValue` (the only `toValuation` at the pins is `AddValuation.toValuation`, `Mathlib/RingTheory/Valuation/Basic.lean:1117`; the nearest object, `NormedField.valuation`, `Mathlib/Topology/Algebra/Valued/NormedValued.lean:47`, is for a normed field), and the current Tau Ceti main has none either. A reader takes it for an existing definition and cannot find it. Say that it is a definition this target asks for ("define the valuation `L → ℝ≥0` of a nonarchimedean real absolute value, a map we call …, and prove that its valuation subring is `A_w`"); the *Needs:* line rightly does not list it.

## C03 — Four declarations cited as Tau Ceti's are not in the Tau Ceti this roadmap pins (carried)

Unchanged from the previous review: `NumberField.nonempty_setOf_liesOver_infinitePlace` and `NumberField.exists_smul_eq_of_liesOver_infinitePlace` (lines 1208–1209), `AbsoluteValue.isNonarchimedean_iff_of_liesOver` and `NumberField.isInfinitePlace_iff_of_liesOver` (line 1241) do not occur in the pinned Tau Ceti (commit `2fd255d`); they are on its current main with the statements the README gives them. Either say that these four are in Tau Ceti after the pin, or move the pin when the roadmap is next built.

## C04 — The supplier SubspaceTheorem appears in no supplier contract (carried)

Unchanged from the previous review: the *Needs:* line (line 1234) consumes SubspaceTheorem §§0.1 and 0.2, and this is the only mention of that roadmap in the README. A short `### From TauCetiRoadmap.SubspaceTheorem` under `## Exact supplier contracts`, naming the two sections and what is assumed of each, would close it.

## C05 — The description does not mention the comparison with valuations

The description lists the contents of *Absolute-value places* bullet by bullet, and its first bullet stops at "a finite place `w` has the valuation subring `A_w = {x | w x ≤ 1}`, which determines it". The head now also asks for the valuation `L → ℝ≥0` of a finite place and for the valuation subrings of the absolute values attached to a valuation. One more sentence in that bullet would cover it: "A finite place is also a valuation into `ℝ≥0` with valuation subring `A_w`, and the absolute values attached to a valuation (Tau Ceti's `Valuation.toAbsoluteValue` along a strictly monotone homomorphism, Mathlib's `Valuation.absoluteValue` in rank at most one) have the valuation subring of that valuation."

## N01 — The References entry for Neukirch lists only Ch. VII (carried)

The target cites Neukirch, Ch. II, §§3, 8 and 9 (line 1232), while the entry under `## References` (line 5900) gives "Ch. VII, §§7–8" only.

## Previous findings

- The previous review, of `6c07fb0`, had no finding. Its two small corrections and its format note are not repaired at this head and are written again as C03, C04 and N01.

## Verified sound

| Statement | Instances and computed values | Result |
| --- | --- | --- |
| A finite place `w` is a valuation `L → ℝ≥0`, `x ↦ w x`, with valuation subring `A_w` | `5`-adic on `ℚ`: `v(5) = 1/5 ≤ 1`, `v(1/5) = 5 > 1`; `v(x+y) ≤ max` is `IsNonarchimedean`. Real absolute value: `|1+1| = 2 > max(1,1)`, no valuation. | Holds |
| `Valuation.toAbsoluteValue` along strictly monotone `f` has the valuation subring of `v` | `f(v x) ≤ 1 = f 1 ⇔ v x ≤ 1` (strictly monotone on a linear order). Control: `f ≡ 1` off zero is monotone, zero-reflecting; subring `L` although `v` is `5`-adic. | Holds; strictness needed |
| `Valuation.absoluteValue` of `v` with `RankLeOne` has the valuation subring of `v` | `norm x = hom'(v.restrict x)`, `strictMono'` gives `≤ 1 ⇔ v x ≤ 1`. Trivial `v`: both sides `L`. `5`-adic: both `ℤ_(5)`. | Holds |

The rows for the untouched statements stand as in the previous review, of `6c07fb0`.

- Library declarations opened at the pin: Mathlib `Valuation.absoluteValue` (`Topology/Algebra/Valued/NormedValued.lean:136`, `DivisionRing L`, `[RankLeOne v]`), `Valuation.RankLeOne` (`RingTheory/Valuation/RankOne.lean:49`: `hom' : v.ValueGroup₀ →*₀ ℝ≥0`, `strictMono'`), `AddValuation.toValuation` (`RingTheory/Valuation/Basic.lean:1117`), `NormedField.valuation` (`NormedValued.lean:47`); Tau Ceti `Valuation.toAbsoluteValue` (`RingTheory/Valuation/AbsoluteValue.lean:32`). `AbsoluteValue.toValuation` absent at both pins and on the current Tau Ceti main (C02).
- Duplication by object: no valuation, and no valuation subring, attached to an `AbsoluteValue` in the pinned Mathlib or Tau Ceti; no other roadmap, on main or open, names `AbsoluteValue.toValuation`, `Valuation.toAbsoluteValue` or `Valuation.absoluteValue`.
- Dependency check: `depcheck: 91 roadmaps, 1025 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. The change adds no cross-roadmap citation.
- Automatic checks: every check passed on this head. `lake env lean` on `Suggested.lean`: exit 0, 20 `declaration uses 'sorry'` warnings and nothing else; the file is unchanged since `6c07fb0`, so signatures and the one-tactic probe stand.
- Record: the change adds text inside one target; no layer, heading or item removed or retitled. No file changed outside the pull request's three folders.
- Seeded sample: no sampled target lies in the changed passage; the README flags no locator as unverified; the change adds no source locator.
- Pull request text: title and description agree with the head except for the omission of C05.

Overlap check: read ArtinRepresentations, PotentialAutomorphyInfrastructurePartII, NeronModelsAndSemistableAbelianVarieties, ArithmeticGaloisDuality, SubspaceTheorem; the action on `AbsoluteValue F ℝ` is SubspaceTheorem §0.2's (cited), places as a subtype with their decomposition and inertia groups, and now their valuations, are this roadmap's; nothing else shared.

Source independence: changed passages only; 2 passages compared with 0 sources (the added sentences cite no source; they were set beside the docstrings of the Tau Ceti and Mathlib declarations they name, none shared); arrangement not compared (no layer added, removed or reordered).

Research link: the roadmap supplies the Galois-representation language (Frobenius polynomials, Weil–Deligne representations, conductors) in which Serre's modularity conjecture (Khare–Wintenberger 2009) and automorphy lifting (Clozel–Harris–Taylor 2008; Boxer–Calegari–Gee–Pilloni 2021) are stated; README summary and its cited sources.

## Not verifiable

- Neukirch, *Algebraic Number Theory*, Ch. II, §§3, 8 and 9 (line 1232): the book is not among the recorded texts and no legal copy was read; the section numbers were not checked against the text.

## Source issues

- none

## For the human reviewers

- **Not tested.** The only printed source the target *Absolute-value places* cites, Neukirch Ch. II §§3, 8, 9 (`README.md` line 1232), could not be read: wording and locator were not compared with it.
