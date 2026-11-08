# Review of ArakelovGeometryAndAbelianHeights (pull request #1000 at c8ff97c)

**Verdict:** needs changes

This is an incremental re-review of the 39 lines changed since 3d682b8: 30 lines in `README.md` and 9 in the `Suggested.lean` module docstring. Both previous findings are repaired. The R01 repair introduces one new P3 finding. Nothing is blocking. The gate passes, and the dependency check reports no problem with or without `--movable`.

## R01 (P3) — Compatibility with composition is credited to `pullbackDetIso`, but at the pin only the fixed-rank `pullbackDeterminantIso` has composition lemmas

**Location.** `TauCetiRoadmap/ArakelovGeometryAndAbelianHeights/README.md` line 122 reads: "compatible with composition of base changes; on determinants it is Tau Ceti’s `TauCeti.AlgebraicGeometry.FiniteLocallyFreeSheaf.pullbackDetIso` composed with the base change of `ω_G`". The *Needs:* lines of the Hodge-line interface (line 138) and of §5.0b (line 1389) cite `pullbackDetIso`. Neither cites `pullbackDeterminantIso`.

**Claim.** The pinned `pullbackDetIso` supplies the base change of `det ω_G` together with its compatibility with composites `S″ → S′ → S`.

**Witness.** In Tau Ceti 2fd255d, `AlgebraicGeometry/VectorBundle/Determinant/Pullback.lean` gives `pullbackDetIso` (line 156) only `_hom_hom` and `_inv_hom` (lines 168, 180). The identity and composition lemmas are `pullbackDeterminantIso_hom_app_id` and `pullbackDeterminantIso_hom_app_comp` (lines 118, 135). Both are stated for `FixedRank` sheaves.

**Why it matters.** The supplier that was replaced, AlgebraicVectorBundles L0C, had "coherent pullback comparison isomorphisms" as its milestone (main README line 267). After the swap, no cited input owns the cocycle condition. The roadmap uses that condition in three places:
- (a) of the interface, "compatible with composition of base changes";
- §5.0b's compatibility of `π_Σ` and its line comparison under common refinements (line 1380);
- the level-map identification of `q_n^*L`, compatible with toroidal pullback.

Both places work in constant rank `g`: §2.0 assumes "all fibres of dimension `g`", and §5.0b uses the Hodge line of the universal family. So the coherent fixed-rank comparison applies directly.

**Repair.** In line 122, replace the clause after the semicolon with: "on determinants it is Tau Ceti’s `TauCeti.AlgebraicGeometry.FiniteLocallyFreeSheaf.pullbackDeterminantIso f r` with `r = g`, transported to `det` by `detIsoDeterminant` and composed with the base change of `ω_G`. Its compatibility with identities and composites is `…pullbackDeterminantIso_hom_app_id` and `…pullbackDeterminantIso_hom_app_comp`." Then add `pullbackDeterminantIso`, `pullbackDeterminantIso_hom_app_id` and `pullbackDeterminantIso_hom_app_comp` to the *Needs:* lines at 138 and 1389. Line 130 ("the determinant commutes with pullback by `pullbackDetIso`") is correct as an isomorphism statement and can stay.

**Tested on two instances.**
- `g = 1`, with the base changes `Spec 𝔽_p → Spec ℤ_(p) → Spec ℤ`. The bundle `ω` of an elliptic curve over `ℤ` lies in `FixedRank (Spec ℤ) 1`. `pullbackDeterminantIso_hom_app_comp` with `r = 1` is the required cocycle, and `determinantOneIso` identifies the result with `ω` itself.
- `g = 0`. `determinantZeroIso` makes every comparison the identity of `O_S`, which matches the Check "For `g = 0` the Hodge line is `O_S`".

## Previous findings

- R01 — repaired: line 9 now reads "Tau Ceti’s `TauCeti.AlgebraicGeometry.FiniteLocallyFreeSheaf`, and so are their tensor products, duals, symmetric and exterior powers and determinant `…FiniteLocallyFreeSheaf.det`". Lines 55–63 pin each operation with its module. `determinantObj` and AlgebraicVectorBundles appear nowhere (grep). The repair introduces the new R01 above.
- R02 — repaired: line 15 reads "**SchemeAndStackFoundations** §§3.4–3.5 and 4.17 supplies …; its §5.1 supplies the Chow groups … and its §§1.19–1.22 the Deligne–Mumford stack interface". It continues: "Mathlib’s `NumberField.absMulHeight₁` is the absolute scalar height; Tau Ceti’s … modules supply the absolute tuple height …".

