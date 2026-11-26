# Review of IndexTheory (pull request #3170 at f17d28c)

**Verdict:** accepted

**Summary.** A review of the change against `main`: 22 changed lines since `87e7f72`. The change adds to §1.6 the monoid of path components of `FredholmLocus E E` and the index as a monoid isomorphism onto `Multiplicative ℤ` for infinite-dimensional `E`, with one Check, an extended *Needs:* line and a "not statable" bullet in the `Suggested.lean` docstring; each statement was recomputed on examples and the pinned names were opened and probed in Lean. The mathematics is correct and nothing blocks: accepted, with one small correction and two format notes (the first two carried from the previous review, since the folder has not changed since it). Nothing is left for a human to decide.

## C01 — The component-monoid route restates Mathlib's `Joined.mul`, and its *Needs:* clause names neither that lemma nor the unit of the monoid

An implementer who follows the *Needs:* line of §1.6 (README lines 378–381) would prove again a lemma the pin has, and would have to find the unit alone. The sentence at line 352, that `t ↦ γ t * δ t` joins `a * b` to `a' * b'`, is Mathlib's `Joined.mul` (`Topology/Connected/PathConnected.lean`, line 91, for any `Mul` with `ContinuousMul`). The paragraph derives "topological monoid" from composition alone; the unit is `ContinuousLinearMap.IsFredholm.id` (`Analysis/Normed/Operator/Fredholm/Basic.lean`, line 420), of index 0.

The smallest change: add `Joined.mul` and `ContinuousLinearMap.IsFredholm.id` to the clause "for the component monoid, Mathlib …".

## N01 — The Mathlib supplier contract does not list the new inputs

The From Mathlib contract (lines 1587–1591) has `IsFredholm.index_comp` but neither `ContinuousLinearMap.IsFredholm.comp` nor `ZerothHomotopy`, which the §1.6 *Needs:* line now names (and `Joined.mul`, if C01 is applied).

## N02 — The new isomorphism carries no locator

The paragraph at lines 348–356 gives no source for the group isomorphism. Freed, display (3.13), p. 13, already cited at line 318 for the bijection, calls the index on path components an isomorphism; citing it at "descends to an isomorphism of monoids" would do.

## Verified sound

Previous review (at 57376f9): no finding to repair. Its small correction C01 and format note N01 are not applied (the folder is identical at this head) and are carried above. Merge base against head: 8 layers on both sides, no layer, item or Check removed or retitled, the three `Suggested.lean` declarations unchanged.

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| `FredholmLocus E E` is a topological monoid (lines 348–350) | `ℓ²(ℕ)`; `ℂ`; `E = 0` | `‖ST − S′T′‖ ≤ ‖S‖‖T − T′‖ + ‖S − S′‖‖T′‖`; on ℂ zero map has ker ℂ, coker ℂ, index 0; `B(0) = {0}`; unit via `IsFredholm.id` | holds; unit unnamed (C01) |
| Path components of a topological monoid form a monoid (lines 350–352) | `{0,1}` under `×`, discrete; `S¹ ∪ {0} ⊂ ℂ` | π₀ `= {0,1}`; π₀ `= {[1],[0]}` with `[0][1] = [0]`; Lean probe: composition respects `Joined` on `FredholmLocus E E` | holds; it is `Joined.mul` (C01) |
| Index descends to a monoid isomorphism onto `Multiplicative ℤ`, `E` infinite-dimensional (lines 352–355) | `ℓ²(ℕ)`; `ℂ²` | `[S] ↦ −1`, `[S*] ↦ 1`, `[S*S] = [1] ↦ 0`, `[SS*] = [1 − e₀₀] ↦ 1 − 1 = 0`; `[S²] ↦ −2`; `ℂ²`: image `{0}` | holds; hypothesis needed |
| "Those components form a group" (line 355) | `[Sᵏ]` | inverse `[(S*)ᵏ]`: `−k + k = 0`; `SS* ≠ 1` but `[SS*] = [1]` as both have index 0 | holds |
| Check: `S* ∘ S = 1`, `1 + (−1) = 0` (line 373) | forward shift S on `ℓ²(ℕ)` | `(S*Sx)ₙ = xₙ`; `ind S = 0 − 1`, `ind S* = 1 − 0`; a subtractive law would give `2 ≠ 0` | true, discriminating |
| Check: finite-dimensional `E` gives the trivial monoid (lines 373–376) | `ℂⁿ`; `E = 0` | index `n − n = 0` (Lean probe); `B(E)` convex so one component; `B(0)` a point | true |
| *Needs:* clause (lines 379–381) | each route step | `ZerothHomotopy` (PathConnected.lean:117), `IsFredholm.comp` (Fredholm/Basic.lean:544), `IsFredholm.index_comp` (:613) exist; `#check` types match the use | holds; two names missing (C01) |
| Docstring bullet, `Suggested.lean` lines 15–18: not statable | `Monoid (ZerothHomotopy M)` | `infer_instance` fails at the pin; no such instance in Mathlib or Tau Ceti; Prop content left over is `index_comp` plus the two stated theorems | holds; no headline missing |
| `normPath_iff_index_eq` (cited by the change) against Freed (3.13) | `ℂ² → ℂ`; `ℓ²(ℕ) → ℂ`; `ℓ²(ℕ)` | one component, index 1; empty locus, vacuous; `1, S, S*` have indices 0, −1, 1 | holds |
| `exists_index_eq` (cited by the change) | `e = refl` on `ℓ²(ℕ)`; `ℂ²` | `Sᵏ ↦ −k`, `(S*)ᵏ ↦ k`; `ℂ²` excluded by `¬FiniteDimensional`, image `{0}` | holds |

