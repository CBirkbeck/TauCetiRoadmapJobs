# Review of ArakelovGeometryAndAbelianHeights (pull request #1000 at 5fc305b)

**Verdict:** accepted

This is an incremental re-review of the 14 lines changed since c8ff97c, all in `README.md` (+7/−7): lines 60, 122, 130, 138, 161, 1378 and 1389. The previous report's only finding is repaired, and the repair introduces no new problem. The gate passes, and the dependency check reports no problem with or without `--movable`. This report has no findings.

## Previous findings

- R01 — repaired: line 122 now reads "On determinants it is Tau Ceti’s fixed-rank comparison `…pullbackDeterminantIso f g` for `f : S′ → S`, applied to `ω_G` as a sheaf of constant rank `g`, transported to `det` by `…detIsoDeterminant` on `S` and on `S′`". The *Needs:* lines at 138 and 1389 list `pullbackDeterminantIso`, `…_hom_app_id` and `…_hom_app_comp`.

## Verified sound

**Gate.** The worker's gate at 5fc305b has every counter at 0, with `build=0` and `OK`. My own gate run on this head also has every counter at 0 and ends `OK`. `git diff --stat origin/main...HEAD`, excluding the roadmap folder, is empty. Between c8ff97c and this head only `README.md` changed. `Suggested.lean`, `lake-manifest.json` and `lean-toolchain` are unchanged, so the pins are still Tau Ceti 2fd255d and Mathlib 1b1ccf4.

**Elaboration.** `lake env lean` on `TauCetiRoadmap/ArakelovGeometryAndAbelianHeights/Suggested.lean` exits 0 with no output. The file still declares nothing, so there is no `#check @name` comparison, no one-tactic probe and no padding. The change does not make any headline statable: Néron models, the Faltings metric and integral Siegel compactifications are still absent at the unchanged pins. The module docstring's list of headlines that are not statable is therefore still correct.

**Dependency check.** The board merge order places AbelianSchemesAndArithmeticModuli at line 41, NeronModelsAndSemistableAbelianVarieties at 65, PELModuli at 116, this roadmap at 141, FaltingsFinitenessAndIsogenyTheorems at 159 and ShimuraCompactifications at 162. SchemeAndStackFoundations is on main.