## Verified sound

**Gate.** The worker's gate at c8ff97c has every counter at 0, with `build=0` and `OK`. My own run on this head also has every counter at 0 and `OK`. Outside the folder, `git diff --stat origin/main...HEAD` (excluding the roadmap folder) is empty. Between 3d682b8 and this head only `README.md` (+20/−10) and `Suggested.lean` (+5/−4) changed.

**Dependency check.** The board merge order places this roadmap at line 137, PELModuli at 112, PadicDifferentialEquationsAndRigidCohomology at 117, FaltingsFinitenessAndIsogenyTheorems at 155 and ShimuraCompactifications at 158.

```text
# --movable
depcheck: 245 roadmaps, 2470 edges, 0 problem(s)
# without --movable
depcheck: 245 roadmaps, 2470 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line. The repair removes the AlgebraicVectorBundles edge, which pointed to a roadmap on main. The only roadmap edge it adds is SchemeAndStackFoundations §3.8, and that roadmap is already a supplier.

**Elaboration.** `lake env lean` on `TauCetiRoadmap/ArakelovGeometryAndAbelianHeights/Suggested.lean` exits 0 with no output. The file still declares nothing. So there is no `#check @name` comparison, no one-tactic probe and no padding.

The rewritten docstring bullet for Layers 2–3 is true at the pin:
- `AbelianVariety (K) [Field K]` (`AlgebraicGeometry/AbelianVariety/Basic.lean:95`) and `AbelianVariety/Isogeny.lean` exist, so abelian varieties and isogenies exist over fields only.
- No declaration names a Néron model. Every "Néron Models" hit is a BLR reference line, for example `Morphisms/Flat/StructureSheaf.lean:57`.
- Nothing is semi-abelian, and nothing Faltings-related appears outside a polynomial file.

The pinned `det`, and Tau Ceti's `FiniteLocallyFreeSheaf.relativeDifferentials` (`Modules/Differentials/LocallyFree.lean:95`, for schemes smooth over an affine `Spec R`), together give the unmetrized Hodge line over `Spec O_K`. Even so, no headline becomes statable: each one still needs Néron models, a dual abelian scheme or the Faltings metric.

**Pinned Tau Ceti declarations opened (2fd255d), 24 names.** Each was checked for name, namespace, module and the hypotheses the README states:

| Declaration | Location | What it says |
|---|---|---|
| `AlgebraicGeometry.Scheme.Modules.isMonoidal_isFiniteLocallyFree` | `VectorBundle/FiniteLocallyFree.lean:91` | finite locally free sheaves are closed under the monoidal structure |
| `…pullbackToModulesMonoidal` | `Modules/Pullback/Monoidal/Basic.lean:93` | `ι ⋙ pullback f` from `QuasicoherentSheaf Y` is `Monoidal`, for any `f : X ⟶ Y` |
| `FiniteLocallyFreeSheaf.dual` | `Dual/Basic.lean:64` | the dual |
| `…rigidCategory` | `Dual/Basic.lean:96` | the rigid structure |
| `…pullbackDualIso` | `Dual/Pullback.lean:46` | pullback commutes with the dual |
| `…exteriorPower X n` | `ExteriorPower/Basic.lean:56` | exterior power endofunctor |
| `…rank_exteriorPower_apply` | `ExteriorPower/Basic.lean:93` | rank `(E.rank x).choose n` |
| `…symmetricPower X n` | `SymmetricPower/Basic.lean:48` | symmetric power endofunctor |
| `…rank_symmetricPower_apply` | `SymmetricPower/Basic.lean:74` | rank `multichoose` |
| `…pullbackExteriorPowerIso` | `ExteriorPower/Pullback.lean:49` | pullback commutes with exterior powers |
| `…pullbackSymmetricPowerIso` | `SymmetricPower/Pullback.lean:49` | pullback commutes with symmetric powers |
| `…det : FiniteLocallyFreeSheaf X → InvertibleSheaf X` | `Determinant/LocallyConstantRank.lean:62` | `⋀^{rank E}`, for locally constant rank |
| `…detIsoDeterminant` | same file, :149 | `E : FixedRank X r` |
| `…determinant X r : FixedRank X r ⥤ InvertibleSheaf X` | `Determinant/Basic.lean:59` | fixed-rank determinant functor |
| `…determinantOneIso` | `Determinant/Basic.lean:121` | rank one: the sheaf itself |
| `…determinantZeroIso` | `Determinant/Basic.lean:142` | rank zero: the constant functor at `InvertibleSheaf.trivial` |
| `…pullbackDeterminantIso` | `Determinant/Pullback.lean:76` | pullback commutes with the fixed-rank determinant |
| `…pullbackDetIso` | `Determinant/Pullback.lean:156` | pullback commutes with `det` |
| `…finiteProjectiveEquiv R` | `Affine/Basic.lean:112` | finite projective `R`-modules ≌ `FiniteLocallyFreeSheaf (Spec R)` |
| `…finiteProjectiveEquivFunctorMonoidal` | `Affine/Monoidal.lean:45` | the equivalence is monoidal |
| `…finiteProjectiveEquivDualIso` | `Affine/Dual.lean:53` | the equivalence respects duals |
| `TauCeti.AlgebraicGeometry.tildeExteriorPowerIso` | `Modules/ExteriorPower/Affine.lean:374` | any `M : ModuleCat R`, no finiteness assumption |
| `TauCeti.AlgebraicGeometry.tildeSymmetricPowerIso` | `Modules/SymmetricPower/Affine.lean:381` | the same, for symmetric powers |

