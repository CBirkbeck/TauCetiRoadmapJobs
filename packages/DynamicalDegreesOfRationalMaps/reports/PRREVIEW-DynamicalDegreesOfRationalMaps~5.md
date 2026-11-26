# Review of DynamicalDegreesOfRationalMaps (pull request #3170 at 57376f9)

**Verdict:** accepted

**Summary.** A review of the change against `main`: 1 changed lines since `87e7f72`. The added item of §1.1 says that varieties over `K` with dominant `K`-rational maps form a category, and that the function field is a fully faithful functor from it to the opposite of `K`-algebras whose essential image is the finitely generated extensions of `K`. The item is correct over every field, the Mathlib composition laws it names exist at the pin under hypotheses every variety satisfies, and its Check is true, so there is no finding. There are three small corrections, none blocking. The description's line for this roadmap says "integral schemes", for which the functor is not full. The item's *Needs:* line omits the inputs of the essential-image route. The item cites Hartshorne (algebraically closed field only, not in the References) where `stacks-varieties` already states the theorem over every field. There are no format notes, and nothing is left for a human to decide.

## C01 — The description states the §1.1 addition for integral schemes, where the function-field functor is not full

The description's line for this roadmap reads "integral schemes with dominant rational maps form a category, and the function field is a fully faithful contravariant functor". A reader is told that the README plans more than it does, and the stronger statement is false. Take `X = 𝔸¹_ℚ` and `Y = Spec ℚ[x]_(x)`, both integral with function field `ℚ(x)`. A rational map whose pullback is the identity of `ℚ(x)` would be a morphism from some `D(h) ⊆ 𝔸¹` with `ℚ[x]_(x) ⊆ ℚ[x][1/h]` inside `ℚ(x)`. Then every irreducible `q` not associate to `x` would divide `h`, which is impossible. The README (§1.1, line 60) rightly says varieties over `K`. The description's general sentence that data is "listed there as not statable" also does not hold for this folder, whose `Suggested.lean` is unchanged (rightly so, since the item is not a headline). Text that would be right: "DynamicalDegreesOfRationalMaps, §1.1: varieties over `K` with dominant `K`-rational maps form a category, and the function field is a fully faithful contravariant functor to `K`-algebras whose essential image is the finitely generated extensions of `K` (README only)."

## C02 — The *Needs:* line of the new item lists only determination and functoriality, but the essential-image route uses further inputs

An implementer of the essential image finds neither of its two inputs in that line (§1.1, line 60). That `K(X)` is a finitely generated extension of `K` is Tau Ceti's instance `TauCeti.AlgebraicGeometry.essFiniteType_functionField` (TauCeti/AlgebraicGeometry/Scheme/FunctionField.lean:93). That `Spec A` of a finitely generated `K`-domain is integral, with function field `Frac A`, is Mathlib's `IsIntegral (Spec R)` instance for a domain (Mathlib/AlgebraicGeometry/Properties.lean:330) together with `AlgebraicGeometry.functionField_isFractionRing_of_affine` (Mathlib/AlgebraicGeometry/FunctionField.lean:116). Adding these to the item's *Needs:* line would complete it. The composition laws the item names are already in the Mathlib supplier contracts.

## C03 — The new item cites Hartshorne for a theorem that the Stacks chapter already in the References states over every field

The item is stated over an arbitrary field `K`. Its only citation, "Hartshorne, *Algebraic Geometry*, Thm. I.4.4 and Cor. I.4.5, over an algebraically closed field", covers less than that, and Hartshorne is not in `## References`. A reader therefore has no locator for the general statement. `stacks-varieties` Theorem 4.1, tag 0BXN (line 133), proves the correspondence over every field `k` by the README's route: fully faithful by the rational-map/stalk correspondence, then `Spec A` for the essential image (lines 140–146). `stacks-varieties` is already in the References. Citing "(stacks-varieties Theorem 4.1, tag 0BXN, line 133)" instead of Hartshorne or beside it, and adding the tag to the References entry, would fix this. If Hartshorne stays, it would need its own References entry, cited by locator.

## Questions for the author

- Is Hartshorne's Corollary I.4.5 meant to support the essential image? I could not open the book: there is no legal copy in the sources cache, and the manifest has no entry for it. As I know it, I.4.5 is the criterion that two varieties are birational exactly when their function fields are isomorphic, the counterpart of `stacks-varieties` Lemma 4.2, tag 0BXP (line 155). It is not the existence of a variety with a given function field.

## Verified sound

