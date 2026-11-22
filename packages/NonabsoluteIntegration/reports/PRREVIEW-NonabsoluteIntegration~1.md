# Review of NonabsoluteIntegration (pull request #2977 at b976dca)

**Verdict:** needs changes

**Summary.** Changes are needed, for two reasons, neither of which touches the truth of a stated theorem: `Suggested.lean` states every headline about private copies of three Tau Ceti definitions that can be imported at the pin, and one count in the proof route of §3.1 is false. Every statement survived the degenerate-case pass and every numerical Check was recomputed and agrees. There are two small corrections and two format notes, none blocking. No cited source could be read legally, so no locator was checked against its text; that is left to the human reviewers.

## R01 (P2) — The headlines are stated about local copies of Tau Ceti's integral, although the library's definitions import at the pin

Every theorem of `TauCetiRoadmap/NonabsoluteIntegration/Suggested.lean` that mentions the integral is about `TauCetiRoadmap.NonabsoluteIntegration.HasHenstockIntervalIntegral` (lines 74–93), not about `TauCeti.BoxIntegral.HasHenstockIntervalIntegral`. An acceptance test stated on a copy does not test the library object: the library definitions are not exposed (`public section` without `@[expose]` in `TauCeti/Analysis/BoxIntegral/Oriented/Basic.lean`, line 21), so outside the library the copy cannot even be identified with the original by `rfl`, and none of the consumed API (subdivision, `congr_ae`, the fundamental theorem) applies to it.

The reason given, in the supplier contracts (README line 636, "the shared build of the pin does not contain their compiled modules") and in the module docstring (lines 19–20), does not hold: I added `public import TauCeti.Analysis.BoxIntegral.Oriented.Basic` to a copy of the file and it elaborated, including a statement mentioning `TauCeti.BoxIntegral.HasHenstockIntervalIntegral` and `TauCeti.BoxIntegral.intervalBox`. A module whose object file is missing is in any case built first, not copied.

The smallest change: import `TauCeti.Analysis.BoxIntegral.Oriented.Basic` after `Mathlib`, delete the three copies, open `TauCeti.BoxIntegral`, and drop the sentence about the shared build from the README, the docstring and the pull-request description ("verbatim local copies with docstrings naming their files"). The five copies from the roadmap on real functions, derivatives and variation are a different matter and may stay: that roadmap is not importable.

## R02 (P2) — The group count in the proof that AC* gives VB* is false

In the proof route of §3.1 (README lines 327–330) the family is split into long intervals and "at most `(b - a)/δ + 1` groups of total length `< δ`". That many groups do not suffice. With `δ = 1`, `b - a = 10` and sixteen intervals of length `0.6` (total `9.6`), no two fit in one group of total length `< 1`, so sixteen groups are needed against the claimed eleven. An implementer following the count would be stuck.

The theorem is unaffected: a greedy grouping in which any two consecutive groups have total length `≥ δ` gives at most `2(b - a)/δ + 1` groups, which is all the bound needs. Replace the count by that.

## C01 — The *Needs:* lines of §1.2 and §1.3 point at each other

§1.2 needs §1.3 "for the second headline" (line 143) and §1.3 needs "§§1.1–1.2" (line 170), so read by section the two wait for each other. Item by item there is no cycle: monotonicity uses nothing from this roadmap (its route is null modification and nonnegative Riemann sums), continuity uses §1.1, differentiability at points of continuity uses monotonicity, and Hake uses §1.1 and continuity. Writing the §1.3 line per headline ("Hake: §1.1 and the continuity headline of §1.2; monotonicity: nothing from this roadmap") removes the apparent cycle.

## C02 — "Monotone" means nondecreasing throughout, and the last Check of Layer 4 calls a nonincreasing function "not monotone"

The Check on two-sided lower conditions (lines 491–493) uses the function `-1` on `(0, 1]` and `0` on `[-1, 0]` and concludes "it is not monotone". That function is nonincreasing, hence monotone in the usual sense; what fails is `MonotoneOn`, that is, being nondecreasing. The same reading is needed in §2.3 (the Lean hypothesis is `Monotone fun n ↦ f n x`, an increasing sequence), §3.3 and §4.1. Say "nondecreasing" in the Check, and once in the Conventions that "monotone" means nondecreasing.

## N01 — Four sentences describe the state of repositories, not mathematics

"(an open pull request)" at lines 41, 588 and 642, and "No open Mathlib pull request treats …" at line 618, will be false or meaningless to a later reader. Name the roadmap alone, and drop the Mathlib sentence or state what the pinned Mathlib lacks.

## N02 — Two layer titles differ between the README and `Suggested.lean`

