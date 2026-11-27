# Review of ArithmeticGaloisRepresentations (pull request #3182 at 96d24f3)

**Verdict:** accepted

**Summary.** An incremental re-review: the folder is unchanged since `958132c`, so this round read the pull request's title and description against the head and against the whole change. Every sentence of the description that concerns this roadmap, and every sentence about the sibling folders that rests on §2.1 of this roadmap, agrees with the head; there is no finding, and the folder is accepted. Four small corrections and two format notes remain, none blocking: one is a clause the description leaves out, the others are the points of the previous review in untouched text, still open. One point is left for a human: the regenerated umbrella files.

## C01 — The description does not say that the changed sentence of §2.1 also adds a hypothesis

The last paragraph of the description says the target "names `Valuation.toAbsoluteValue` as Tau Ceti's … in the target and in its *Needs* line". The head also changes what is asked of the homomorphism: "strictly monotone homomorphism" became "strictly monotone, zero-reflecting monoid-with-zero homomorphism" (`README.md`, line 1178), which is the signature of the Tau Ceti declaration. A clause would cover it: "…and states the homomorphism as the declaration takes it, a zero-reflecting monoid-with-zero homomorphism".

## C02 — Untouched text: `AbsoluteValue.toValuation` (`README.md`, §2.1 *Absolute-value places*, line 1176) is in neither library

The sentence gives the valuation of a finite place as "`AbsoluteValue.toValuation`, defined for every nonarchimedean real absolute value", in the indicative, beside names that are library declarations. Neither pinned library builds a valuation from an `AbsoluteValue` (the only `toValuation` at the pins is `AddValuation.toValuation`, `Mathlib/RingTheory/Valuation/Basic.lean:1117`), so a reader who searches for it finds nothing. Saying that the target defines it ("define the valuation `L → ℝ≥0` of a nonarchimedean real absolute value, and prove that its valuation subring is `A_w`") would settle it.

## C03 — Untouched text: four declarations cited as Tau Ceti's (`README.md`, §2.1, lines 1210–1211 and 1243–1244) are not in the pinned Tau Ceti

`NumberField.nonempty_setOf_liesOver_infinitePlace`, `NumberField.exists_smul_eq_of_liesOver_infinitePlace`, `AbsoluteValue.isNonarchimedean_iff_of_liesOver` and `NumberField.isInfinitePlace_iff_of_liesOver` occur nowhere in Tau Ceti at the pin; the other Tau Ceti names of the *Needs:* line do. Either say that the four are in Tau Ceti after the pin (as the SubspaceTheorem §0.2 text of this pull request now does for `AbsoluteValue.instMulAction`), or move the pin when the roadmap is next built.

## C04 — Untouched text: the supplier SubspaceTheorem (`README.md`, §2.1 *Needs:*, line 1235) appears in no supplier contract

The *Needs:* line consumes SubspaceTheorem §§0.1 and 0.2, and that is the only mention of the roadmap in the README. A short `### From TauCetiRoadmap.SubspaceTheorem` under `## Exact supplier contracts`, naming the two sections and what is assumed of each, would close it.

## N01 — The homomorphism of line 1178 is on the value monoid, and "zero-reflecting" follows from "strictly monotone"

The sentence reads "monoid-with-zero homomorphism from its value group"; Tau Ceti's `Valuation.toAbsoluteValue` takes `f : Γ₀ →*₀ S` on the whole value monoid with zero, so "from its value monoid `Γ₀`" would match. A strictly monotone `f` with `f 0 = 0` is injective, so it reflects zero already; the second adjective can stay as the name of the library's hypothesis or go.

## N02 — Untouched text: the References entry for Neukirch (`README.md`, line 5902) lists only Ch. VII

§2.1 cites Neukirch Ch. I §9 and Ch. II §§3, 6, 8 and 9 (lines 1089, 1116, 1141, 1233), while the entry gives "Ch. VII, §§7–8" only.

## Previous findings

- The previous review (of `958132c`) had no finding. Its three small corrections and two format notes concern text this head leaves as it was (the folder changed by 0 lines); they are C02, C03, C04, N01 and N02 above, not repaired.

## Verified sound

