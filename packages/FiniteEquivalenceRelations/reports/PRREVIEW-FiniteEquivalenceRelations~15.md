# Review of FiniteEquivalenceRelations (pull request #1929 at 26fb9cc)

**Verdict:** accepted

Incremental re-review of the 100 lines changed since 3286e73: the section `## Provenance: existing formalizations outside Tau Ceti` was rewritten, and the References section was reflowed with one directory added. No finding.

## Previous findings

- R01 — repaired: “`FiniteFlatAffine/` proves, for a groupoid with affine objects and arrows and finite locally free source and target, … When in addition `(t, s)` is an equivalence relation, it proves …” (README lines 847–857). The description now reads “finite locally free equivalence relation (03BM)”.
- R02 — repaired: “1.2 needs no such input: there `A` is integral over `A^R` because it is finite over `k ⊆ A^R`, with no flatness.” (lines 849–850). The description now reads “(03BJ) to 2.1”.
- R03 — repaired: “identifies Mathlib's `IsEquivalenceRelation` with a monic pre-relation … (Tag 022Q) … restricts … along any `U′ → U` (Tag 02V8): the scheme-theoretic side of 0.2.” (lines 841–847). The description now has “restriction (02V8) to 0.2”.
- R04 — repaired: “`ModuleCat.isDescentMorphismForModules_iff_universallyInjective` and `ModuleCat.isEffectiveDescentMorphismForModules_iff_universallyInjective` (Tag 08XA, `Descent/Modules/EffectiveDescent.lean`)” (lines 859–862). References line 914 adds `StacksFrontier/AlgebraicGeometry/Descent`.
- R05 — repaired: “Tag 0EUA, the step of 4.4's route, is `AlgebraicGeometry.quasicoherentSectionsEqualizer_iff_isUniversalEffectiveEpiFamily` … the descent along the quotient map of 4.3 are not there.” (lines 862–867).
- R06 — repaired: “the repository describes it as written by AI agents and keeps it apart from its human-reviewed tier `StacksCore`” (lines 835–836).

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| 1.2 `isColimit_cofork`, against the new sentence “1.2 needs no such input” (03BJ) | `A = k[t]/(t²)`, `I = (t ⊗ 1, 1 ⊗ t)` | `a ⊗ 1 − 1 ⊗ a = a₁(t⊗1 − 1⊗t) ∈ I`, so `A^R = A`; `(A⊗A)/I = k = A/(t)` is not flat over `A`. Equal maps, coequalizer `X = Spec A^R` | integrality is trivial while 03BJ's hypothesis fails: as stated |
| 0.3 `isEquivalenceRelation_iff`, against 022Q / `isEquivalenceRelation_iff_mono_and_isPreEquivalenceRelation` | `I = ⊥` on `k × k`; graph union `I = (xy)` on `k[t]/(t²)` (0.1) | `⊥`: `R = X ×_k X`, 4 points, total relation on `T`-points. Graph union: mono, relation on its one point is an equivalence, but there is no transitivity morphism | `T`-points, not points, are needed, as the section says |
| 0.2 `IsEquivIdeal.map_quotient`, against 02V8 restriction | `A = k[t]`, `I = ⊥`, `𝔞 = (t)` | scheme restriction `(Z×Z) ×_{X×X} R = Spec k`; ideal image `⊥` in `k ⊗ k = k`: both total on a point | agree |
| 2.1 `isEffectiveEquivalenceRelation_of_flat`, against 03BM / `AffineQuotient.lean` | `A = k[ε]/(ε²)`, `I = ⊥` | `A ⊗ A` free of rank 2 over `A`; `A^R = k`; `A` free of rank 2 over `k`; kernel pair `X ×_k X = R` | 03BM's conclusion matches 2.1 |
| 4.2 `full_faithful_comparison_iff`, `nonempty_comonadicLeftAdjoint_iff`, against 08XA | `k → k[x]`; `ℤ → ℤ/2` | `k[x]` is free, so `P → k[x] ⊗ P` is injective. `ℤ → ℤ/2` at `P = ℤ` is not injective; `ℚ ⊗ ℤ/2 = 0` identifies `id_ℚ` with `0`, so the functor is not faithful | AxiomMath's two theorems are 4.2's second and third |
| 4.4 `universally_effectiveEpi_iff`, against 0EUA | `C = k[x,y]/(xy) → A = k[s] × k[t]`, `M = C/(x+y) = k[x]/(x²)` | `A ⊗_C M = A/(s,t) = k × k`, `x ↦ 0`: not injective, so the Amitsur condition fails and it is not universal. At `M = C` the equalizer is `{f(0) = g(0)} = C` | matches 4.4's third Check |

The rows for the untouched statements stand as in the previous review, of 3286e73.

