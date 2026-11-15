# Review of FiniteEquivalenceRelations (pull request #1929 at 3286e73)

**Verdict:** needs changes

Incremental re-review of the 31 lines changed since 34c9767: the new section `## Provenance: existing formalizations outside Tau Ceti` and its References entry. Every finding below is in that section and was checked against AxiomMath/Stacks at commit c496df0. The description's Provenance paragraph repeats the wording of R01–R03, so each repair names the matching change to it.

## R01 (P2) — Tag 03BM is stated for groupoids in general; it needs an equivalence relation

**Location:** `TauCetiRoadmap/FiniteEquivalenceRelations/README.md` lines 845–849: “proves that a groupoid with finite locally free source and target acting on an affine scheme has an affine quotient by its invariants, compatible with base change (Tag 03BM, `AffineQuotient.lean`) … the flat case of 2.1 … for groupoids in general.”

**Claim:** Tag 03BM and `AffineQuotient.lean` both assume that `(t, s)` is an equivalence relation, and without that hypothesis the kernel-pair conclusion is false. Base change is a separate result: Tag 03BK, in `InvariantBaseChange.lean`. `FppfQuotient.lean` (Tag 07S6) also assumes an equivalence relation, and it proves that the quotient sheaf is representable rather than building the sheaf.

**Witness:** `AffineQuotient.lean` line 803 has `[IsEquivalenceRelation G.target G.source]`; stacks-groupoids line 2426. Trivial `ℤ/2`-groupoid on `Spec k`: `s = t` free of rank 2, invariants `k`, `U ×_M U = Spec k`, but `R = Spec (k × k)`.

**Repair:** Replace lines 845–850, from “`AlgebraicGeometry/Groupoids/FiniteFlatAffine/` proves” through “(`ArrowDescentEffective.lean`).”, with: “`AlgebraicGeometry/Groupoids/FiniteFlatAffine/` proves, for a groupoid with affine objects and arrows and finite locally free source and target, that the ring is integral over its invariants (Tag 03BJ, `IntegralInvariants.lean`). When in addition `(t, s)` is an equivalence relation, it proves that the map to the spectrum of the invariants is finite locally free, has the relation as its kernel pair and represents the fppf quotient sheaf (Tag 03BM, `AffineQuotient.lean`): the flat case of 2.1. `InvariantBaseChange.lean` base-changes the groupoid along an extension of its invariant ring (Tag 03BK). `Groupoids/FiniteFlatQuotient/` proves that the fppf quotient sheaf of an equivalence relation with finite locally free projections is a scheme when the invariant affine opens cover (Tag 07S6, `FppfQuotient.lean`), and proves descent of arrows (`ArrowDescentEffective.lean`).” In the description, change “the affine quotient by a finite locally free groupoid (03BM)” to “the affine quotient by a finite locally free equivalence relation (03BM)”.

## R02 (P3) — “the integrality used in 1.1” names the wrong section and the wrong integrality

**Location:** `TauCetiRoadmap/FiniteEquivalenceRelations/README.md` lines 847–849: “that the ring is integral over its invariants (Tag 03BJ, `IntegralInvariants.lean`): the flat case of 2.1, and the integrality used in 1.1”.

**Claim:** 1.1 uses no integrality. The route of 1.2 uses it, and there it holds because `A` is finite over `k ⊆ A^R`, for every `I`. That includes relations with non-flat projections, where the hypothesis of Tag 03BJ (finite locally free `s`, `t`) fails.

**Witness:** README lines 340–341 (1.2): “`A` is integral over `A^R` (… Tag 03BJ, in the flat case; here `A` is finite over `k ⊆ A^R`)”. The relation of 3.2: `dim_k O(Z) = 15`, and its projection is not flat (2.1, third Check).

**Repair:** Delete “and the integrality used in 1.1,” (the replacement text of R01 already omits it). After the sentence on Tag 03BJ, add: “1.2 needs no such input: there `A` is integral over `A^R` because it is finite over `k ⊆ A^R`, with no flatness.” In the description, change “to 2.1 and 1.1” to “to 2.1”.

## R03 (P3) — Tag 02V8 is restriction of relations (0.2), not a characterization on points