| Statement | Instances and computed values | Result |
| --- | --- | --- |
| Description: `Valuation.toAbsoluteValue` is Tau Ceti's, and the absolute value along a strictly monotone, zero-reflecting `f` has the valuation subring of `v` (§2.1) | `3`-adic `v` on `ℚ`, `f` the inclusion `ℝ≥0 → ℝ`: `f(v 3) = 1/3 ≤ 1`, `f(v(1/3)) = 3 > 1`; subring `ℤ_(3)` on both sides. Trivial `v`: `ℚ` both sides. | Holds |
| Inertia as the case `q = 1` of the two hypotheses (§2.1; cited by the sibling §1.1 and the description) | `ℚ(i)`, conjugation `σ`: `σx − x = −2bi`. Above `2`: `w = 1/2·w(b) < 1`, `σ` in inertia (ramified). Above `3`: `w(σi − i) = w(2i) = 1`, not in inertia (inert). | Holds |
| Products: `σ` for `q`, `τ` for `q′` give `στ` for `qq′` (§2.1; description's account of item 3) | `στx − x^{qq′} = σ(τx − x^{q′}) + (σy − y^q)`, `y = x^{q′}`; both terms have `w < 1` since `σ` fixes `w`. `q = q′ = 1`: inertia closed under products. | Holds |
| Bijection `w ↦ A_w` onto valuation subrings other than `L`, as the description states it for `Ω` | Stated in §2.1 for `L` algebraic over `ℚ` only; `Ω = ℚ̄` is. Negative control `L = ℚ(t)`: the `t`-adic valuation ring is trivial on `ℚ`, no place gives it; the README's hypothesis excludes it. | Holds as scoped |

The rows for the untouched statements stand as in the previous review, of `958132c`.

- Pull request text: 3 paragraphs read against the head and the full diff of the pull request (6 files); every sentence about this folder agrees with `README.md` lines 1176–1181 and 1235–1246; the linked anchor `#absolute-value-places` exists; the pull request the description names for the SubspaceTheorem dependencies is merged under the quoted title; one clause missing (C01).
- Library declarations opened at the pin: Tau Ceti `Valuation.toAbsoluteValue` (`TauCeti/RingTheory/Valuation/AbsoluteValue.lean:32`: `f : Γ₀ →*₀ S`, `hf`, `hf_zero`, `hv_zero`); Tau Ceti `AbsoluteValue.instMulActionAlgEquiv`, `under_smul`, `liesOver_smul_iff` for `F ≃ₐ[R] F` only (`TauCeti/Analysis/AbsoluteValue/Action.lean:41–58`), the general `instMulAction` being on Tau Ceti's main branch only, as the description says; the four names of C03 and `AbsoluteValue.toValuation` searched in both libraries, absent.
- Source locators: the change since `958132c` alters none; no sampled target lies in a changed passage; the README flags no locator as unverified.
- Cross-roadmap citations: SubspaceTheorem §§0.1 and 0.2 exist at this head under those numbers; the sibling folders cite "ArithmeticGaloisRepresentations §2.1" (*Absolute-value places*), whose heading is unchanged.
- Dependency check: `depcheck: 94 roadmaps, 1067 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with 20 `declaration uses 'sorry'` warnings and nothing else; the file is unchanged against the merge base, so the signatures and the one-tactic probe stand.
- Record: against the merge base no layer, heading, item or Lean declaration is removed, retitled or added; all 7 layers are at the head.
- Overlaps: no other open pull request changes this roadmap; no cited id dropped, none defined only by an open revision.

Overlap check: read ArtinRepresentations, PotentialAutomorphyInfrastructurePartII, NeronModelsAndSemistableAbelianVarieties, ArithmeticGaloisDuality, IdelicReciprocityCountsAndCyclotomicClassGroups; places as normalised absolute values with their decomposition and inertia groups are this roadmap's (the Idelic roadmap cites §2.1 for them); nothing else shared.

Source independence: changed passages only; 0 passages changed since `958132c`, so 0 compared with 0 sources; arrangement not compared (no layer added, removed or reordered).

Research link: the roadmap supplies the Galois-representation language (Frobenius polynomials, Weil–Deligne representations, conductors, image conditions) in which Serre's modularity conjecture (Khare–Wintenberger 2009) and automorphy lifting (Clozel–Harris–Taylor 2008; Boxer–Calegari–Gee–Pilloni 2021) are stated; rests on the README's summary and its cited sources.

## Not verifiable

- Neukirch, *Algebraic Number Theory*, Ch. II, §§3, 8 and 9 (cited at the end of the target, untouched): not among the recorded texts; not read.

Automatic checks set aside as false positives: the rule that a pull request changes nothing outside its roadmap folders flagged the two generated GRH umbrella files; they are derived from the READMEs' *Needs:* lines, the description says they were regenerated, and their diff shows only the dependencies the READMEs state (§2.1 on SubspaceTheorem §§0.1 and 0.2, the sibling §1.1 on §2.1).

## Source issues

- none

## For the human reviewers

- **Scope of the change.** The pull request also commits `umbrellas/GRH-targets.md` and `umbrellas/GRH.toml` (8 lines), regenerated from the READMEs; the repository regenerates them on main daily. Whether a roadmap pull request should carry them is yours to decide.
