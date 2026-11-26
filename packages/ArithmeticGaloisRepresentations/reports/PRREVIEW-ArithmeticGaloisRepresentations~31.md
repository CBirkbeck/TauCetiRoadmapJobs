# Review of ArithmeticGaloisRepresentations (pull request #3182 at 958132c)

**Verdict:** accepted

**Summary.** A review of the change against `main`: 16 changed lines since `5c8f654`. The change rewrites one sentence of *Absolute-value places* in §2.1 (the absolute value attached to a valuation is now Tau Ceti's `Valuation.toAbsoluteValue`, along a strictly monotone, zero-reflecting homomorphism) and moves that name from the Mathlib part to the Tau Ceti part of the *Needs:* line; both were checked against the pinned libraries and the statement recomputed, and it is true as written: accepted. There are three small corrections and two format notes, none blocking; all three corrections and one note concern untouched text and are for a separate pull request. One point is left for a human: the regenerated umbrella files.

## C01 — Untouched text: `AbsoluteValue.toValuation` (`README.md`, §2.1 *Absolute-value places*, line 1176) is in neither library

The sentence before the changed one gives the valuation of a finite place as "`AbsoluteValue.toValuation`, defined for every nonarchimedean real absolute value", in the indicative, beside names that are library declarations. Neither the pinned Mathlib nor the pinned Tau Ceti has a valuation built from an `AbsoluteValue` (the only `toValuation` at the pins is `AddValuation.toValuation`, with its uses in `TauCeti/RingTheory/Valuation/Denominator.lean`), so a reader who searches for it finds nothing. Saying that the target defines it ("define the valuation `L → ℝ≥0` of a nonarchimedean real absolute value, and prove that its valuation subring is `A_w`") would settle it.

## C02 — Untouched text: four declarations cited as Tau Ceti's (`README.md`, §2.1, lines 1210–1211 and 1243–1244) are not in the pinned Tau Ceti

`NumberField.nonempty_setOf_liesOver_infinitePlace`, `NumberField.exists_smul_eq_of_liesOver_infinitePlace`, `AbsoluteValue.isNonarchimedean_iff_of_liesOver` and `NumberField.isInfinitePlace_iff_of_liesOver` do not occur in Tau Ceti at the pin (`2fd255d`); the other Tau Ceti names of the *Needs:* line do (`Rat.AbsoluteValue.IsStandard`, `AbsoluteValue.IsEquiv.eq_of_isStandard`, `Valuation.toAbsoluteValue`, `NumberField.existsUnique_finitePlace_rpow_inv_eq_of_liesOver`, `NumberField.FinitePlace.relativeAbsValue`). The change reflows the line that holds two of the four but does not alter them. Either say that the four are in Tau Ceti after the pin, or move the pin when the roadmap is next built.

## C03 — Untouched text: the supplier SubspaceTheorem (`README.md`, §2.1 *Needs:*, line 1235) appears in no supplier contract

The *Needs:* line consumes SubspaceTheorem §§0.1 and 0.2, and that is the only mention of the roadmap in the README. A short `### From TauCetiRoadmap.SubspaceTheorem` under `## Exact supplier contracts`, naming the two sections and what is assumed of each, would close it.

## N01 — In the changed sentence the homomorphism is on the value monoid, and "zero-reflecting" follows from "strictly monotone"

Line 1178 reads "monoid-with-zero homomorphism from its value group"; Tau Ceti's `Valuation.toAbsoluteValue` takes `f : Γ₀ →*₀ S` on the whole value monoid with zero, so "from its value monoid `Γ₀`" (or "value group with zero") would match. A strictly monotone `f` with `f 0 = 0` is injective, so it reflects zero already; the second adjective can stay as the name of the library's hypothesis or go.

## N02 — Untouched text: the References entry for Neukirch (`README.md`, line 5902) lists only Ch. VII

§2.1 cites Neukirch Ch. I §9 and Ch. II §§3, 6, 8 and 9 (lines 1089, 1116, 1141, 1233), while the entry gives "Ch. VII, §§7–8" only.

## Previous findings

- The previous review (of `4157143`, on the pull request that put this text on `main`) had no finding. Of its small corrections: the one on `Valuation.toAbsoluteValue` ("Mathlib's `Valuation.toAbsoluteValue`", and the name among the Mathlib declarations of the *Needs:* line) is repaired: the head reads "(Tau Ceti's `Valuation.toAbsoluteValue`)" and lists the name after "Tau Ceti". Those on `AbsoluteValue.toValuation`, the four Tau Ceti names, the SubspaceTheorem contract and the Neukirch entry lie in untouched text and are C01, C02, C03 and N02 above. The one on the earlier pull request's description no longer applies.

## Verified sound

| Statement | Instances and computed values | Result |
| --- | --- | --- |
| `Valuation.toAbsoluteValue` of `v` along strictly monotone, zero-reflecting `f` has the valuation subring of `v` (changed) | `f(v x) ≤ 1 = f 1 ⇔ v x ≤ 1`. `5`-adic `v`, `f` the inclusion `ℝ≥0 → ℝ`: `f(v 5) = 1/5`, `f(v(1/5)) = 5`; subring `ℤ_(5)` both sides. Trivial `v`: `L` both sides. | Holds |
| Same, negative control for "strictly" | `f ≡ 1` off `0` is monotone and zero-reflecting; absolute value trivial, subring `L`, while `5`-adic `v` has `ℤ_(5)`. | Strictness needed, and stated |
| The construction's third hypothesis `v x = 0 ↔ x = 0` | `L` a field, `v(x) v(x⁻¹) = 1` for `x ≠ 0`, so `v x ≠ 0`; automatic, rightly not stated. | Holds |
| `Valuation.absoluteValue` of `v` with `RankLeOne` has the valuation subring of `v` (same sentence) | value is `hom'(v.restrict x)`, `strictMono'` gives `≤ 1 ⇔ v x ≤ 1`; `5`-adic: `ℤ_(5)` both sides. | Holds |
| *Needs:* line: each Tau Ceti name at the pin | 5 of 7 present (C02 names the two absent on this line); `Valuation.toAbsoluteValue` absent from Mathlib, present in Tau Ceti. | Attribution now right |

- Library declarations opened at the pin: Tau Ceti `Valuation.toAbsoluteValue` (`TauCeti/RingTheory/Valuation/AbsoluteValue.lean:32`: `f : Γ₀ →*₀ S`, monotone, `hf_zero`, `hv_zero`), `Rat.AbsoluteValue.IsStandard` (`TauCeti/Analysis/AbsoluteValue/Equivalence.lean:68`), `AbsoluteValue.IsEquiv.eq_of_isStandard` (same file, 121); Mathlib `Valuation.absoluteValue` (`Mathlib/Topology/Algebra/Valued/NormedValued.lean:136`), `Valuation.RankLeOne` (`Mathlib/RingTheory/Valuation/RankOne.lean:49`); Mathlib's only `toAbsoluteValue` near this is `IsAbsoluteValue.toAbsoluteValue` (`Mathlib/Algebra/Order/AbsoluteValue/Basic.lean:446`).
- Source locators: the change adds or alters none; no sampled target lies in the changed or affected passage; the README flags no locator as unverified.
- Cross-roadmap citations: the change adds none; the two sibling folders of this pull request cite "ArithmeticGaloisRepresentations §2.1 (*Absolute-value places*)", which exists at this head with its heading unchanged.
- Dependency check: `depcheck: 94 roadmaps, 1067 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with 20 `declaration uses 'sorry'` warnings and nothing else; the file is unchanged against the merge base, so signatures and the one-tactic probe stand from the review of that text.
- Record: no layer, heading, item or Lean declaration removed, retitled or added; the 7 layers of the merge base are all at the head.
- Pull request text: its last paragraph states this folder's change correctly ("names `Valuation.toAbsoluteValue` as Tau Ceti's … in the target and in its *Needs* line, where it was listed under Mathlib"); nothing the head contradicts.
- Duplication by object: no other roadmap on main or open names `Valuation.toAbsoluteValue`; the change states nothing new.

Overlap check: read ArtinRepresentations, PotentialAutomorphyInfrastructurePartII, NeronModelsAndSemistableAbelianVarieties, ArithmeticGaloisDuality, IdelicReciprocityCountsAndCyclotomicClassGroups; places as normalised absolute values with their decomposition and inertia groups are this roadmap's (the Idelic roadmap now cites §2.1 for them); nothing else shared.

Source independence: changed passages only; 1 passage compared with 0 sources (the changed sentence cites no source; it was set beside the docstrings of the Tau Ceti and Mathlib declarations it names, none shared); arrangement not compared (no layer added, removed or reordered).

Research link: the roadmap supplies the Galois-representation language (Frobenius polynomials, Weil–Deligne representations, conductors, image conditions) in which Serre's modularity conjecture (Khare–Wintenberger 2009) and automorphy lifting (Clozel–Harris–Taylor 2008; Boxer–Calegari–Gee–Pilloni 2021) are stated; rests on the README's summary and its cited sources.

## Not verifiable

- Neukirch, *Algebraic Number Theory*, Ch. II, §§3, 8 and 9 (cited at the end of the target, untouched): not among the recorded texts; not read.

Automatic checks set aside as false positives: the rule that a pull request changes nothing outside its roadmap folders flagged the two generated GRH umbrella files; they are derived from the READMEs' *Needs:* lines, the description says they were regenerated, and their diff shows only the dependencies the READMEs now state.

## Source issues

- none

## For the human reviewers

- **Scope of the change.** The pull request also commits `umbrellas/GRH-targets.md` and `umbrellas/GRH.toml` (8 lines), regenerated from the READMEs; the repository regenerates them on main daily. Whether a roadmap pull request should carry them is yours to decide.