| Statement | Instances tried | Values computed (left / right) | Result |
| --- | --- | --- | --- |
| §1.1 new item: category laws for dominant `K`-rational maps | `f = z²`, `g = z + 1`, `h = 1/z` on `ℙ¹_K`; identity; constant map | `(f.comp g).comp h = f.comp (g.comp h) = 1/(z² + 1)`; `id.comp f = f.comp id = z²`; constant first map: `comp` undefined, excluded | holds; pin hypotheses (irreducible middle, nonempty target) hold for varieties |
| functor `f ↦ f^*` into `(K-Alg)ᵒᵖ` | `f, g` as above; covariant variant | `(f.comp g)^*(t) = t² + 1 = f^*(g^*(t))`; covariant would need `ℂ(t) → ℝ(t)`: none | contravariant, holds |
| fully faithful | `d = 0`: `Spec ℚ(√2)` to itself; `ℙ² ⤏ ℙ¹` projection; `𝔸¹_ℚ ⤏ Spec ℚ[x]_(x)` | 2 maps / 2 `ℚ`-embeddings; projection / `K(x) ↪ K(x, y)`; identity of `ℚ(x)` / no map | holds for varieties; fails without finite type (C01) |
| essential image = f.g. extensions | `L = ℚ(t, s)`, `s² = t³ + 1`; `L = K`; `L = ℚ̄`; `L = K(t_1, t_2, …)` | `Spec ℚ[t, s]/(s² − t³ − 1)` has function field `L`; `Spec K`; `ℚ̄` not f.g. (dim 0 gives `[K(X):K] < ∞`); tr.deg `∞` | holds |
| Check: `ℝ(t) ⊂ ℂ(t)` over `K = ℝ` | `X = ℙ¹_ℂ`, `Y = ℙ¹_ℝ` | `t ↦ t` gives `X ⤏ Y`; back needs `i ↦ √−1 ∈ ℝ(t)`; ordering `t > ℝ` makes `−1` no sum of squares | true; separates contravariant from covariant |
| §1.1 determination (cited, untouched) | `z²` on `ℙ¹`; Frobenius of `ℙ^d` | `t ↦ t²`, `e = 2`; `x_i ↦ x_i^p`, `e = p^d` | holds |
| Description line (C01) | `𝔸¹_ℚ`, `Spec ℚ[x]_(x)` | `ℚ[x]_(x) ⊆ ℚ[x][1/h]` forces infinitely many prime factors of `h` | false for integral schemes |

- Previous review: it listed no finding, so nothing was owed a repair. The seeded sample (§§1.4, 3.1, 3.3, 3.4, 3.6, 4.1, 4.2, 4.5, 5.1, 5.3, 5.4, 6.1–6.4) lies wholly outside the changed and affected text, so it was not re-verified.
- Source locators read: `stacks-varieties` Theorem 4.1 (tag 0BXN, lines 133–146) and Lemma 4.2 (tag 0BXP, line 155); `dang2020` Theorem 1 (lines 27–51), for the research link. Hartshorne was not read.
- Library declarations opened at the pins: 11 in Mathlib (Birational/Composition.lean:155, 170, 173, 182, 193, 217; Birational/RationalMap.lean:391, 429; Birational/Dominant.lean:83; FunctionField.lean:116; Properties.lean:330) and 3 in Tau Ceti (Scheme/FunctionField.lean:93; Birational/AlgHom.lean; Curves/Category.lean:142). The supplier contracts' line numbers for `comp`, `comp_id`, the dominance instance, `comp_assoc`, `isOver_comp`, `id_comp` and `RationalMap.id` match the pin.
- Duplication: neither pin has a category of schemes with dominant rational maps or a function-field functor on it. Tau Ceti's `TauCeti.AlgebraicGeometry.RegularProperCurveCat.functionFieldFunctor` is for regular proper curves and morphisms, which is a different object. This roadmap owns the added item, alongside the §1.1 pullback and determination it already owns.
- Cross-roadmap citations: the change adds none and drops no id. No open pull request changes this roadmap or drops an id it cites.
- Automatic checks rerun at `57376f9`: every substance and form check 0. Dependency check: `depcheck: 122 roadmaps, 1391 edges, 0 problem(s)`, with no UPWARD or CYCLE line. Nothing changes outside the sixteen folders named as the pull request's own.
- Elaboration: `lake env lean` on `Suggested.lean` gives 18 `sorry` warnings and nothing else (exit 0). The file is unchanged since the merge base and the added item is not a headline, so no new statement is owed; the signature comparison and the one-tactic probe were not re-run.

Overlap check: read AlgebraicModuliForArithmeticGeometryPartII, MultiplierIdealsOfPairsAndPointSeparation, SchemeAndStackFoundations, ArakelovGeometryAndAbelianHeightsPartII, JacobianChallenge; nothing shared for the added object (the category of varieties with dominant rational maps and its function-field functor), owner DynamicalDegreesOfRationalMaps §1.1.

Source independence: changed passages only; 1 passage (the added item of §1.1) compared with 1 source (`stacks-varieties` Theorem 4.1 and proof, lines 133–146). The longest shared run is 5 words ("is the fraction field of"), which the mathematics forces. Hartshorne, which the passage cites, could not be read. The largest share of the README's citations is dangfavre2021, 16 of 102. Arrangement not compared: no layer is added, removed or reordered.

Research link: Layer 4's sub-multiplicativity and comparison of polarizations are `dang2020` Theorem 1 (i)–(ii) (Dang, 2020), proved over every field, extending Dinh–Sibony (2005) over `ℂ`. Layer 5's dynamical degrees are the invariants that Dang–Favre (2021) interpret spectrally. This rests on `dang2020` lines 27–51 and the README's Summary and Scope.

## Not verifiable

- Hartshorne, *Algebraic Geometry* (Springer GTM 52), Theorem I.4.4 and Corollary I.4.5: a paywalled textbook, absent from the manifest and the sources cache; not opened.

Automatic checks set aside as false positives: the check for edits outside the roadmap folder, rerun by hand, listed the README and `Suggested.lean` of the fifteen other roadmap folders this pull request changes, which are the pull request's own.

## Source issues

- **Misprint** in stacks-varieties at Theorem 4.1 (tag 0BXN), p. 3: the source says varieties with dominant rational maps form a category equivalent to finitely generated field extensions; it should say anti-equivalent (equivalent to the opposite), since its proof sends `X ⇢ Y` to `k(Y) → k(X)`; affects nothing.

## For the human reviewers

- none
