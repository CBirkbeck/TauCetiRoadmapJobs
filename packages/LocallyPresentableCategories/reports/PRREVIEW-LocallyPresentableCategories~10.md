# Review of LocallyPresentableCategories (pull request #1926 at 7c83474)

**Verdict:** accepted

## Previous findings

- R01 — repaired: "`Suggested.lean` states the 27 headline theorems with `sorry`." … "`lake build TauCetiRoadmap.LocallyPresentableCategories.Suggested` at Mathlib `1b1ccf4` and Tau Ceti `2fd255d`: only `sorry` warnings (27)." The 3.5/5.4/5.5 "Not stated" sentence is as requested.
- R02 — repaired: the Layer 1 bullet now covers 1.6, 1.7 and 1.8 ("`C` and `Cᵒᵖ` are both locally presentable iff `C` is equivalent to a small complete lattice (1.8)"). Layer 4 adds 4.4 and Layer 5 adds "generation under `D`-limits … (5.5)".
- R03 — repaired: "Orthogonality of classes of morphisms, orthogonal factorization systems and local objects for an arbitrary class are not built here; only Mathlib's `MorphismProperty.isLocal` is used." The description also adds "the ∞-categorical `Ind_κ` with BordismFormalGroups §F6.5".
- R04 — repaired: the description now has "Read in open copies" (nine works) and "Cited by locator only" (three works), and the Review paragraph no longer names Corollary 1.28. The 36 distinct locators in `README.md` and `Suggested.lean` are exactly those the two lists give.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 5.3 `exists_localization`, `R` without `D`-limits | `α = Unit`, `D () = Discrete PEmpty`; `R = Discrete (Fin 2)`, `S = ∅` | `R` has no terminal object, so every `R ⥤ C` is a `D`-functor, giving `C × C`. `R'` is `R` plus a terminal object (3 objects). Terminal-preserving functors `R' ⥤ C` also give `C × C`. | holds; `R' = R` is excluded by `HasDLimits D R'` | none |
| 5.3, `α` empty | `R = Bℕ`, `S = {1}` | `R[S⁻¹] = Bℤ` is small. A functor `Bℤ ⥤ C` is an object with an automorphism, which is also a functor `Bℕ ⥤ C` inverting `1`. | holds | none |
| 5.3, equalizers | `D = {WalkingParallelPair}`, `R = (f ≠ g : a ⇉ b)`, `S = ∅` | `(f, g)` has no equalizer in `R`, since `f ∘ 𝟙 ≠ g ∘ 𝟙`. `R' = {e → a ⇉ b}` has all equalizers because `f e = g e`. Both sides are parallel pairs in `C`. | holds | none |
| 1.5 `isFinitelyAccessibleCategory_iff_exists_ind` | `C = ModuleCat 𝔽₂`; `C = ω₁` as a poset | `Ind (fdVect 𝔽₂) ≌ Vect 𝔽₂` (directed unions of finite-dimensional subspaces), so both sides are true. The `ω₁`-chain has no colimit in `ω₁`, while `Ind A` has filtered colimits, so both sides are false. | sound | none |
| 3.1 `isCardinalLocallyPresentable_models` | `T = WalkingCospan`, `κ = ℵ₀` | `one` is terminal. `left ×_one left = left`, since the only cone is `(left, 𝟙, 𝟙)`, so `F left ⊆ 1`, and likewise `F right`. `Mod ≌ 2 × 2`, a finite lattice, locally finitely presentable. | holds | none |

The rows for the other statements stand as in the previous review, of `9deea52`. The pins (Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`) and every other declaration are unchanged.

- **Change.** 7 lines in the folder. `git diff --stat origin/main...HEAD` outside the folder is empty.
- **Gate.** Rerun on `7c83474`: every check is 0 and the result is `OK`; the worker's gate also gives `build=0`. `lake env lean` on `TauCetiRoadmap/LocallyPresentableCategories/Suggested.lean` exits 0 with 27 warnings, all `sorry`.
- **Elaborated types.** `#check @exists_localization`, `@restrictInverting` and `@dContinuousInverting` keep `[∀ a, SmallCategory (D a)]`, `[SmallCategory R]` and `Category.{w} C`. They match README 5.3, which requires no `D`-limits on `R`, and the reworded docstring now says the same. The "looks dropped" leads in the signature list for Layer 5 are false positives: the binder is present but anonymous. `exists_localization` needs a construction, so no single tactic closes it.
- **Dependency check.** `depcheck: 206 roadmaps, 1896 edges, 0 problem(s)`. The roadmap is line 408 of the merge-order candidate and has no supplier roadmap.
- **Sources re-read (5 locators).** Kelly, TAC Reprints 10: Proposition 6.21 (p. 122), Corollary 6.22 and Theorem 6.23 (p. 123), Proposition 6.13 (p. 120), and the definition of a finitary essentially-algebraic theory (p. 120). Theorem 6.23 covers an arbitrary small sketch, with no completeness required of `A`. The one-object cones that encode `S` add only trivial limits, so they change neither `D`-completeness nor `D`-continuity.
- **Cross-roadmap citations resolved (6).** ClassifyingTopoi at `6e9cb0f`: §3.5 (line 762, citing 1.5 at lines 814 and 860); the Examples of Layer 3 (lines 983 and 987: 1.5, 3.1, 3.5); the supplier contract (lines 229–231); and the Dependencies (line 991). The changed Downstream consumers paragraph matches all four. HigherToposTheory Layer F1 at `2176cc4` is unchanged.
- **Library.** Mathlib `CategoryTheory/Localization/FiniteProducts.lean` (lines 96–127) covers the ordinary localization of a category with finite products, for a `W` stable under products. It is a special case, not the `D`-limit localization of 5.3.
- **Overlap check:** read ClassifyingTopoi (`6e9cb0f`), HigherToposTheory (`2176cc4`), OrthogonalFactorization (`d6490d0`), HomotopyTheoryOfCategories (`8f3b224`), CommRingFactorizationSystems (`391c077`), GrothendieckTopoi (`6b3158d`) and EnhancedDerivedSheaves (main `4294b15`). Nothing is shared. ClassifyingTopoi leaves 1.5 and 3.1–3.5 to this roadmap and owns only `SetModel T` and `FPModel T`. CommRingFactorizationSystems states accessibility of `Under R` for its own category. `overlaps.md` reports no dropped id and no revision-only id.
- **Remark (untouched text).** The docstring of `exists_localization` says "into every category with `D`-limits"; the signature and README 5.3 also require `w`-small hom-sets (`Category.{w} C`).

## Not verifiable

- Adámek–Rosický 1994, Theorem 2.26 (1.5) and Definition 3.34 / Theorem 3.36 (3.5), which the changed paragraph cites by section: a paywalled book, not in the sources cache (searched by title). The other paywalled works stand as in the previous review.

## Source issues

- none
