# Review of DynamicalDegreesOfRationalMaps (pull request #3170 at 4aaba98)

**Verdict:** accepted

**Summary.** A review of the change against `main`: 1 changed lines since `87e7f72`. The one added item of §1.1 (varieties over `K` with dominant `K`-rational maps form a category, and `f ↦ f^*` is a fully faithful functor to the opposite of `K`-algebras with essential image the finitely generated field extensions) was checked against the pinned Mathlib composition laws, against `stacks-varieties` Theorem 4.1 and by computed instances, including its Check over `ℝ`; it is true over every field and there is no finding. There are three small corrections and no format note, none blocking: the description states the addition for integral schemes, where it is false; the item's *Needs:* line omits the inputs of the essential-image step; and its only citation is a textbook theorem over an algebraically closed field that is not in the References, although the Stacks chapter already cited proves the statement over every field. Nothing is left for a human to decide.

## C01 — The description states the §1.1 addition for integral schemes, for which the function-field functor is not full

The description's line for this roadmap reads "integral schemes with dominant rational maps form a category, and the function field is a fully faithful contravariant functor (Hartshorne I.4.4)". A reader of the pull request is told the README plans a stronger statement than it does, and the stronger statement is false: for `X = 𝔸¹_ℚ` and `Y = Spec ℚ[x]_(x)`, both integral with function field `ℚ(x)`, a rational map `X ⤏ Y` with pullback the identity would restrict to a ring map `ℚ[x]_(x) → ℚ[x][1/h]` inside `ℚ(x)`, so every irreducible `q` not associate to `x` would divide `h`. The README (§1.1, line 60) says varieties over `K`, which is right, and Mathlib's `Scheme.RationalMap.equivFunctionFieldOver` indeed assumes the target locally of finite type. The description also omits the essential image, and its general sentence that data is "listed there as not statable" does not apply to this folder, whose `Suggested.lean` is unchanged. Text that would be right: "DynamicalDegreesOfRationalMaps, §1.1: varieties over `K` with dominant `K`-rational maps form a category, and the function field is a fully faithful contravariant functor to `K`-algebras with essential image the finitely generated field extensions of `K` (README only)."

## C02 — The *Needs:* line of the new item names only determination and functoriality, while its essential-image step uses two further inputs

An implementer of the essential image (§1.1, line 60) is not pointed to what the step rests on. That `K(X)` is finitely generated as a field over `K` is Tau Ceti's instance `TauCeti.AlgebraicGeometry.essFiniteType_functionField` (TauCeti/AlgebraicGeometry/Scheme/FunctionField.lean:93); that `Spec A` of a finitely generated `K`-domain has function field `Frac A` is Mathlib's `AlgebraicGeometry.functionField_isFractionRing_of_affine` (Mathlib/AlgebraicGeometry/FunctionField.lean:116). Neither name occurs in the README. Adding both to the item's *Needs:* line completes it; the composition laws the item names are already in the Mathlib supplier contracts (line 734), with the right line numbers.

## C03 — The new item's only citation is to Hartshorne over an algebraically closed field, while `stacks-varieties` Theorem 4.1 gives the statement over every field

The item is stated over an arbitrary field `K`, but its locator, "Hartshorne, *Algebraic Geometry*, Thm. I.4.4 and Cor. I.4.5, over an algebraically closed field", covers quasi-projective varieties over an algebraically closed field only, and the book has no entry in `## References`; so the general statement has no locator a reader can follow. `stacks-varieties` Theorem 4.1, tag 0BXN (line 133), states the equivalence over every field and proves it by the item's own route (fully faithful at lines 135–142, `Spec A` for the essential image at lines 142–146). Citing "(stacks-varieties Theorem 4.1, tag 0BXN, line 133)" in the item, beside Hartshorne or in its place, and adding the tag to the `stacks-varieties` References entry would repair it; if Hartshorne stays it needs a References entry.

## Questions for the author

- Is Cor. I.4.5 of Hartshorne meant to support the essential image? I could not open the book (no legal copy in the cache, no manifest entry). As I recall it, I.4.5 is the criterion that two varieties are birational exactly when their function fields are isomorphic (the counterpart of `stacks-varieties` Lemma 4.2, tag 0BXP, line 155), and the essential image is part of I.4.4 itself.

## Verified sound

