# Review of DynamicalDegreesOfRationalMaps (pull request #3170 at 9552dbc)

**Verdict:** accepted

**Summary.** An incremental re-review: the folder has not changed since `0c3be17` (0 lines), so this round reads the pull request's title and description against this head. They agree with it: the description's line for this roadmap states the one addition (the categorical form of determination in §1.1, README only), and its general sentences about the sixteen folders hold at this head. There is no finding, no small correction and no format note, and nothing is left for a human to decide.

## Previous findings

The previous review, of `0c3be17`, had no finding, no small correction and no format note; its account of the three earlier small corrections stands, since the folder is unchanged:

- C01 (of the review before it) — repaired: the description still reads "varieties over `K` with dominant `K`-rational maps form a category, and the function field is a fully faithful contravariant functor to `K`-algebras whose essential image is the finitely generated field extensions of `K`".
- C02 — repaired: "*Needs:* determination and functoriality above; for the essential image, Mathlib `AlgebraicGeometry.functionField_isFractionRing_of_affine` and Tau Ceti `TauCeti.AlgebraicGeometry.essFiniteType_functionField`".
- C03 — repaired: the item cites "(stacks-varieties Theorem 4.1, tag 0BXN, line 133)".

## Verified sound

| Statement | Instances tried | Values computed (left / right) | Result |
| --- | --- | --- | --- |
| §1.1 "Determination, categorically" (the statement the description cites): fully faithful, essential image the finitely generated field extensions | `L = K`; `L = K(t)`; `K = ℝ`, `ℝ(t) → ℂ(t)`; `L = ℚ̄` over `ℚ` | `Spec K`, function field `K`; `Spec K[t]`, `Frac = K(t)`; map `ℙ¹_ℂ ⤏ ℙ¹_ℝ` exists, none back (`−1` not a square in `ℝ(t)`); `ℚ̄` not finitely generated, no variety | holds; the README's Check is true |
| Description: "The one folder whose `Suggested.lean` does not change is DynamicalDegreesOfRationalMaps" | diff against `main` by file | 16 folders changed, 15 `Suggested.lean` files changed / this folder: README only, 4 insertions and 3 deletions | agrees with the head |
| Description: "Names not at the pin (`2fd255d`)" | the manifest's Tau Ceti revision | `2fd255d997…` / `2fd255d` | agrees |
| Description, line for this roadmap: "§1.1 … (Stacks Project, *Varieties*, Theorem 4.1, tag 0BXN). README only." | head README line 60; References line 831 | item in §1.1 with tag 0BXN, no Lean declaration added / same | agrees with the head |

The rows for untouched statements stand as in the previous review, of `0c3be17`.

- Source locators read: 1 (`stacks-varieties` lines 133–146: Theorem 4.1, tag 0BXN, over every field; the fully faithful functor at lines 135–142, `Spec A` for the essential image at 143–146). It supports the item as written. The other targets of the seeded sample lie in untouched text and were not re-verified.
- Library declarations opened at the pins: Mathlib `functionField_isFractionRing_of_affine` (AlgebraicGeometry/FunctionField.lean:116), `IntermediateField.fg_top_iff` (FieldTheory/IntermediateField/Adjoin/Algebra.lean:95), `Scheme.RationalMap.comp` and `isOver_comp` (AlgebraicGeometry/Birational/Composition.lean:155, 193); Tau Ceti `essFiniteType_functionField` and `topologicalKrullDim_eq_toNat_trdeg_functionField` (AlgebraicGeometry/Scheme/FunctionField.lean:93, 101). Names and line numbers are as the README gives them.
- Record against `main`: no heading, layer, item or Lean declaration removed or renamed; the change adds no cross-roadmap citation and no supplier roadmap.
- Pull request text: title and description read against the head. No sentence about this folder is contradicted; no removed section, removed declaration or new supplier roadmap is left unstated.
- Changes outside the sixteen folders named as the pull request's own: none. Since `0c3be17` the only file changed is `TauCetiRoadmap/BelyiMaps/README.md`, which this roadmap does not cite.
- Automatic checks: all passed at this head. Dependency check output: `depcheck: 93 roadmaps, 1034 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `TauCetiRoadmap/DynamicalDegreesOfRationalMaps/Suggested.lean` exits 0 with 18 `sorry` warnings and nothing else. The file is unchanged, so signatures and the one-tactic probe were not re-run.

Overlap check: read AlgebraicModuliForArithmeticGeometryPartII, MultiplierIdealsOfPairsAndPointSeparation, JacobianChallenge, SchemeAndStackFoundations, ArakelovGeometryAndAbelianHeightsPartII as in the previous reviews; the folder is unchanged, no open pull request changes it or drops an id it cites, and nothing is shared.

Source independence: changed passages only; none changed since `0c3be17`, so no new passage was compared; the passage the description cites (§1.1, categorical determination) was read again beside `stacks-varieties` lines 133–146, longest shared run about 5 words, forced by the mathematics; arrangement not compared, no layer added, removed or reordered.

Research link: Layer 4 (sub-multiplicativity, comparison of polarizations) and Layer 5 (existence of dynamical degrees) state over every field the results of Dang (2020) and Truong (2020), extending Dinh–Sibony (2005) over `ℂ`; Dang–Favre (2021) build on these degrees. Rests on the README's Summary and References.

## Not verifiable

- nothing.

## Source issues

- **Misprint** in stacks-varieties at Theorem 4.1 (tag 0BXN), p. 3: the source says the category of varieties with dominant rational maps is equivalent to finitely generated field extensions; it should be anti-equivalent, since its proof sends a rational map from X to Y to a field map from k(Y) to k(X); affects nothing.

## For the human reviewers

- none
