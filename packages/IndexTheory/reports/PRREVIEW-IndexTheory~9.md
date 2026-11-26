# Review of IndexTheory (pull request #3170 at 9552dbc)

**Verdict:** accepted

**Summary.** An incremental re-review of 4 changed lines since `f17d28c`, together with a check of the pull request's title and description against this head. The change completes the *Needs:* line of §1.6 with Mathlib's `Joined.mul` and `ContinuousLinearMap.IsFredholm.id`, which repairs the previous small correction; both names exist at the pin with the types the route uses, and the title and description agree with the head. Accepted, with two format notes carried from the previous review, neither blocking; nothing is left for a human to decide.

## N01 — The Mathlib supplier contract does not list the component-monoid inputs

The From Mathlib contract (README lines 1587–1591) has `IsFredholm.index_comp` but not `ZerothHomotopy`, `Joined.mul`, `ContinuousLinearMap.IsFredholm.id` or `ContinuousLinearMap.IsFredholm.comp`, which the §1.6 *Needs:* line (lines 378–381) now names. One added bullet there would bring the two lists into agreement.

## N02 — The isomorphism of §1.6 carries no locator

The paragraph at lines 348–356 gives no source for the group isomorphism. Freed, display (3.13), p. 13, already cited at line 318 for the bijection, calls the index on path components an isomorphism; citing it at "descends to an isomorphism of monoids" would do.

## Previous findings

The previous report (at `f17d28c`) had no finding (no R item). Its other remarks:

- C01 — repaired: "for the component monoid, Mathlib `ZerothHomotopy`, `Joined.mul`, `ContinuousLinearMap.IsFredholm.id`, `ContinuousLinearMap.IsFredholm.comp` and `ContinuousLinearMap.IsFredholm.index_comp`" (lines 379–381). The repair introduces no new problem.
- N01 — not repaired: the From Mathlib contract (lines 1587–1591) is unchanged; carried above as N01, with the two names the repair added.
- N02 — not repaired: lines 348–356 are unchanged; carried above as N02.

## Verified sound

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| *Needs:* clause of §1.6 (lines 378–381), the changed passage | each of the five names, elaborated at the pin | `Joined.mul : Joined a b → Joined c d → Joined (a * c) (b * d)` for `[Mul M] [ContinuousMul M]`; `IsFredholm.id : (id 𝕜 E).IsFredholm`; `comp`, `index_comp`, `ZerothHomotopy` elaborate | holds; every route input named |
| Path components of a topological monoid form a monoid (lines 350–352), which the added `Joined.mul` supplies | `{0,1}` under `×`, discrete; Lean probe on a general `M` | π₀ `= {0,1}`, product well defined; probe `h.mul h' : Joined (a * b) (a' * b')` closes the goal as the README states it | holds; the name matches the sentence |
| Unit of the component monoid, which the added `IsFredholm.id` supplies | `E = ℓ²(ℕ)`; `E = ℂ`; `E = 0` | `ind 1 = 0 − 0 = 0` (Lean probe: `(id ℂ E).index = 0` by `simp`); on `E = 0`, `1 = 0` and index 0 | holds; unit maps to `1 : Multiplicative ℤ` |
| Index as monoid isomorphism onto `Multiplicative ℤ` (lines 352–355), which cites the changed line | shift `S` on `ℓ²(ℕ)`; `ℂ²` | `[S] ↦ −1`, `[S*] ↦ 1`, `[S*S] = [1] ↦ 1 + (−1) = 0`; `ℂ²`: image `{0}`, so infinite dimension needed | holds |

The rows for untouched statements stand as in the previous review, of `f17d28c`.

- Source locators checked against the text: 0 new; the changed passage carries no locator. The fifteen sampled targets lie outside the changed and affected text.
- Library declarations opened at the pin: Mathlib `Joined.mul` (`Topology/Connected/PathConnected.lean`, line 91), `ZerothHomotopy` (same file, line 117), `ContinuousLinearMap.IsFredholm.id` (`Analysis/Normed/Operator/Fredholm/Basic.lean`, line 420), `IsFredholm.comp` and `IsFredholm.index_comp` (same file); all five elaborate under `#check`.
- Cross-roadmap citations: the change adds none.
- Automatic checks at this head: all pass. Dependency check: `depcheck: 94 roadmaps, 1062 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. The diff outside the sixteen folders the pull request owns is empty.
- Elaboration: `lake env lean` on `Suggested.lean` warns only `declaration uses sorry`, at lines 52 and 64. The change touches no Lean statement; the recorded elaborated types of the three declarations keep every binder of the README statements. No padding: the change adds no declaration.
- Merge base against head: 8 layers on both sides, none removed, retitled or added; no heading and no Lean declaration removed.
- Pull request text against the head: the title counts sixteen roadmaps and sixteen folders change; the pin `2fd255d` is the Tau Ceti revision of the manifest; the IndexTheory bullet (§1.6, infinite-dimensional `E`, monoid of path components, index onto `Multiplicative ℤ`) agrees with README lines 348–356; "data … is listed there as not statable" agrees with `Suggested.lean` lines 15–18; the sentence that only DynamicalDegreesOfRationalMaps leaves its `Suggested.lean` unchanged is consistent with this folder, whose docstring changes. No sentence is contradicted by the head and no change to this folder is unstated.

Overlap check: read PseudodifferentialOperators, SeibergWittenTheory, SpectralManifolds (main) and the list of closest open roadmaps (CharacteristicClasses, TangentialBordism, PositiveScalarCurvature, ComplexKahlerGeometry); nothing shared (no open pull request changes this roadmap, drops an id it cites, or owns the component monoid).

Source independence: changed passages only; 1 passage compared (the *Needs:* clause, a list of library names) with 0 sources, none shared; largest share Atiyah–Singer I, 12 of about 24 locators; arrangement not compared, since the diff adds, removes or reorders no layer.

Research link: the roadmap proves the Atiyah–Singer index theorem (Atiyah–Singer 1968), its cohomological form and the Atiyah–Bott holomorphic Lefschetz formula (1968); the changed §1.6 is the index classification of Fredholm operators up to homotopy (Freed 2021, display (3.13)); SeibergWittenTheory and SpectralManifolds consume it. Rests on the README overview, its References and Freed2021.

## Not verifiable

- The fifteen sampled targets (1.5, 1.6, 2.1, 2.2, 4.1, 5.1, 5.4, 7.1, 7.2, 7.3, 7.5, 7.6, 8.1, 8.2, 8.3) lie in text the 4-line change does not touch or affect, except the *Needs:* line of 1.6, which has no source locator; their locators were not opened in this re-review.

## Source issues

- none

## For the human reviewers

- none
