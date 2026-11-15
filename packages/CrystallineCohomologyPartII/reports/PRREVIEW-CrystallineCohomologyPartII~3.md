# Review of CrystallineCohomologyPartII (pull request #2265 at f0dfe4d)

**Verdict:** accepted

Incremental re-review of 0 changed lines since `f0dfe4d`; this round reads the pull request's title and description against the head. No finding.

## Deferred findings

- D01 — stands

## Previous findings

- none: the previous review, of `f0dfe4d`, raised no finding (its carried R01 is D01).

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| Description: "Ax–Katz modulo q … strengthening Mathlib's Chevalley–Warning divisibility from p to q" (§6.6, `card_dvd_card_solutions_of_sum_lt`) | F₄, f = xy in 3 variables (degree 2 < 3); F₃, x² + y² in 2 variables (2 < 2 fails) | zeros of xy: (4 + 4 − 1)·4 = 28, divisible by 4, Mathlib's statement gives only 2 ∣ 28; x² + y² over F₃: 1 zero, 3 ∤ 1 | holds; the degree bound is sharp | none |
| Same sentence, projective form (§6.6, `card_projectiveZeroLocus_modEq_one`) | F_q, x₀x₁ on ℙ² (2 ≤ 2); x² − ay² on ℙ¹, a a nonsquare (2 ≤ 1 fails); zero polynomial with d = 1 on ℙ¹ | two lines: 2(q + 1) − 1 = 2q + 1 ≡ 1; anisotropic conic: 0 points ≢ 1; all of ℙ¹: q + 1 ≡ 1 | holds; agrees with the Conventions Check | none |
| Description: "excision for every blowup self-product and base change" (§1.4) | n = 1, T = Y; general n and qcqs T | §1.4 states the fibre sequence for `X^{n/Y}` ×_Y T, all n ≥ 1, every qcqs Y-scheme T; for n = 1, T = Y it is the hypothesis before inverting F | the sentence is what §1.4 states | none |
| Description: "vanishing for fibrations with universally CH₀-trivial generic fibre" (§5.12) | Y Witt-rational; Y = Spec k; ℙ¹ → Spec k (r = 1) | R^if_\*WO_{X,ℚ} = 0 for i > 0; H^i(ℙ¹, WO) = 0 for i > 0 and H¹(ℙ¹, Wω) ≠ 0 sits in degree i = r | the sentence claims the WO-vanishing only, which §5.12 gives | none |

The rows for the untouched statements stand as in the previous review, of `f0dfe4d`.

- Title and description read sentence by sentence against the head: the pull request adds the folder (3 files, 2024 insertions, nothing removed); the title of the roadmap, the field of definition (perfect, characteristic p), Conventions items 4 and 10 (two rationalizations, quasi-projective in Layers 4 and 5), §§1.4, 2.3, 3.6, 5.12, 6.6, 6.9, 6.14 and Downstream consumers each say what the summary says of them. No sentence contradicted, no removal or renumbering to state.
- Parent sentence the description cites: CrystallineCohomology (open head) `README.md` lines 192–194 name Witt cohomology under h-covers and rational Witt cohomology of singular schemes for this Part II, as described (the two further subjects of that sentence: D01).
- Suppliers: the README's fourteen supplier roadmaps are five on main (AdicSpacesPartIII, EnhancedDerivedSheaves, EtaleCohomologyFoundations, JacobianChallenge, SchemeAndStackFoundations) and nine open, the nine of the description's dependency list.
- Validation line of the description: `lake env lean` on `TauCetiRoadmap/CrystallineCohomologyPartII/Suggested.lean` gives five `sorry` warnings and nothing else; the file imports `Mathlib` and nine `TauCeti.*` modules, no roadmap; 8 declarations (5 theorems, 3 definitions with bodies).
- Library declaration opened at the pin: `char_dvd_card_solutions_of_sum_lt`, Mathlib `Mathlib/FieldTheory/ChevalleyWarning.lean` line 110, divisibility by the characteristic, as the description and §6.6 say.
- Gate at this head: every check passed (all counters 0). No change outside the folder. Dependency check: `depcheck: 246 roadmaps, 2235 edges, 0 problem(s)`.
- Declared gaps: the four slugs are in the README under the SchemeAndStackFoundations contract; unchanged.
- Overlap check: read CrystallineCohomology, PadicDifferentialEquationsAndRigidCohomology, ArcTopologyAndDescent, SchemeAndStackFoundations, EnhancedDerivedSheaves; no folder change, owners as in the previous review (convergent-coefficient descent and Cartier transforms: D01).
- Source independence: changed passages only; the folder did not change, 0 passages compared; largest share CR12, 102 of 280 locators; no layer added, removed or reordered, so contents not compared again.

## Not verifiable

- The description's count "5 independent review rounds and 2 red-team rounds" concerns the job board, not the head; the board holds five package reviews and two red-team rounds for this roadmap.
- The items of the earlier reviews stand (Stacks tags 02RH and 0BED; the eight uncertified sources; §5.12 (ii) in its shifted form).

## Source issues

- none

## For the human reviewers

- **Scope.** `README.md` §§1.3–1.5 and §5.12 (ii) state results in a form no cited source prints (a constructed pushout and universal descent for BS17 Proposition 11.41; a degree-shifted form of CR12 Theorem 4.8.1).
- **Licence.** Ser58Top was read from a copy of the whole proceedings volume on a third party's university page; its status was not settled.