**Location:** `TauCetiRoadmap/FiniteEquivalenceRelations/README.md` lines 841–844: “defines pre-relations and equivalence relations of schemes and characterizes them on points (Tags 022Q and 02V8) … the scheme-theoretic side of 0.3.”

**Claim:** Tag 02V8 says that (pre-)equivalence relations pull back along any `U′ → U`. In `PreRelations.lean` it is `isPreEquivalenceRelation_restrict` and `isEquivalenceRelation_restrict`, which make up the scheme-theoretic side of 0.2. The file's main definitions are `restriction` and `restrict`; it does not define pre-relations.

**Witness:** stacks-groupoids lines 79–84 (Lemma 39.3.2, Tag 02V8: restriction along `g : U′ → U`). In `PreRelations.lean`, the docstring lists `restriction` and `restrict` as main definitions (lines 20–21), and line 300 tags `isPreEquivalenceRelation_restrict` with `@[stacks 02V8 …]`.

**Repair:** Replace lines 841–844 with: “`StacksFrontier/AlgebraicGeometry/GroupScheme/Relations/PreRelations.lean` identifies Mathlib's `IsEquivalenceRelation` with a monic pre-relation that is an equivalence relation on `T`-points, and shows that it induces an equivalence relation on underlying points (Tag 022Q). With `GroupScheme/OverField/GroupoidOfEquivalenceRelation.lean`, which gives the groupoid scheme of an equivalence relation (Tags 0232 and 0233), this is the scheme-theoretic side of 0.3. The same file restricts pre-relations and equivalence relations along any `U′ → U` (Tag 02V8): the scheme-theoretic side of 0.2.” In the description, change “(Tags 022Q, 02V8) … to 0.3” to “(022Q) … to 0.3, restriction (02V8) to 0.2”.

## R04 (P3) — the module-descent declaration has no file, and its directory is not in References

**Location:** `TauCetiRoadmap/FiniteEquivalenceRelations/README.md` line 852 says “`ModuleCat.isEffectiveDescentMorphismForModules_iff_universallyInjective` (Tag 08XA)”; References lines 905–906 list only “`…/GroupScheme/Relations`, `…/Groupoids`”.

**Claim:** The declaration is in neither listed directory, and unlike every other mapping in the section it is given without a file. Its companion for descent morphisms is the counterpart of `full_faithful_comparison_iff`, and the section does not name it.

**Witness:** At c496df0, `StacksFrontier/AlgebraicGeometry/Descent/Modules/EffectiveDescent.lean` has `isEffectiveDescentMorphismForModules_iff_universallyInjective` at line 692 and `isDescentMorphismForModules_iff_universallyInjective` at line 684, both `@[stacks 08XA]`.

**Repair:** Replace lines 852–854, up to “the theorem of 4.2.”, with: “For modules, `ModuleCat.isDescentMorphismForModules_iff_universallyInjective` and `ModuleCat.isEffectiveDescentMorphismForModules_iff_universallyInjective` (Tag 08XA, `Descent/Modules/EffectiveDescent.lean`) identify descent and effective descent for all modules with universal injectivity: the second and third theorems of 4.2.” Add `StacksFrontier/AlgebraicGeometry/Descent` to the directories of the References entry.

## R05 (P3) — “4.3–4.4 are not there”, but the main step of 4.4's route is there

**Location:** `TauCetiRoadmap/FiniteEquivalenceRelations/README.md` lines 854–855: “the descent along the quotient map of 4.3–4.4 are not there.”

**Claim:** 4.4 is not about descent along the quotient map. Its route rests on Stacks Lemma 35.13.2 (Tag 0EUA), which AxiomMath formalizes for families of morphisms of affine schemes. With Tag 08XA, it gives 4.4 once AxiomMath's notions are matched with Mathlib's.

**Witness:** At c496df0, `StacksFrontier/AlgebraicGeometry/Descent/EffectiveEpi/QuasicoherentSectionsEqualizer/UniversalEffectiveEpi.lean` line 783 tags `quasicoherentSectionsEqualizer_iff_isUniversalEffectiveEpiFamily` with `@[stacks 0EUA]`.