- Gate rerun (`gate … --base origin/main`): every count `0`, `OK`. The worker's gate, with the targeted build, is also `OK`. Dependency check: `depcheck: 257 roadmaps, 2432 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. The change adds no supplier.
- `lake env lean` on `Suggested.lean`: exit 0, 22 warnings, all “declaration uses `sorry`”. `git diff --stat 3286e73 HEAD` touches only the README, and nothing outside the folder differs from `origin/main`.
- AxiomMath at c496df0, 10 Lean files opened, plus its `README.md`, `lean-toolchain` and `lake-manifest.json`:
  - `IntegralInvariants.lean:216`: 03BJ, affine with finite locally free `s` and `t`.
  - `AffineQuotient.lean:203,259`: `[IsEquivalenceRelation G.target G.source]`.
  - `InvariantBaseChange.lean:571`: 03BK, for any `invariantRing G`-algebra `C'`.
  - `FppfQuotient.lean:363`: 07S6, under `HasAffineOrbitInEveryClosed`, which is equivalent to the invariant affine opens covering.
  - `EffectiveDescent.lean:684,692`: in `namespace ModuleCat`.
  - `UniversalEffectiveEpi.lean:784`: in `namespace AlgebraicGeometry`.
  - `PreRelations.lean:70,224,300,324` and `GroupoidOfEquivalenceRelation.lean:68,142`.
- `CategoryTheory.IsEquivalenceRelation`, as used in `PreRelations.lean`, is Mathlib's: `Mathlib/CategoryTheory/EquivalenceRelation.lean:98`, both at Mathlib v4.35.0 and at our pin. AxiomMath's README line 7 has “There is no `sorry`”; lines 13–14 describe the two tiers. Its `lean-toolchain` is `v4.35.0` and its manifest has Mathlib `inputRev v4.35.0`, as the README states.
- Source locators of the changed passages, checked in the cached stacks-groupoids text: lines 79 (02V8), 92 (022Q), 1216 (0232), 1219 (0233), 2132 (03BJ), 2152 (03BK, any ring map `C → C′`) and 2420–2429 (03BM).
- A word-level diff of References against 3286e73 changes one thing: it adds `StacksFrontier/AlgebraicGeometry/Descent`. Everything else is line reflow. Of the 6 lead names in `citations.md`, 3 are the AxiomMath declarations confirmed above. `IsEquivIdeal.le_ker_mul` and `map_incl₁₃_le` are fields (`Suggested.lean` lines 85 and 89), and `map_quotient` is declared at line 111.
- Pull request text: the Provenance paragraph matches the head (022Q, 0232, 0233 → 0.3; 02V8 → 0.2; 03BM, 03BJ → 2.1; 08XA → 4.2; 0EUA → 4.4). The title and the other paragraphs are unchanged and describe unchanged content.
- Remark: the section's Tags 022Q, 02V8, 0232, 0233, 03BK and 07S6 are not in the References' Stacks entry. They label AxiomMath declarations and do not source targets, so no change is asked.

Overlap check: read GroupSchemesOverABase (open, vocabulary 0.09; the other two lists are empty). Its line 98 leaves finite quotients to ModularCurves 0C, which 2.1 cites too. Nothing is shared, no other open pull request changes this folder, and no cited id is dropped.

Source independence: 10 passages compared with 2 sources, changed passages only: 7 tags in the cached Stacks groupoids chapter, and the AxiomMath docstrings of the 10 files. They share only standard phrases (“induces an equivalence relation on”, “finite locally free”). Largest share Stacks, 33 of 86 locators (the previous 31 of 84, plus Tags 03BK and 0EUA in the section). Contents were not compared again: no layer was added, removed or reordered.

## Not verifiable

- As before, these are paywalled or not online: Venken 1971, Philippe 1973, Olivier, Joyal–Tierney 1984, and Mesablishvili 2004a and 2004b. The README cites them only for history and in Research context.
- The Buffalo lecture of 11 July 1973 appears only in the description; the README cites no source for it.
- Tags 07S6, 08XA and 0EUA are outside the cached chapter. This round read them through AxiomMath's statements; the previous review checked them against Stacks online.
- The claim at lines 866–867 that AxiomMath lacks non-flat relations, 1.3, Layer 3 and 4.3 was checked only against directory listings and the files opened.

## Source issues

- none

## For the human reviewers

- Scope: no published source states `not_isEffectiveEquivalenceRelation_raicuArtin` or `raicuCocycle_not_mem_differenceIdeal`, and README Scope and 3.2–3.3 say so. An earlier review recomputed the field-uniform rank argument (`52 > 51`) over `ℤ`.
- Priority: kollar2012 lines 143–144 call Venken 1971 and Philippe 1973 closely related. An earlier branch commit (c2992349) described a non-effective relation in Venken 1971, Corollaire 3.1; commit 7a81d5f3 dropped it as unchecked. Venken was not read.
- README Research context reports an unpublished exhaustive search and concludes that the smallest length is at least 5 over `𝔽₂` and `𝔽₃`. An earlier review reproduced the search over `𝔽₂` and `𝔽₃` for lengths 3 and 4.
- Licence: README lines 831–867 map targets to AxiomMath, *The Stacks Project in Lean*. It is Apache 2.0 per `LICENSE` at c496df0, and its `StacksFrontier` tier is AI-written per that repository's README line 14. The description says its maintainers have not been contacted. Nothing is adapted into `Suggested.lean`.