- Source locators checked against the text: 1 (Freed 2021, arXiv 2107.03557v1, display (3.13), p. 13; Freed2021 line 507). The fifteen sampled targets lie outside the changed and affected text.
- Library declarations opened at the pin: Mathlib `IsFredholm.comp` (Fredholm/Basic.lean:544), `IsFredholm.id` (:420), `IsFredholm.index_comp` (:613), `ZerothHomotopy` (Topology/Connected/PathConnected.lean:117), `Joined.mul` (:91); Tau Ceti `Path.index_eq` (Analysis/Fredholm/ContinuousFamily.lean:81), `ContinuousLinearMap.index_add_of_hasFiniteRange` (Analysis/Fredholm/FiniteRank.lean:44).
- Cross-roadmap citations: the change adds none. The lead "PseudodifferentialOperators P4.2" (line 431, untouched) resolves on main to §4.2 under Layer 4 (P4).
- Automatic checks rerun at this head: all pass except the check for edits outside the folder (set aside below). Dependency check: `depcheck: 115 roadmaps, 1316 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. The diff outside the sixteen folders the pull request owns is empty. Elaboration: `lake env lean` on `Suggested.lean` warns only `declaration uses sorry` at lines 52 and 64. The recorded elaborated types of the three declarations (unchanged by this pull request) keep every binder of the README statements.
- Lean probe at the pin, proved: composition respects `Joined` on `FredholmLocus E E`; `index (S ∘L T) = index S + index T`; every endomorphism of a finite-dimensional `E` has index 0. `Monoid (ZerothHomotopy M)` fails to synthesize. No padding: the change adds no declaration.
- Pull request text: the IndexTheory bullet of the description agrees with the head (README only for the isomorphism, listed as not statable in `Suggested.lean`); sixteen roadmaps are listed and sixteen folders change.
- Ownership: a search of main and the open heads finds no other statement of a monoid on path components of Fredholm operators or of a general monoid structure on `ZerothHomotopy`.

Overlap check: read PseudodifferentialOperators, SeibergWittenTheory, SpectralManifolds (main) and searched the heads of CharacteristicClasses, TangentialBordism, PositiveScalarCurvature, ComplexKahlerGeometry; nothing shared (the three on main only consume IndexTheory layers; the component monoid is owned here).

Source independence: changed passages only; 5 passages compared (the new §1.6 paragraph, the new Check, the *Needs:* clause, the docstring bullet, the §1.6 statement sentence) with 1 source (Freed2021 lines 504–510), none shared; largest share Atiyah–Singer I, 12 of about 24 locators; arrangement not compared, since the diff adds, removes or reorders no layer.

Research link: the roadmap proves the Atiyah–Singer index theorem (Atiyah–Singer 1968), its cohomological form and the Atiyah–Bott holomorphic Lefschetz formula (1968); the changed §1.6 is the index classification of Fredholm operators up to homotopy (Freed 2021, display (3.13)); SeibergWittenTheory and SpectralManifolds consume it. Rests on the README overview, its References and Freed2021.

## Not verifiable

- The fifteen sampled targets (1.1, 1.3, 1.4, 2.3, 2.4, 3.2, 3.3, 3.4, 5.1, 5.2, 5.4, 6.2, 6.3, 7.2, 7.3) lie in untouched text the change does not affect; their locators into Atiyah–Singer I, Atiyah–Bott II and Atiyah (paywalled journals) were not opened in this review of the change.

Automatic checks set aside as false positives: the check for edits outside the roadmap folder, run without the list of the pull request's other folders, flags the 29 files of the fifteen other roadmap folders this pull request owns; the citation lead on PseudodifferentialOperators P4.2 resolves to that roadmap's §4.2 under its Layer 4, labelled P4.

## Source issues

- **Gap** in Freed2021 at display (3.13), printed page 13: the source says the index from path components of Fredholm operators between two Hilbert spaces to ℤ is an isomorphism, with no condition on the spaces; it should be assumed that both are infinite-dimensional of equal Hilbert dimension (finite dimensions give one value, unequal dimensions an empty space); affects nothing.

## For the human reviewers

- none