**Repair:** Replace the sentence with: “Tag 0EUA, the step of 4.4's route, is `AlgebraicGeometry.quasicoherentSectionsEqualizer_iff_isUniversalEffectiveEpiFamily` (`Descent/EffectiveEpi/QuasicoherentSectionsEqualizer/UniversalEffectiveEpi.lean`). It is stated for AxiomMath's own universal effective epimorphic families, not for Mathlib's `MorphismProperty.universally`. Non-flat relations, the effectivity criterion of 1.3, the examples of Layer 3 and the descent along the quotient map of 4.3 are not there.”

## R06 (P3) — “records it as unreviewed by humans” is not what the repository says

**Location:** `TauCetiRoadmap/FiniteEquivalenceRelations/README.md` lines 835–836: “Its `StacksFrontier` tier is written by AI agents and builds without `sorry`; the repository records it as unreviewed by humans”.

**Claim:** The repository's README calls `StacksFrontier` AI-written and contrasts it with the human-reviewed tier `StacksCore`. It also says that maintainers review every pull request to either tier, so it does not record the tier as unreviewed.

**Witness:** AxiomMath `README.md` at c496df0: line 13 calls `StacksCore` human-reviewed; line 14 calls `StacksFrontier` AI-written, needing review before it moves to `StacksCore`; line 53 says maintainers review pull requests to both tiers.

**Repair:** Replace the clause with: “the repository describes it as written by AI agents and keeps it apart from its human-reviewed tier `StacksCore`”.

## Previous findings

- none: the review of 34c9767 raised no finding.

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| Tag 03BM / `AffineQuotient.lean` → 2.1 `isEffectiveEquivalenceRelation_of_flat` (R01) | trivial `ℤ/2`-groupoid on `Spec k`; free swap on `A = k × k` (2.1 Check) | trivial: `C = k`, `U ×_M U` rank 1 over `U`, `R` rank 2, not iso. Swap: `C = k`, `U ×_M U = Spec k⁴ = R` | needs `(t, s)` an equivalence relation |
| Tag 03BJ / `IntegralInvariants.lean` → 1.2 `isColimit_cofork` (R02) | relation of 3.2 on `Z`; `I = ⊥` on `k × k` | `Z`: `dim_k A = 15`, so `A` is integral over `A^R ⊇ k`; projection not flat, so 03BJ does not apply. `k × k`: free, 03BJ applies | 1.2's integrality is finiteness over `k`; 1.1 uses none |
| Tag 02V8 → 0.2 `IsEquivIdeal.map_quotient` (R03) | 0.2 Check `I = (x² − y²)`, `𝔞 = (t − 1)` | scheme restriction `R′ = Spec k[x,y]/(x−1, y−1, x²−y²) = Spec k`; ideal image `0` in `k ⊗ k`; same point `(1, 1)` | 02V8 is the scheme side of 0.2 |
| Tag 022Q, `isEquivalenceRelation_iff_mono_and_isPreEquivalenceRelation` → 0.3 `isEquivalenceRelation_iff` | `I = ker μ`; `I = ⊥` (0.3 Checks) | `ker μ`: `R ≅ X`, both projections equal, mono, equivalence on `T`-points; `⊥`: `X ×_k X`, pair of projections, total relation on `T`-points | both forms agree; mapping to 0.3 sound |
| Tags 0232, 0233 / `GroupoidOfEquivalenceRelation.lean` → 0.3 | stacks-groupoids lines 1216–1221; file line 143 | `@[stacks 0233] existsUnique_groupoidScheme_of_isEquivalenceRelation`: unique groupoid extending `j` | as stated |
| Tag 08XA → 4.2 `full_faithful_comparison_iff`, `nonempty_comonadicLeftAdjoint_iff` (R04) | `ℤ → ℚ`; `ℤ → ℤ × ℤ/2` | `ℤ/2 → ℚ ⊗ ℤ/2 = 0`: not universally injective, not descent; split map: universally injective, effective. Stacks labels (a) descent, (b) effective, (c) universally injective | matches 4.2's “(a) ⇔ (c)”, “(b) ⇔ (c)” |
| Tag 0EUA → 4.4 `universally_effectiveEpi_iff` (R05) | `ℤ → ℤ × ℤ/2`; `ℤ → ℚ`, `M = ℤ/2` | split: equalizer for every `M`, so universal effective epi; `ℚ`: `ℤ/2 → 0` not injective, so not | AxiomMath line 783 has the route's step |
| Provenance metadata (lines 833–839, 903–907) | AxiomMath `lean-toolchain`, `lake-manifest.json`, `LICENSE`, `README.md` at c496df0; our `lean-toolchain` | theirs: Lean `v4.35.0`, Mathlib `inputRev v4.35.0`; ours: Lean `v4.36.0-rc2`, Mathlib `1b1ccf4` (2026-11-02); Apache 2.0; README line 7 “no `sorry`” | as stated, except R06 |

