# Review of NonabsoluteIntegration (pull request #2977 at c1711a2)

**Verdict:** accepted

**Summary.** Accepted: both findings of the previous review are repaired and the repairs introduce no new problem. `Suggested.lean` now imports Tau Ceti's oriented interval integral and states every headline about it, and the group count in the proof that AC* gives VB* is now correct. There are no small corrections and one format note, not blocking. As before, no cited source could be read legally, so the locators are left to the human reviewers.

## N01 — "Monotone in `E`" for the four classes sits oddly beside the new convention

The Conventions now say that "monotone" means nondecreasing throughout, and the prose target of §3.1 (README line 323) says "the four classes are monotone in `E`". What is meant is that the restricted variation is nondecreasing in `E` and that each class passes to subsets; saying so would keep the convention literal.

## Previous findings

- R01 — repaired: `Suggested.lean` line 4 has `public import TauCeti.Analysis.BoxIntegral.Oriented.Basic`, the three copies are gone, and the README and docstring sentences about the shared build are replaced by the import statement.
- R02 — repaired: §3.1 now groups the short intervals greedily "so that each group has total length `< δ` and any two consecutive groups total `≥ δ`", giving "at most `2(b - a)/δ + 1` groups".
- C01 — repaired: the §1.3 line reads "Hake's theorem: §1.1 and the continuity headline of §1.2. Monotonicity: nothing from this roadmap."
- C02 — repaired: the Conventions state that "Monotone" means nondecreasing, and the Layer 4 Check ends "it is not nondecreasing".
- N01 — repaired: "(an open pull request)" and the sentence on open Mathlib pull requests are removed.
- N02 — repaired: the Layer 1 and Layer 5 section comments of `Suggested.lean` now carry the README's titles.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| The integral in every headline is the library's (R01) | `rfl` probes on a copy of the file: `HasHenstockIntervalIntegral`, `intervalBox`, `HenstockIntervalIntegrable` against their `TauCeti.BoxIntegral` names | All three probes elaborate; `#check` of the Saks–Henstock headline shows the library constant and `intervalBox a b hab` | statements are about the library object | none |
| 3.1 AC* gives VB*, route count (R02) | `δ = 1`, `b - a = 10`: sixteen intervals of length `0.6`; one hundred of length `0.1` | Greedy: 16 groups, consecutive totals `1.2 ≥ 1`; 12 groups (eleven of `0.9`, one of `0.1`). Bound `2·10 + 1 = 21`. In general `⌊k/2⌋ δ ≤ b - a` | count true | none |
| 1.3 *Needs:* line (C01) | dependency of each headline of §§1.2–1.3 | Monotonicity: none; continuity: §1.1; derivative at continuity points: monotonicity; Hake: §1.1, continuity. No cycle | true | none |
| Layer 4 Check on two-sided conditions (C02) | `-1` on `(0, 1]`, `0` on `[-1, 0]` | Values `0` at `0`, `-1` at `1`: not nondecreasing; right quotients at `0` are `-1/h` | Check true as reworded | none |

The rows for the untouched statements stand as in the previous review, of `b976dca`.

- Source locators checked against the text: 0; no changed passage carries a locator, and no cited text is readable legally (the sources cache was searched by title and holds none of them).
- Library declarations opened at the pin: `TauCeti/Analysis/BoxIntegral/Oriented/Basic.lean` lines 8–10 (it imports `IntervalIntegral`, as the README's supplier contract now says) and line 21; the three `#check` lines added for the Tau Ceti definitions elaborate.
- Cross-roadmap citations resolved: the citations of the roadmap on real functions, derivatives and variation (§1.1, §2.2, §3.1, §4.3) and of DifferentialGeometry §5.6.2 all resolve; none found nowhere.
- Dependency check: `depcheck: 136 roadmaps, 1514 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `Suggested.lean` at this head: 34 warnings, all `declaration uses sorry`; no error and no other warning. The elaborated signatures were compared with the README again: no binder lost, and the only change is the constant the integral refers to.
- Changes outside the roadmap folder: none.
- Pull request text read against the head: it states the import and the remaining five local copies; no sentence contradicted.
- Overlap check: read RealFunctionsDerivativesAndVariation, GeometricMeasureTheory, DifferentialGeometry; nothing shared (the Dini derivatives, property (N) and the image estimate are owned by RealFunctionsDerivativesAndVariation and cited; the monotonicity lemma without continuity of §4.1 is owned here).

Source independence: changed passages only; 3 changed passages of prose (the §3.1 route, the §1.3 *Needs:* line, the Tau Ceti supplier contract) compared with 0 sources, because none of the cited texts could be read; largest share Bogachev2007, 15 of 38 locators; contents not compared again (the change adds, removes or reorders no layer).

Research link: The headline is the classical identification of the Henstock–Kurzweil, Perron and restricted Denjoy integrals (Saks 1937, Chapters VI–VIII; Dudley–Norvaiša 2011, §§2.6–2.7), with the Alexiewicz norm and multiplier theory as used in the Stieltjes and several-variable gauge integrals named under the README's "Beyond this roadmap"; this rests on the README.

## Not verifiable

- Bogachev, *Measure Theory* Vol. 1, §5.7 (all locators of Layers 1–2): paywalled; not in the sources cache.
- Dudley–Norvaiša, *Concrete Functional Calculus*, Proposition 2.58, Lemmas 2.59 and 2.62, Theorem 2.65 and definition (2.57): paywalled.
- Bruckner, *Differentiation of Real Functions*, Chapter V: paywalled.
- Thomson, *Real Functions*, Theorems (44.1) and (45.3), §§37–45: paywalled.
- Saks, *Theory of the Integral*, Chapters VI–VIII: no legal copy found.
- The sentence that Isabelle/HOL and HOL Light treat neither ACG* functions nor the Perron integral: not checked.

Automatic checks set aside as false positives: the section comment "Library declarations used in the README" was reported as having no declaration under it; it heads the block of `#check` lines that pin library declarations, which the form rules allow.

## Source issues

- none

## For the human reviewers

- **Not tested.** No cited source could be read legally (Bogachev, Dudley–Norvaiša, Bruckner, Thomson: paywalled; Saks: no legal copy found), so the wording and arrangement comparisons were not made and no locator was checked. Bogachev has the largest share, 15 of 38 locators.
- **Licence.** `Suggested.lean` carries verbatim copies of five definitions (four Dini derivatives, `HasLusinN`) from another open roadmap of the same author, as its docstring says; the three copies of Tau Ceti definitions are gone. Project material.