```text
# --movable
depcheck: 237 roadmaps, 2430 edges, 0 problem(s)
# without --movable
depcheck: 237 roadmaps, 2430 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line. The only roadmap edge the change adds is SchemeAndStackFoundations §1.22, and that roadmap was already a supplier (§§0.3, 1.23, 3.8).

**Citations and overlaps, rerun on this head.**
- `roadmaps resolve` finds no unresolved cross-roadmap citation and no unresolved Lean name.
- `roadmaps overlaps` finds no open pull request that changes this roadmap, no dropped cited id and no id that only an open revision defines.
- No heading changed, so no id this roadmap owns moved.

**Pinned declarations opened for the repair (Tau Ceti 2fd255d, `AlgebraicGeometry/VectorBundle/…`), 9 names.**

| Declaration | Location | What it says, compared with the README |
|---|---|---|
| `FiniteLocallyFreeSheaf.pullbackDeterminantIso (f : X ⟶ Y) (r : ℕ)` | `Determinant/Pullback.lean:76` | `determinant Y r ⋙ InvertibleSheaf.pullback f ≅ FixedRank.pullback f ⋙ determinant X r`. It is a natural isomorphism `f^*(⋀^r E) ≅ ⋀^r(f^*E)` on `FixedRank Y r`, as line 60 says. With `f : S′ ⟶ S` and `r = g`, it has the direction used at line 122. |
| `…pullbackDeterminantIso_hom_app_id` | same file, :118 | `P_{𝟙}.app E ≫ det.map (FixedRank.pullbackId).hom.app E = (InvertibleSheaf.pullbackId).hom.app (det E)`: the comparison along the identity is induced by the identity isomorphisms (line 60). |
| `…pullbackDeterminantIso_hom_app_comp (f : X ⟶ Y) (g : Y ⟶ Z)` | same file, :135 | `P_{f≫g} ≫ det.map (FixedRank.pullbackComp f g).inv = (InvertibleSheaf.pullbackComp f g).inv ≫ f^*(P_g) ≫ P_f`. This is "the comparison along `h` followed by the comparison along `f`" for a composite `f ≫ h` (line 60, where the README writes `h` for Lean's `g` because `g` is already the relative dimension). |
| `…pullbackDetIso (f) (E : FiniteLocallyFreeSheaf Y)` | same file, :156 | It has only `_hom_hom` and `_inv_hom` (:168, :180) and no identity or composition lemma. So "only the constant-rank comparison carries the coherences" (line 60) and "isomorphism only, and is not used for the cocycle" (line 130) are exact. |
| `…detIsoDeterminant {r} (E : FixedRank X r)` | `Determinant/LocallyConstantRank.lean:149` | `det E.obj ≅ (determinant X r).obj E`, defined object by object. No naturality lemma exists (grep over Tau Ceti), so the README's "no naturality of `detIsoDeterminant` is used" avoids an input that is not at the pin. |
| `FixedRank X r` | `FixedRank.lean:71` | the full subcategory of sheaves of rank `r` at every point. `ω_G` of a group scheme all of whose fibres have dimension `g` lies in `FixedRank S g`. |
| `FixedRank.pullbackId`, `FixedRank.pullbackComp` | `FixedRank.lean:129`, `:157` | natural isomorphisms, the ones used in the two coherence lemmas |
| `InvertibleSheaf.pullbackComp` | `LineBundle/Functoriality.lean:85` | a natural isomorphism `pullback g ⋙ pullback f ≅ pullback (f ≫ g)`. Its naturality is the one line 130 invokes. |

**Line 130's cocycle claim, computed.** Write:
- `D_X` for `detIsoDeterminant` on `X`;
- `P_f` for `pullbackDeterminantIso f g`;
- `β_f : f^*ω_G ≅ ω_{G_{S′}}` for the base change of `ω_G`;
- `c_f = D_{S′}⁻¹ ∘ det_g(β_f) ∘ P_f ∘ f^*D_S` for the comparison of line 122.

Take `h : S″ → S′`. Then `c_h ∘ h^*c_f = D_{S″}⁻¹ ∘ det_g(β_h) ∘ P_h ∘ h^*D_{S′} ∘ h^*D_{S′}⁻¹ ∘ h^*det_g(β_f) ∘ h^*P_f ∘ h^*f^*D_S`. The step to `c_{f∘h}` goes as follows:
1. The two `D_{S′}` factors cancel.
2. The naturality of `P_h` moves `det_g(β_f)` past `P_h`.
3. `hom_app_comp` replaces `h^*P_f` followed by `P_h` with `P_{f∘h}`, conjugated by the composition isomorphisms.
4. The naturality of `InvertibleSheaf.pullbackComp` moves `D_S` through.
5. The cocycle of `β` closes the square.

This is exactly the list at line 130.

For the identity, `hom_app_id`, `β_{id} = pullbackId` and the naturality of `InvertibleSheaf.pullbackId` give `c_{id} = D_S⁻¹ ∘ D_S ∘ pullbackId = pullbackId`.

**§1.22 citation.** SchemeAndStackFoundations §1.22 on main (README line 2989) defines `Stacks.QCoh X` and characterizes it as compatible families `(F_x ∈ QCoh(T))_{x∈X(T)}` with pullback isomorphisms satisfying the cocycle condition (Stacks 06WG). This is what §5.0b's *Needs:* parenthesis says. The section keeps its number at the two open revisions of that roadmap (lines 3265 and 2959). The base-change comparisons are declared natural identifications at line 118, which covers their naturality in `G` that the stack descent also needs.

**§5.0b notation change (lines 161, 1378).** The change from `ω_G^m` to `ω̄_G^{⊗m}` brings §5.0b into agreement with what consumes it:
- §5.3: `π_n^*L_n ≅ ω̄_G^{⊗m}` (line 1464);
- §5.4: `π^*L ≅ ω̄_G^{⊗m}` and "`m` is chosen so that `ω̄^{⊗m}` descends" (lines 1490, 1495, 1501);
- §5.5: line 1530;
- the Hodge-degree criterion in the same section, which already used `det ω_G`.

**Seeded sample.** No locator changed or was added. Of the sampled targets, §§5.3 and 5.4 cite §5.0b, and their statements are unchanged. The change resolves the notational mismatch between them and §5.0b (see the table). The §5.0b locators (Faltings–Chai V) and the Hodge-line interface locators are unchanged lines. See "Not verifiable".

**Shape and policy.** The changed lines contain no LaTeX delimiter, process word, pull-request number or "optional/deferred" (the gate's scanners plus grep). §5.0b keeps its Checks and its *Needs:* line. Every backticked Tau Ceti name in the changed lines resolves at the pin.

**Ownership.** The change adds no object of this roadmap's own. The determinant base change and its coherences are cited at the Tau Ceti pin, and stack descent is cited from SchemeAndStackFoundations §1.22. The ownership audit of the previous reports (FaltingsFinitenessAndIsogenyTheorems and its Part II, ArakelovGeometryAndAbelianHeightsPartII, HeightsRationalPointsAndObstructionsPartII, AbelianSchemesAndArithmeticModuli) is unaffected.

**Adversarial table: rows for the changed statements, with computed values.**

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| `pullbackDeterminantIso f r` is a natural iso `f^*(⋀^r E) ≅ ⋀^r(f^*E)`, line 60 | `E = O ⊕ O(1)` on `ℙ¹_ℤ`, `r = 2`, `f : ℙ¹_{𝔽_p} → ℙ¹_ℤ` | `⋀²E = O(1)`. Both sides are `O(1)` on `ℙ¹_{𝔽_p}`, of degree 1. | correct |
| Composite direction, line 60 (`hom_app_comp`) | `E = ℤ²`, `Spec 𝔽_p → Spec ℤ_(p) → Spec ℤ` | Along the composite `e₁∧e₂ ↦ e₁∧e₂`; in two steps `e₁∧e₂ ↦ e₁∧e₂ ↦ e₁∧e₂` | agree |
| Wrong model: sign-twisted comparison `c′_f = −c_f` | the same maps, over `ℤ` (where `−1 ≠ 1`) | `c′_{f∘h} = −c` but `c′_h∘h^*c′_f = +c`; `c′_{id} = −id ≠ id` | excluded by `hom_app_comp` and `hom_app_id`. A `pullbackDetIso`-only route would not exclude it. |
| Hodge-line base change and its cocycle, lines 122 and 130 | `𝔾_m²` over `ℤ` (`g = 2`), `ℤ → ℤ_(p) → 𝔽_p` | `ω̄ = ℤ·(dt₁/t₁ ∧ dt₂/t₂)`, which goes to the same generator in one step or in two. The product (c) gives `dt₁/t₁ ⊗ dt₂/t₂`, consistently. | correct |
| The same, at `g = 1` | `𝔾_m/ℤ` | `ℤ·dt/t ↦ 𝔽_p·dt/t`, rank 1 at each stage. `determinantOneIso` identifies `det ω` with `ω`. | correct; matches the Check `ω̄ = ℤ·dt/t` |
| The same, at `g = 0` | `G = S` | `ω_G = 0 ∈ FixedRank S 0`. `determinantZeroIso` makes every `c_f` the identity of `O`. | correct; matches the Check "Hodge line `O_S`" |
| `π^*L ≅ ω̄_G^{⊗m}`, lines 161 and 1378, `g = 1` | `A₁^* = ℙ¹_ℤ`, `L = O(1)`, `m = 12` | `ord_∞ Δ = 1` (`Δ = q − 24q² + …`). `deg ω = 1/24` on the stack, so `deg ω^{⊗12} = 1/2 = deg j^*O(1)`, because the coarse map has degree `1/2`. | correct; matches the §5.0b Check |
| The same, at `g = 2`: why `det` is needed | `Ā_{2,Σ}` | `rank ω̄^{⊗12} = 1`, but `rank ω^{⊗12} = 2¹² = 4096` and `rank Sym¹²ω = 13`. `H⁰(ω̄^{⊗k})` gives scalar Siegel forms: `dim M₄ = 1` (`ψ₄`), `dim M₁₀ = 2` (`ψ₄ψ₆`, `χ₁₀`). | only `det` gives a line and the scalar graded ring, so the change is a correction |
| Graded ring at `g = 0`, line 1378 with the Check of line 1385 | `Spec ℤ`, `ω̄ = O` | `⊕_k H⁰(O^{⊗k}) = ℤ[t]`, whose relative `Proj` is `Spec ℤ` | consistent |
| §5.0b *Needs:* §1.22 parenthesis | main §1.22 | families indexed by `x ∈ X(T)` with a cocycle condition (06WG) | resolved, accurate |

Rows carried forward from the previous report (review of c8ff97c), for statements the diff leaves untouched:
- exterior-power rank `choose`: `2, 1, 0`;
- symmetric-power rank `multichoose`: `3`, versus `6` for the wrong formula;
- `det` on `Spec(ℤ×ℤ)` with mixed rank;
- `determinantOneIso` and `determinantZeroIso`;
- the bridge sentence: `𝔞 = (2, 1+√−5)` is not principal;
- `tilde…PowerIso` on `ℤ/2`: `0 = 0`;
- `pullbackToModulesMonoidal` at `m = 12`;
- the scope paragraph: `absMulHeight₁ 2 = 2`;
- docstring statability.

Rows that report carried from the review of 3d682b8:
- Euclidean heights: `0.34657`, `√5`, and `0` versus `1`;
- the field comparison: `4`;
- §1.10: `½ log 5 ≠ 0`;
- §1.13;
- §1.14: `0.11157`;
- §2.9: `Δ′ = 2^{−12}Δ`;
- §4.3: `8` and `4`;
- §5.7: `0.61397`;
- §5.9: `1.5516`.

It also carried the rows from the review of 801dbbf for §§1.2, 1.3, 1.7, 1.11, 2.0–2.2, 2.6, 2.7, 2.9/3.1, 3.2–3.6, 4.1, 4.3, 4.4(ii), 5.0b, 5.1, 5.2, 5.5, 5.6/6.4, 5.8, 5.9, 6.1, 6.3, 6.5 and 6.6.

**Remark on untouched text (no change requested).** The §5.3 statement (line 1464) says the metric on `ω̄_G|_S` has logarithmic singularities "for the extension `ω_G`". The line that is meant is `ω̄_G`, as the same paragraph's `π_n^*L_n ≅ ω̄_G^{⊗m}` shows.

## Not verifiable

- Faltings, *Endlichkeitssätze* (GDZ, open). It supplies the Hodge-line interface locator §2, pp. 350–351, which is an unchanged line. The sources service fetched the GDZ PDF, but it is an image-only scan. This worker has no OCR and no PDF page renderer, so the page could not be read.
- Faltings–Chai, *Degeneration of Abelian Varieties* (Springer, paywalled). It supplies the §§5.0a–5.0b locators (V, Proposition 2.1 and Theorem 2.3, pp. 149–150), which are unchanged. They are cited by locator alone, as in the previous reports. The rewritten graded ring `⊕ H⁰(ω̄^{⊗k})` with `ω̄ = det ω` is the standard Hodge-line convention, and it agrees with §§5.3–5.5 of this roadmap.

## Source issues

- none