| Statement | Instances tried | Values computed (left / right) | Result |
| --- | --- | --- | --- |
| §1.1 new item: dominant `K`-rational maps of varieties form a category | `f = z²`, `g = z + 1`, `h = 1/z` on `ℙ¹`; identity; a constant first map | `(f.comp g).comp h = f.comp (g.comp h) = 1/(z² + 1)`; `id.comp f = f.comp id = z²`; constant map not dominant, so `comp` not formed | holds; pin hypotheses of `comp_assoc` (preirreducible source, irreducible middle, nonempty third) hold for integral schemes |
| `f ↦ f^*` is a functor to `(K-Alg)ᵒᵖ` | same `f`, `g` | `(g ∘ f)^*(t) = t² + 1 = f^*(g^*(t))`; `g^*(f^*(t)) = (t + 1)²` differs | contravariant as stated |
| fully faithful | `Spec ℚ(√2)` to itself; projection `ℙ² ⤏ ℙ¹`; `𝔸¹_ℚ ⤏ Spec ℚ[x]_(x)` | 2 maps / 2 `ℚ`-automorphisms; 1 map / `K(x) ↪ K(x, y)`; 0 maps / identity of `ℚ(x)` | holds for varieties; fails without finite type (C01) |
| essential image = finitely generated field extensions | `L = K`; `L = ℚ(t)[s]/(s² − t³ − 1)`; `L = ℚ̄` over `ℚ`; `L = K[ε]/(ε²)` | `Spec K`; `Spec ℚ[t, s]/(s² − t³ − 1)`, function field `L`; `ℚ̄` not finitely generated, no variety; not a field, not in image | holds, both inclusions |
| Check: `ℝ(t) → ℂ(t)` over `ℝ` | `ℙ¹_ℂ` as an `ℝ`-variety, `ℙ¹_ℝ` | `t ↦ t` gives `ℙ¹_ℂ ⤏ ℙ¹_ℝ`; a map back needs `i ↦ r` with `r² = −1` in `ℝ(t)`: none (`ℝ(t)` formally real) | true; distinguishes the two variances |
| §1.1 determination (untouched, cited by the item) | `z²` on `ℙ¹`; Frobenius on `ℙ¹_{𝔽_p}` | `t ↦ t²`, `e = 2`; `t ↦ t^p`, `e = p` | holds; pin: `equivFunctionFieldOver` needs `X` integral, `Y` locally of finite type |
| Description line (C01) | `𝔸¹_ℚ`, `Spec ℚ[x]_(x)` | `ℚ[x]_(x) ⊆ ℚ[x][1/h]` forces infinitely many irreducible factors of `h` | false for integral schemes |

- Previous review (same folder text): no finding, so no repair was owed; its three small corrections are not applied at this head and are raised again as C01–C03 after re-verification.
- Seeded sample: only §1.1 meets the changed text. Its two locators were read and support the definition: stacks-morphisms line 6046 (Definition 52.8, tag 02NY) and dinhsibony2005 lines 69–70. The other fourteen targets lie in untouched, unaffected text and were not re-verified.
- Source locators read: 4 (`stacks-varieties` lines 133–146 and 155–159; stacks-morphisms line 6046; dinhsibony2005 lines 69–70). Hartshorne not read.
- Library declarations opened at the pins: Mathlib `Scheme.RationalMap.comp` (Birational/Composition.lean:155), `comp_id` (170), dominance of composites (173), `comp_assoc` (182), `isOver_comp` (193), `id_comp` (217), `RationalMap.id` (Birational/RationalMap.lean:391), `equivFunctionFieldOver` (562), `functionField_isFractionRing_of_affine` (FunctionField.lean:116); Tau Ceti `functionFieldAlgHom_id`, `functionFieldAlgHom_comp` (Scheme/BaseAlgebra.lean:421, 427), `essFiniteType_functionField` (Scheme/FunctionField.lean:93), `finrank_eq_finrank_fieldRange_functionFieldMap` (Morphisms/Finite/FlatDegree.lean:87).
- Duplication: neither pin has a category of schemes with dominant rational maps or a function-field functor on it; a search of every open roadmap head and of main for such a category found only this item. The change adds no cross-roadmap citation and drops no id, layer or item (one line inserted, none deleted).
- Automatic checks: all passed at this head. Dependency check output: `depcheck: 116 roadmaps, 1326 edges, 0 problem(s)`; no UPWARD or CYCLE line. Nothing is changed outside the sixteen folders named as the pull request's own.
- Elaboration: `lake env lean` on `TauCetiRoadmap/DynamicalDegreesOfRationalMaps/Suggested.lean` exits 0 with 18 `sorry` warnings and nothing else. The file is unchanged since the merge base and the added item is data (a category and a functor), not a headline, so no new statement is owed; signatures and the one-tactic probe were not re-run.

Overlap check: read AlgebraicModuliForArithmeticGeometryPartII, JacobianChallenge, ArakelovGeometryAndAbelianHeightsPartII, SchemeAndStackFoundations (scope sections on main) and searched MultiplierIdealsOfPairsAndPointSeparation; nothing shared for the added object, which DynamicalDegreesOfRationalMaps §1.1 owns beside the pullback and determination it already owns.

Source independence: changed passages only; 1 passage (the added item of §1.1) compared with 1 source (`stacks-varieties` lines 133–146), longest shared run about 5 words ("is the fraction field of"), forced by the mathematics; Hartshorne, cited by the passage, could not be read; arrangement not compared, no layer added, removed or reordered.

Research link: Layer 4 (sub-multiplicativity, comparison of polarizations) and Layer 5 (existence of dynamical degrees) state over every field the results of Dang (2020) and Truong (2020), extending Dinh–Sibony (2005) over `ℂ`; Dang–Favre (2021) build on these degrees. Rests on the README's Summary and References.

## Not verifiable

- Hartshorne, *Algebraic Geometry*, Theorem I.4.4 and Corollary I.4.5: a paywalled textbook, absent from the manifest and the sources cache; not opened.

## Source issues

- **Misprint** in stacks-varieties at Theorem 4.1 (tag 0BXN), p. 3: the source says the category of varieties with dominant rational maps is equivalent to finitely generated field extensions; it should be anti-equivalent, since its proof sends a rational map from X to Y to a field map from k(Y) to k(X); affects nothing.

## For the human reviewers

- none