Layer 1 is "The indefinite integral" in the README and "The Henstock–Kurzweil integral on an interval" in the Lean file; Layer 5 is "Multipliers and the Alexiewicz norm" against "Multipliers, integration by parts and the Alexiewicz norm".

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 Saks–Henstock | `a < b`; one-interval prepartition; tags at endpoints | Weak estimate on positive and negative terms: `ε/2 + ε/2`; tags lie in `[a, b]`, so `F` is only used there | true | none |
| 1.2 Continuity; derivative at continuity points | `a = b`; indicator of `[0, ∞)` on `[-1, 1]` | `a = b`: singleton. Primitive `max x 0`, no derivative at `0`, integrand discontinuous there | true | C01 |
| 1.3 Hake, both endpoints | `x^{-1/2}`; `x⁻¹ sin x⁻¹`; arbitrary `G` off `(a, b)` | `2 - 2√c`: `1.8`, `1.98`. `Si` differences `0.616142`, `0.624150`, `0.624808`; limit `0.624713`; modulus `3.1006`, `4.5643` | true; Checks agree | none |
| 1.3 Monotonicity | `a = b` | `y = z = 0` | true | none |
| Layer 1 example | modulus of the derivative of `x² sin x⁻²` on `[δ, 1]` | `3.0335`, `4.5679`, `5.9669`; `(2/π) log δ⁻²` gives `2.93`, `4.46`, `5.86` | Check agrees | none |
| 2.1 Derivative a.e.; measurability | `b < a`; indicator of `ℚ` | `Ioo` empty, vacuous. Primitive `0`, derivative differs on a null set only | true | none |
| 2.2 Lower bound, modulus, restrictions | `a = b`; derivative of `x² sin x⁻²`; `f` arbitrary off `[a, b]` | `a = b`: both sides true. Restriction to `{f > 0}` not integrable. Backward uses a measurable modification of `f` | true | none |
| 2.2 McShane | `a < b` | Henstock `≤` McShane in Mathlib (`Partition/Filter.lean:262`); converse inclusion absent from Mathlib | true, not in library | none |
| 2.3 Convergence theorems | `fₙ = n` on `(0, 1/n]`; `sup fₙ = ⌊1/x⌋` | Integrals all `1`, limit `0`. `H_N - 1`: `4.187`, `6.485`, `8.788` | true; control agrees | C02 (wording) |
| 3.1 Definitions | `E = ∅`, a point, `{0, 1}`; degenerate intervals; spikes `\|sin(π/x)\|` | Empty family sum `0`. `{0,1}`: every `F` AC*, variation of `1/x` infinite. Spikes: oscillation `1` on each `[1/(n+2), 1/(n+1)]` | definitions determine their objects | none |
| 3.1 AC* on `Icc` iff Mathlib's | `a = b`; reversed pairs in Mathlib's `disjWithin` | Both sides true at `a = b`. `uIoc`-disjoint implies `Ioo`-disjoint after ordering; oscillation attained on a subinterval | true | none |
| 3.1 AC* gives VB* | 16 intervals of length `0.6δ` in length `10δ` | 16 groups needed, claimed bound 11; `2(b-a)/δ + 1 = 21` suffices | theorem true, route count false | R02 |
| 3.2 Denjoy–Lusin; ACG* iff VBG* and (N); uniqueness | countable `E`; Cantor function on the Cantor set and on `[0, 1]`; `E = ∅` | Countable `E` null. Cantor: VB* with variation `1`, image of null set is `[0, 1]`, so not ACG* | true | none |
| 3.3 Primitives ACG*; descriptive characterization; monotonicity; differentiable functions | `a = b`; `x² sin x⁻²`; Cantor function | `a = b`: both sides true. Oscillation sum `≤ 2 + 2n·(length)`. Tau Ceti fundamental theorem has exactly the hypotheses used | true | none |
| 4.1 Major and minor functions; monotonicity; majors dominate minors | `a = b`; `a > b`; `-1` at `1`; step `-1` on `(0, 1]` | `a = b`: both integrals `0`. `a > b`: upper `⊥`, lower `⊤`, so `a ≤ b` needed. Left quotients `-1/h → -∞`. No `⊤ + ⊥` | true | C02 |
| 4.2 Perron equals HK | `a = b`; Ward majors against Dini majors; derivative of `x² sin x⁻²` | Ward implies Dini; Dini plus `ε(x - a)` is Ward; infima agree within `ε(b - a)`. Value `sin 1` both sides | true | none |
| Layer 5 by parts; BV multipliers; Alexiewicz | `f = 1, g = x`; `f = cos, g = x²`; `a = b`; `b < a` | `(b² - a²)/2`. `2cos 1 - sin 1 = 0.239134`. Cantor function is a uniform limit of polynomial primitives and fails (N) | true | none |
| Copies of Tau Ceti definitions | import of the library module on a copy of the file | Elaborates; text of the three copies equals the library's; `rfl` between copy and original refused (not exposed) | stand-in | R01 |