The author found the affine power comparisons `tildeExteriorPowerIso` and `tildeSymmetricPowerIso`. They supply the one item the previous report said needed AlgebraicVectorBundles L0C, so dropping that roadmap entirely is correct.

The scope-paragraph names are also correct at the pins:
- Mathlib `NumberField.absMulHeight₁` (`NumberTheory/Height/NumberField.lean:136`).
- Tau Ceti `TauCeti.AlgebraicGeometry.Chow.cyclesOfDimension` (`Chow/Basic.lean:86`, any scheme).
- Tau Ceti `Chow.RatEquiv` (:257, under `[IsLocallyNoetherian X]` at :252).

**Cross-roadmap citations resolved.**
- SchemeAndStackFoundations §3.8 `invariant_differentials` is on main (README line 5000): for a group scheme `f : G → S` with unit `e`, `Ω¹_{G/S} ≅ f^*e^*Ω¹_{G/S}`. The section is present under the same number at the two open revisions (rev 1656 line 5396, rev 1276 line 4952). Those revisions also keep §§0.3, 1.19, 1.22, 1.23 and 5.1.
- AlgebraicVectorBundles L0C on main (line 254) is scheme-only. So the swap to the scheme-level Tau Ceti `det` in §5.0b changes nothing about stacks; stack-level descent stays with §5.0a's SchemeAndStackFoundations §§1.18–1.23.
- The open revision of AlgebraicVectorBundles still declares `determinantObj` (its lines 60–66, 359–365). That is a duplication of the pin and belongs to that roadmap. This roadmap rightly cites the pin.
- A rerun of `roadmaps overlaps` finds no pull request that changes this roadmap, no dropped cited id and no id defined only by an open revision. No heading changed, so no id this roadmap owns moved.