The rows for the untouched statements stand as in the previous review, of 34c9767.

- Gate rerun (`gate … --base origin/main`): every count `0`, `OK`; the worker's gate, with the targeted build, is `OK`. Dependency check: `depcheck: 237 roadmaps, 2241 edges, 0 problem(s)`, no UPWARD, CYCLE or `moved:` line; the new section adds no supplier.
- `lake env lean` on `Suggested.lean`: exit 0, 22 warnings, all “declaration uses `sorry`”. The file is unchanged since 34c9767 (the diff touches only the README). None of the 46 names it declares matches the 98 AxiomMath declaration names in the files opened.
- Nothing outside the folder differs from `origin/main` (`outside-folder=0`; `git diff --stat` outside the folder is empty).
- Source locators of the changed passages checked (10): stacks-groupoids lines 68 (022P), 79 (02V8), 92 (022Q), 1216 (0232), 1219 (0233), 2132 (03BJ), 2152 (03BK), 2420–2429 (03BM); Stacks online, Tag 07S6 (Proposition 66.14.1) and Tag 08XA (Theorem 35.4.22).
- External code opened at c496df0: 11 Lean files (the 6 named in the section, `InvariantBaseChange.lean`, `Descent/Modules/EffectiveDescent.lean`, `UniversalEffectiveEpi.lean`, `EffectiveEpi/AffineBase.lean`, `UniversallyInjective/EqualizerDiagram.lean`); every path the section names exists.
- Pull request text: the title and the first four paragraphs are unchanged, and they still agree with the README. The added Provenance paragraph matches the head and carries the wording of R01–R03; those repairs give its corrected text.
- Overlap check: read GroupSchemesOverABase (open, vocabulary 0.09; the other two lists are empty). Both cite ModularCurves 0C for finite quotients, and nothing else is shared. No other open pull request changes this folder, and no cited id is dropped.
- Source independence: 10 passages compared with 1 source (Stacks: the cached groupoids chapter at 8 tags, plus Tags 07S6 and 08XA online), changed passages only; the AxiomMath docstrings of the 11 files were also compared. Nothing is shared beyond tag numbers and standard names. Largest share Stacks, 31 of 84 locators (the previous 23 of 76 plus the section's 8 tags). Contents were not compared again: no layer was added, removed or reordered.

## Not verifiable

- As before: Venken 1971, Philippe 1973, Olivier, Joyal–Tierney 1984, and Mesablishvili 2004a and 2004b are paywalled or not online; the README cites them only for history and in Research context.
- The Buffalo lecture of 11 July 1973 appears only in the description; the README cites no source for it.
- The claim of line 854 that AxiomMath lacks non-flat relations, 1.3, Layer 3 and 4.3 was checked only against directory listings and the files opened. The repository has about 63,000 modules, and code search needs authentication.

## Source issues

- none

## For the human reviewers

- Scope: no published source states `not_isEffectiveEquivalenceRelation_raicuArtin` or `raicuCocycle_not_mem_differenceIdeal`, and README Scope and 3.2–3.3 say so. The previous review recomputed the field-uniform rank argument (`52 > 51`) over `ℤ`.
- Priority: kollar2012 lines 143–144 call Venken 1971 and Philippe 1973 closely related. An earlier branch commit (c2992349) described a non-effective relation in Venken 1971, Corollaire 3.1; 7a81d5f3 dropped it as unchecked. Venken was not read.
- README Research context reports an unpublished exhaustive search and concludes that the smallest length is at least 5 over `𝔽₂` and `𝔽₃`. The previous review reproduced the search over `𝔽₂` and `𝔽₃` for lengths 3 and 4.
- Licence: README lines 831–855 map targets to AxiomMath, *The Stacks Project in Lean* (Apache 2.0 per `LICENSE` at c496df0; its `StacksFrontier` tier is AI-written per that repository's README line 14). The description says its maintainers have not been contacted. Nothing is adapted into `Suggested.lean`.