- Source locators checked against the text: 0 of 38 (no source readable legally).
- Library declarations opened at the pin: 18 Mathlib names elaborated by `#check`; `AbsolutelyContinuousOnInterval` and `disjWithin` read (`Mathlib/MeasureTheory/Function/AbsolutelyContinuous.lean:96`); Tau Ceti `Oriented/Basic.lean:34,44`, `IntervalIntegral.lean:28`, `Oriented/Calculus.lean:32`, `Examples/GaugeFTC.lean:81,162,192`, `SpecialFunctions/CantorFunction.lean:174,191,226`.
- Cross-roadmap citations resolved: 5 into RealFunctionsDerivativesAndVariation at its open head (§1.1, §2.2, §3.1, §4.3, §7; the five copied definitions agree verbatim) and 1 into DifferentialGeometry on main (§5.6.2).
- Dependency check: `depcheck: 150 roadmaps, 1716 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `Suggested.lean`: the worker's targeted build passed; my copy with the extra import elaborated with `sorry` as the only warning on the original declarations. All 52 elaborated signatures compared with the README: no binder lost, generality equal.
- One-tactic probe (`simp`, `rfl`, unfolding `simp`, `infer_instance`) on all 34 sorried theorems: none closes. The three declarations that mirror Checks are marked as sanity checks.
- Numerical Checks recomputed: 19 values, all agree to the digits printed.
- Overlap check: read RealFunctionsDerivativesAndVariation (open) and DifferentialGeometry (main), and searched GeometricMeasureTheory (open) and every other open roadmap and main for the Perron integral, ACG*, VBG*, McShane, Saks–Henstock and the Alexiewicz norm; nothing shared. The Dini derivatives, property (N) and the image estimate are owned by RealFunctionsDerivativesAndVariation and cited; the monotonicity lemma without continuity of §4.1 is owned here (that roadmap's §2.2 assumes continuity).

Source independence: 0 passages compared with 0 sources, because none of the cited texts could be read; largest share Bogachev2007, 15 of 38 locators; contents not compared (the locators of Layers 1–2 visit its §5.7 in the order 5.7.9, 5.7.10, 5.7.8, 5.7.6, 5.7.10–5.7.14, not the source's order, and Layers 3–5 cite other sources).

Research link: The headline is the classical identification of the Henstock–Kurzweil, Perron and restricted Denjoy integrals (Saks 1937, Chapters VI–VIII; Dudley–Norvaiša 2011, §§2.6–2.7), with the Alexiewicz norm and multiplier theory as used in the Stieltjes and several-variable gauge integrals named under the README's "Beyond this roadmap"; this rests on the README.

## Not verifiable

- Bogachev, *Measure Theory* Vol. 1, §5.7 (all locators of Layers 1–2): the sources service resolves it only to a paywalled page.
- Dudley–Norvaiša, *Concrete Functional Calculus*, Proposition 2.58, Lemmas 2.59 and 2.62, Theorem 2.65 and definition (2.57): paywalled.
- Bruckner, *Differentiation of Real Functions*, Chapter V (Definitions 4.2, 4.4, Examples 4.5, 4.6, Theorem 2.6, p. 83): paywalled.
- Thomson, *Real Functions*, Theorems (44.1) and (45.3), §§37–45: paywalled.
- Saks, *Theory of the Integral*, Chapters VI–VIII: the sources service found no legal copy.
- Benedetto–Czaja §4.7 and Pfeffer (cited only under "Beyond this roadmap"): not fetched.
- The sentence that Isabelle/HOL and HOL Light treat neither ACG* functions nor the Perron integral: not checked.

Automatic checks set aside as false positives: the section comment "Library declarations used in the README" was reported as having no declaration under it; it heads the block of `#check` lines that pin library declarations, which the form rules allow.

## Source issues

- none

## For the human reviewers

- **Not tested.** No cited source could be read legally (Bogachev, Dudley–Norvaiša, Bruckner, Thomson: paywalled; Saks: no legal copy found), so the wording and arrangement comparisons were not made and no locator was checked. Bogachev has the largest share, 15 of 38 locators.
- **Licence.** The pull-request description says `Suggested.lean` carries verbatim copies of five definitions from another open roadmap of the same author and three from Tau Ceti; I confirmed the texts agree. Both are project material.