**Seeded sample.** No locator changed or was added. The changed passages cite §1.2 (the module-level determinant) and §5.0a (through §5.0b's *Needs:*), whose text is unchanged:
- The §1.2 locators were read in the earlier reviews: deligne85 lines 423–427 (§2.1, p. 36) and bost96 lines 751–758 (A.2–A.3, p. 147).
- §5.0a cites Faltings–Chai, which is paywalled (see below).

**Shape.** The added lines contain no LaTeX delimiter, process word, pull-request number or "optional/deferred" (grep). Every changed section keeps its *Needs:* line, its Checks and its layer's `### Dependencies`.

**Adversarial table: rows for the changed statements, with computed values.**

| Statement | Instances | Values | Result |
|---|---|---|---|
| Exterior-power rank `choose r n`, line 59 | `r = 2`, `n = 1, 2, 3`; `r = n = 0` | `2, 1, 0` (`⋀³` of rank 2 is the zero sheaf, finite locally free of rank 0); `choose 0 0 = 1` | correct |
| Symmetric-power rank `multichoose r n`, line 59 | `r = 2, n = 2`; `r = 0, n = 0`; `r = 0, n = 1` | `3` (`x², xy, y²`); `1` (`Sym⁰ = O`); `0` | correct; `choose (r+n) n` would give `6` at `(2,2)` |
| `det` on locally constant rank, line 60 | `X = Spec(ℤ × ℤ)`, rank 1 on one component and 2 on the other | `det E` is `E` on the first and `⋀²E` on the second, of rank `choose 1 1 = choose 2 2 = 1`; `determinant X r` does not apply (rank not constant) | correct; the README names the right variant |
| `determinantOneIso`, `determinantZeroIso`, line 60 | `ω_E` of an elliptic curve; `G = S` (`g = 0`) | `det ω_E ≅ ω_E`; the trivial line | correct; matches the §2.0 Check `O_S` |
| Bridge sentence, line 63 | `P = O_K²`; `P = 𝔞 ⊕ O_K`, `K = ℚ(√−5)`, `𝔞 = (2, 1+√−5)`; `P = 0` | `⋀²P = O_K`; `⋀²P ≅ 𝔞`, not principal (class number 2); `⋀⁰0 = O_K` | correct; consistent with §1.2's `det(Ē ⊕ F̄) ≅ det Ē ⊗ det F̄` |
| `tilde…PowerIso` "for every `R`-module", line 61 | `M = ℤ/2` over `ℤ` (not projective) | `⋀²(ℤ/2) = 0` and `⋀²((ℤ/2)~) = 0` | correct; the pinned statement has no finiteness hypothesis |
| `pullbackToModulesMonoidal`, line 57; §5.0b *Needs:* | `O(1)` on `ℙ¹_ℤ`, `m = 12`, `f : ℙ¹_{𝔽_p} → ℙ¹_ℤ` | `f^*(O(1)^{⊗12}) ≅ O(12) = (f^*O(1))^{⊗12}` | correct; matches the §5.0b Check `m = 12` |
| §2.0 base change via `pullbackDetIso`, line 122 | `𝔾_m/ℤ`, `ℤ → 𝔽_p` | `ω̄ = ℤ·dt/t`, pulled back to `𝔽_p·dt/t`, rank 1 on both sides | the isomorphism is correct; the composition claim is R01 |
| §2.0 cocycle for `ℤ → ℤ_(p) → 𝔽_p` | `g = 1` | the pinned `pullbackDeterminantIso_hom_app_comp` (`r = 1`) holds; no pinned lemma for `pullbackDetIso` | R01 |
| Scope paragraph, line 15 | `absMulHeight₁ 2`; `Spec ℤ` | `2`; generic point ∈ `cyclesOfDimension 1`, closed point ∉; `RatEquiv` needs `IsLocallyNoetherian` (`ℤ` is Noetherian) | correct |
| Docstring statability | integral Hodge-line duality; isogeny formula | needs a Néron model or a dual abelian scheme over `O_K` (absent), and the Faltings metric (absent) | not statable; the docstring is correct |

Rows carried forward from the previous report (review of 3d682b8, its adversarial table), for statements the diff leaves untouched:
- Euclidean-height Checks, lines 86–88: `(1,1)` gives `0.34657`; `(1,2)` gives `√5`; the zero tuple gives `0` versus `1`.
- Field comparison: `(1,2)` over `ℚ(i)` gives `4`.
- `absMulHeight₁_eq_…`: `x = 2` gives `2`.
- §1.10: cycle group, vertical relations, and the horizontal `½ log 5 ≠ 0`.
- §1.13: `x ∈ {−1,0,1}`.
- §1.14: `0.80472 − 0.69315 = 0.11157`.
- §2.9: `Δ' = 2^{−12}Δ`; 11.a2 gives `(11)^5`.
- §4.3: `#ℚ₂^×/ℚ₂^{×2} = 8`, `#ℚ₃^×/ℚ₃^{×2} = 4`.
- §5.7: `h_Θ = 0.61397`, plus choice invariance.
- §5.9: `h(j)/12 = 1.5516`.

Rows that report carried from the review of 801dbbf: §§1.2, 1.3, 1.7, 1.11, 2.0, 2.1, 2.2, 2.6, 2.7, 2.9/3.1, 3.2–3.6, 4.1, 4.3, 4.4(ii), 5.0b, 5.1, 5.2, 5.5, 5.6/6.4, 5.8, 5.9, 6.1, 6.3, 6.5 and 6.6.

**Ownership.** The repair moves every vector-bundle operation onto the pin and claims no new object for this roadmap. The previous ownership audit against FaltingsFinitenessAndIsogenyTheorems, its Part II, ArakelovGeometryAndAbelianHeightsPartII, HeightsRationalPointsAndObstructionsPartII and AbelianSchemesAndArithmeticModuli is unaffected.

## Not verifiable

- Faltings–Chai, *Degeneration of Abelian Varieties* (Springer, paywalled). It supplies the §§5.0a–5.0b locators, which the diff does not change. They are cited by locator alone, as in the previous reports.
- Bombieri–Gubler §1.5 (paywalled), unchanged. The two facts it supports are pinned declarations.

## Source issues

- none
