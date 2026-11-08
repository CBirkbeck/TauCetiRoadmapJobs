# Review of ArakelovGeometryAndAbelianHeights (pull request #1000 at 3d682b8)

**Verdict:** needs changes

Incremental re-review of the 85 changed lines since 801dbbf (README only; `Suggested.lean` and `metadata.toml` unchanged). Two P3 findings, nothing blocking. The gate passes. The dependency check shows no problem with or without `--movable`. All three previous findings are repaired.

## R01 (P3) — Determinant, dual, tensor and power functors of finite locally free sheaves are pinned Tau Ceti declarations but are still attributed to AlgebraicVectorBundles L0B–L0C

Location: `TauCetiRoadmap/ArakelovGeometryAndAbelianHeights/README.md` line 9: "their symmetric and exterior powers and their determinant belong to **AlgebraicVectorBundles**, Layers L0B–L0C, including `determinantObj`". Line 55: "**AlgebraicVectorBundles** Layers L0B–L0C supplies `determinantObj`, tensor, dual, symmetric and exterior powers of these sheaves, with their affine and pullback comparisons". The same name appears at lines 108 and 111 ("using `determinantObj`"), and §5.0b's *Needs:* (line 1379) cites "**AlgebraicVectorBundles** Layer L0C".

Claim: these operations are supplied by a roadmap section, and the Hodge line `det ω_G` is taken through that roadmap's `determinantObj`.

Witness: at Tau Ceti 2fd255d, `TauCeti.AlgebraicGeometry.FiniteLocallyFreeSheaf.det : FiniteLocallyFreeSheaf X → InvertibleSheaf X` (`TauCeti/AlgebraicGeometry/VectorBundle/Determinant/LocallyConstantRank.lean:62`) has the exact signature of AlgebraicVectorBundles' sorried `determinantObj` (its `Suggested.lean:344` on main).

The previous report let `determinantObj` stand because the name does not occur at the pin. That was a search by name; this is a search by object. The open revision of AlgebraicVectorBundles, at its head, says the same in its README lines 46–58: these objects are "already at the pins", and consumers use the Tau Ceti declarations for them.

Repair: in lines 9 and 55, cite these pinned Tau Ceti declarations, each with its module:
- tensor product: `FiniteLocallyFreeSheaf X` is a symmetric monoidal full subcategory (`AlgebraicGeometry.Scheme.Modules.isMonoidal_isFiniteLocallyFree`, `VectorBundle/FiniteLocallyFree.lean:91`);
- dual: `FiniteLocallyFreeSheaf.dual` and `.rigidCategory` (`Dual/Basic.lean:64, 96`), with `.pullbackDualIso` (`Dual/Pullback.lean:46`);
- exterior and symmetric powers: `FiniteLocallyFreeSheaf.exteriorPower` and `.symmetricPower` (`ExteriorPower/Basic.lean:56`, `SymmetricPower/Basic.lean:48`), with `.pullbackExteriorPowerIso` and `.pullbackSymmetricPowerIso` (`ExteriorPower/Pullback.lean:49`, `SymmetricPower/Pullback.lean:49`);
- determinant: `FiniteLocallyFreeSheaf.det` in locally constant rank, with `.pullbackDetIso` (`Determinant/Pullback.lean:156`); and `FiniteLocallyFreeSheaf.determinant X r : FixedRank X r ⥤ InvertibleSheaf X` in fixed rank (`Determinant/Basic.lean:59`), with `.determinantOneIso`, `.determinantZeroIso` (:121, :142) and `.pullbackDeterminantIso` (`Determinant/Pullback.lean:76`);
- affine comparison: `FiniteLocallyFreeSheaf.finiteProjectiveEquiv` (`Affine/Basic.lean:112`), monoidal (`Affine/Monoidal.lean:45`) and dual-compatible (`Affine/Dual.lean:53`).

In lines 108 and 111, replace `determinantObj` by `TauCeti.AlgebraicGeometry.FiniteLocallyFreeSheaf.det`. Keep **AlgebraicVectorBundles** L0C, in line 55, line 669 and §5.0b's *Needs:*, only for what the pin lacks. Its one such item is the affine comparison of exterior and symmetric powers and of the determinant (`VectorBundle/Affine/` has only the tensor and dual comparisons). Drop it if no target uses that comparison.

Tested on the instances the README relies on:
- For `ω_E` of an elliptic curve (rank 1), `determinantOneIso` gives `det ω_E ≅ ω_E`.
- For the zero abelian variety (rank 0), `determinantZeroIso` gives the trivial line. This is the Conventions' "unit Hodge line".
- `pullbackDetIso` is the base-change identity (a) of line 104 for `det ω_G`.

## R02 (P3) — The rewritten scope paragraph attributes §5.1 and the absolute scalar height to Tau Ceti

Location: `README.md` line 15: "Tau Ceti’s `Chow.cyclesOfDimension` and `Chow.RatEquiv` supply dimension-graded cycles … on every locally Noetherian scheme, and its §5.1 supplies the Chow groups of the special fibres …. Its §§1.19–1.22 supplies …". The same paragraph says: "Tau Ceti’s `TauCeti.NumberTheory.Height` modules supply the absolute scalar and tuple heights".

Claim: the inserted Tau Ceti clause becomes the antecedent of "its §5.1" and "Its §§1.19–1.22", and the absolute scalar height is a Tau Ceti object.

Witness: Tau Ceti has no §5.1; the intended supplier is SchemeAndStackFoundations §5.1 (main, README line 6567). The absolute scalar height is Mathlib's `NumberField.absMulHeight₁` (`Mathlib/NumberTheory/Height/NumberField.lean:136`), as README line 51 itself says. Tau Ceti has only theorems about it.

Repair: make SchemeAndStackFoundations the explicit subject of both clauses. Write: "**SchemeAndStackFoundations** §§3.4–3.5 and 4.17 supplies …; its §5.1 supplies the Chow groups of the special fibres over their residue fields and its §§1.19–1.22 the Deligne–Mumford stack interface. Tau Ceti’s `Chow.cyclesOfDimension` and `Chow.RatEquiv` supply …". Replace the last sentence with: "Mathlib’s `NumberField.absMulHeight₁` is the absolute scalar height; Tau Ceti’s `TauCeti.NumberTheory.Height` modules supply the absolute tuple height, the Euclidean (`ℓ²`) tuple height with its sup comparison, the field comparison and bounded-degree scalar Northcott." Tested: after the edit, each supplier sentence of line 15 matches a contract paragraph: lines 51, 63, 65 and 77.

## Previous findings

- R01 — repaired: line 592 reads "the degree is `TauCeti.arakelovLogHeight x` … the comparison … is the pinned pair `TauCeti.logHeight_le_arakelovLogHeight` and `TauCeti.arakelovLogHeight_le_mul_log_natCard_add_logHeight`". Line 1556 defines `h_Θ(A, L) = log TauCeti.absoluteHeight2 (s_x(0))_x`. The re-proof sentence is gone.
- R02 — repaired: lines 55 and 63–71 now cite `FiniteLocallyFreeSheaf`, `NumberField.mulHeight_algebraMap`, `TauCeti.absoluteProjectiveTupleHeight`, `TauCeti.finite_setOf_absMulHeight₁_le`, `Projectivization.instNorthcottMulHeight`, `WeierstrassCurve.minimalDiscriminantIdeal` and the `TauCeti.ClassFieldTheory` names at the pin. R02's exemption for `determinantObj` is withdrawn by R01 above.
- R03 — repaired: line 451 defines `Z₁^c(X)_ℚ` as the "`ℚ`-span … of the elements of Tau Ceti’s `Chow.cyclesOfDimension X 1` whose support is proper over `B`". Vertical relations come from `Chow.RatEquiv X 1`, and lines 15 and 77 cite the pinned Chow module.

## Verified sound

**Gate.** The worker's gate at 3d682b8 has every counter 0 and `build=0`, `OK`. My own run of the gate on this head also has every counter 0, `OK`. Outside the folder, `git diff --stat origin/main...HEAD` excluding the roadmap folder is empty. Between 801dbbf and this head only `README.md` changed (46 insertions, 39 deletions).

**Dependency check** (board merge order: this roadmap at line 137, PELModuli 112, PadicDifferentialEquationsAndRigidCohomology 117, FaltingsFinitenessAndIsogenyTheorems 155, ShimuraCompactifications 158):

```text
# --movable
depcheck: 244 roadmaps, 2468 edges, 0 problem(s)
# without --movable
depcheck: 244 roadmaps, 2468 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line. The repair only removes supplier edges: DiophantineApproximationAndTranscendence, HeightsAndUnits, EllipticCurves and ClassFieldTheory now appear nowhere in the README (grep). It adds no roadmap edge.

**Elaboration.** `lake env lean` on `TauCetiRoadmap/ArakelovGeometryAndAbelianHeights/Suggested.lean` exits 0 with no output. The file still has no declarations, so there is no `#check @name` comparison and no one-tactic probe, and it has no padding. The worker's `signatures.md` failure ("Unknown identifier `can`") is an artifact of the signature tool, which read a word of the docstring as a name. The headline analysis of the previous report still holds. Every headline needs the Faltings height (Néron model, Faltings metric), and neither is at the pins. The pinned objects this repair adds (Euclidean heights, Chow groups) do not change that, nor does R01's `det`.

**Pinned declarations opened for the changed passages.** Each was checked for name, namespace and the hypotheses the README states.

Tau Ceti 2fd255d:
- `NumberField.mulHeight_algebraMap` and `mulHeight₁_algebraMap` (`NumberTheory/Height/NumberField.lean:132, 157`; namespace `NumberField`, no hypothesis on the tuple). The README's name is the correct one; the previous report's witness wrote `TauCeti.` for it.
- `TauCeti.absoluteProjectiveTupleHeight`, `_eq`, `_comp` and `absMulHeight₁_eq_absoluteProjectiveTupleHeight` (`Height/ProjectiveTuple.lean:80, 96, 130, 268`).
- `TauCeti.finite_setOf_absMulHeight₁_le` (`Height/Absolute.lean:187`).
- `Projectivization.instNorthcottMulHeight` and `instNorthcottLogHeight` (`Height/Northcott.lean:46, 64`). The hypothesis `Northcott mulHeight₁` is Mathlib's instance for number fields (`Mathlib/NumberTheory/Height/NumberField.lean:425`).
- `TauCeti.height2` (`Height/Arakelov/Basic.lean:65`: exponents `mult/(2[K:ℚ])` and `1/[K:ℚ]`, value 0 at zero by `height2_zero`), `arakelovMulHeight` (:123, `if y = 0 then 1 else height2 y ^ [K:ℚ]`), `arakelovLogHeight` (:127, its `Real.log`) and `arakelovMulHeight_eq` (:165).
- `TauCeti.logHeight_le_arakelovLogHeight`, `arakelovLogHeight_le_mul_log_natCard_add_logHeight`, `absoluteProjectiveTupleHeight_le_height2` (`y ≠ 0`) and `height2_le_sqrt_natCard_mul_absoluteProjectiveTupleHeight` (`Arakelov/Comparison.lean:201, 208, 137, 147`).
- `TauCeti.absoluteHeight2` (`Arakelov/Absolute.lean:52`), `absoluteHeight2_eq` (:67), `RingHom.absoluteHeight2_comp` (:84), `absoluteProjectiveTupleHeight_le_absoluteHeight2` (:126), `one_le_absoluteHeight2_of_ne_zero` (:140), `Equiv.absoluteHeight2_comp_equiv` (:165), `absoluteHeight2_smul` (:177, nonzero algebraic scalar) and `absoluteHeight2_le_sqrt_natCard_mul_absoluteProjectiveTupleHeight` (:202).
- `TauCeti.AlgebraicGeometry.Chow.cyclesOfDimension` (`AlgebraicGeometry/Chow/Basic.lean:86`, a subgroup of `AlgebraicCycle X ℤ`, height grading with `x ≤ y ↔ y ⤳ x`). `RatEquivFamily` (:112) requires integral closed `W_j` of dimension `k+1` and locally finite supports. `RatEquiv` (:257) and `ChowGroup` (:295) require `IsLocallyNoetherian`. `cycleClass` (:304).
- `TauCeti.AlgebraicGeometry.AlgebraicCycle.div` (`AlgebraicCycle/Principal.lean:71`).
- `WeierstrassCurve.minimalDiscriminantIdeal` (`EllipticCurve/MinimalModel/DiscriminantIdeal.lean:170`, Dedekind `O` with fraction field `K`, `[W.IsElliptic]`), `minimalDiscriminantIdeal_smul` (:177) and `localMinimalDiscriminantValuation` (`MinimalModel/Valuation.lean:79`).
- `TauCeti.ClassFieldTheory.finite_H` (`FiniteCohomology/DegreeTwo.lean:97`, `(n : F) ≠ 0`, `i ≤ 2`), `tateDualityPairing_perfect_mixed` (`Local/Duality/Perfect.lean:280`, `CharZero F`, `n ≠ 0`, `tr : H²(μ_n) ≃+ ZMod n`, `i + j = 2`) and `eulerCharacteristic_mixed` (`Local/EulerCharacteristic/Theorem.lean:98`, `FinitePadicExtension F p`, `p ^ ([F:ℚ_p]·v_p(#A))`).
- `TauCeti.AlgebraicGeometry.FiniteLocallyFreeSheaf` (`VectorBundle/FiniteLocallyFree.lean:108`) with `pullback` (:166).
- The R01 declarations, at the files and lines given there.

Mathlib 1b1ccf4:
- `NumberField.absMulHeight₁` (`NumberTheory/Height/NumberField.lean:136`).
- `WeierstrassCurve.variableChange_Δ` (`AlgebraicGeometry/EllipticCurve/VariableChange.lean:218`: `(C • W).Δ = C.u⁻¹ ^ 12 * W.Δ`).
- `AlgebraicGeometry.AlgebraicCycle.map` (`AlgebraicCycle/Basic.lean:69`).

**Object search for the moved "From schemes, stacks and ordinary heights" paragraph** (line 75, in the diff as a move). These citations rightly stay with their roadmap suppliers:
- Tau Ceti's Weil `classGroupAddEquivLineBundleClass` (`WeilDivisor/Scheme/Picard.lean:252`) is for dimension ≤ 1 only. The Cartier one (`CartierDivisor/ClassGroup.lean:123`) is Cartier, not Weil. So SchemeAndStackFoundations §3.4 on regular schemes is not at the pin.
- Tau Ceti has no line-bundle norm and no SNC divisor over a base: its `SmoothPair` normal-crossings charts are over a field.
- Invariant differentials at the pin are for elliptic curves only.

**Cross-roadmap citations resolved.**
- AlgebraicVectorBundles L0B and L0C on main (README lines 228, 254). Its open revision keeps the labels L0A–L2B for its renumbered layers (its line 186), so no cited id is dropped.
- SchemeAndStackFoundations §5.1 on main (line 6567, over a field `κ`; its rational-equivalence contract matches the pinned `RatEquivFamily`).
- The four supplier names the citation scan lists, each present at its supplier's head: `BarsottiTate.exists_of_tateModule_summand` (FiniteFlatGroupsAndIntegralPadicHodgeTheory README line 1811), `PELModuli.hodgeLine` and `PELModuli.hodgeLine_classify` (PELModuli lines 4010, 4018), and `RaynaudOneMotive.polarized_positive` (NeronModelsAndSemistableAbelianVarieties line 2023).
- The two renamed supplier-contract headings are cited by no roadmap (`roadmaps grep`).
- `overlaps.md` and a rerun of `roadmaps overlaps`: no other pull request changes this roadmap, no cited id is dropped, and no id is defined only by an open revision.

**Source read for the changed §5.7.** pazuki12 (arXiv v2) lines 411–419, §2.3.4 and Definition 2.6, p. 9. The theta height is the normalised logarithmic Weil height with the hermitian `ℓ²` norm at the infinite places, that is the Fubini–Study Arakelov degree, and it is bounded below by 0. This matches `log TauCeti.absoluteHeight2` and the bullet `h_Θ ≥ 0`. The seeded targets that fall in the diff are §4.3 and §5.9, and only their *Needs:* lines changed. Their locators (Raynaud Théorème 2.1.1 and Corollaires 2.1.3–2.1.4; Gaudron–Rémond Lemme 7.9; Bilu–Parent–Rebolledo Proposition 4.4(ii)) are unchanged and were read in the previous review.

**Shape.** The added lines contain no LaTeX delimiter, process word, pull-request number or "optional/deferred" (grep). Every changed section keeps its *Needs:* line, its Checks and its layer's `### Examples` and `### Dependencies`. The new Checks (lines 86–88, 1582) state values and name no Lean counterpart.

**Adversarial table.** Rows for statements the diff changed, with computed values:

| Statement | Instances | Values | Result |
|---|---|---|---|
| Euclidean height Check, line 86 | `(1,1)` over `ℚ` | `arakelovMulHeight = 2^{1/2}`, `log = 0.34657`; sup `logHeight = 0`; bound `(1/2)·log 2 = 0.34657`, attained; with `Σ|y_i|²` unrooted: `log 2` | correct |
| Euclidean height Check, line 87 | `(1,2)` over `ℚ`, `ℚ(i)` | `ℚ`: `√5 = 2.2361` (finite factors `max(1,|2|_p) = 1`); `ℚ(i)`: one complex place, `(1+4)^{2/2} = 5`; absolute `√5` in both; `2 ≤ 2.2361 ≤ 2√2 = 2.8284` | correct |
| Zero-tuple Check, line 88 | `0 : Fin 2 → ℚ` | `absoluteHeight2 0 = 0` (`height2_zero`); `absoluteProjectiveTupleHeight 0 = 1`; `1 ≤ 0` false, hence `hx : x ≠ 0` | correct |
| Field comparison, line 81 | `(1,2)`, `ℚ ⊂ ℚ(i)`; zero tuple | `mulHeight = 2² = 4` over `ℚ(i)`; zero: `1 = 1²`; absolute `4^{1/2} = 2` | correct |
| `absMulHeight₁_eq_…`, line 63 | `x = 2` | `H_abs(2,1) = 2 = absMulHeight₁ 2` | correct |
| §1.10 cycle group, line 451 | `Spec O_K`; `ℙ¹_{O_K}` fibre; `𝔸¹_{O_K}` fibre | generic point height 1 ∈ `cyclesOfDimension X 1`, closed point height 0 ∉; fibre ℙ¹: height 1, proper ∈; fibre `𝔸¹`: height 1, not proper ∉ | correct; matches Checks 1–3 |
| §1.10 vertical relations | arithmetic surface; `ℙ²_{O_K}`, `r = ℓ₁/ℓ₂` on `ℙ²_{𝔽_p}` | surface: fibres of dimension 1, no `W` of dimension 2, so the relations are 0 (`ratEquiv_eq_bot_of_pointsOfDimension_eq_empty`); `ℙ²`: `[L₁] − [L₂]` pairs with `Ō(1)` to `1·log p − 1·log p = 0` | correct |
| §1.10 horizontal relations not quotiented | `ℙ¹_ℤ`, `r = (x − 2y)/y` | `div r = [2:1] − [1:0]`; `Ō(1)_FS` pairing `½ log 5 − 0 = 0.8047 ≠ 0` | the README's exclusion is necessary |
| §1.13 finiteness via `finite_setOf_absMulHeight₁_le` | `[1:x] ∈ ℙ¹(ℚ̄)`, degree ≤ 1, `H ≤ 1` | `absMulHeight₁ x ≤ H_abs(1,x)` coordinatewise; `x ∈ {−1, 0, 1}` | matches the root-of-unity Check |
| §1.14 FS degree = `arakelovLogHeight` | `[1:1]` over `ℚ`, `ℚ(i)`; `[1:0]`; `[1:2]` over `ℚ` | `0.34657`, `log 2 = 0.69315` (doubles); `0`; FS `½ log 5 = 0.80472`, sup `log 2 = 0.69315`, difference `0.11157 ∈ [0, 0.34657]` | correct |
| §2.9 contract | `u = 2`; 11.a2 | `Δ' = 2^{-12}Δ`; `x = u²x'` gives `ω' = uω`, so `Δ_{uω} = u^{-12}Δ_ω`; `Δ_min = −11⁵`, `minimalDiscriminantIdeal ℤ W = (11)^5` | correct |
| §4.3 contract (`eulerCharacteristic_mixed`) | `F = ℚ₂`, `A = ℤ/2`; `F = ℚ₃`, `A = ℤ/2` | `#H¹ = #ℚ₂^×/ℚ₂^{×2} = 8 = 2·2·2^{1·1}`; `#ℚ₃^×/ℚ₃^{×2} = 4 = 2·2·3^0` | correct |
| §5.7 `h_Θ = log absoluteHeight2` | `[1:a:a:0]`, `a = 2^{-1/4}`, `K = ℚ(2^{1/4})` | archimedean: each embedding `Σ|y_i|² = 1+√2`, total exponent `4/8`, `½ log(1+√2) = 0.44069`; one place over 2 (totally ramified, `|a|_v = 2`, exponent `1/4`): `¼ log 2 = 0.17329`; `h_Θ = 0.61397 ≥ 0`; gap to sup height `0.44069 ≤ ½ log 4 = 0.69315` | correct; matches Checks |
| §5.7 choice invariance | common scalar `2^{1/4}`; permutation; `[1:0]` versus `[3:−4]` | `absoluteHeight2_smul` (algebraic, nonzero); `Equiv.absoluteHeight2_comp_equiv`; `log 1 = 0` versus `log 5` | correct; unitary Check consistent |
| §5.9 `h(j)` via `absMulHeight₁` | 11.a2, `j = −122023936/161051` | `161051 = 11⁵`, `122023936 = 2^{12}·31³`; `h(j) = 18.6197`, `/12 = 1.5516` | matches the Check |
| R01 instances | `ω_E` (rank 1); zero abelian variety (rank 0) | `determinantOneIso`: `det ω_E ≅ ω_E`; `determinantZeroIso`: unit line | the pinned `det` serves §2 |

Rows carried forward from the previous report (review of 801dbbf, its adversarial table); the diff leaves these statements untouched:
- §1.2: projection norm `1/√2` and `det 0 = Ō_K`.
- §1.3: `(1+i)` gives degree `−log 2`.
- §1.7: `f = 2` gives `0`.
- §1.11: `[E:ℚ]/2`.
- §2.0: predicate on `𝔾_a`, the Tate model and `t ↦ t²`.
- §2.1: sign `i^{g(g+1)}(−1)^{g(g+1)/2} = 1`.
- §2.2: `τ = i, 2i` give `1, 2`.
- §2.6: `[n]^*[n]^* = n^{2g}`.
- §2.7: `+0.5724`, `−0.3466`.
- §2.9/§3.1: 11.a2 gives `h = −0.30800984111840`.
- §3.2 invariance; §3.4 level 3/4; §3.5 `8h`; §3.6 `log p/[K′:ℚ]`.
- §4.1: `Fitt₀ = (n^g)`.
- §4.3: `μ_{p^n}` and Oort–Tate lengths.
- §4.4(ii): `(2k − [K:ℚ]n)/(2[K:ℚ])·log p`.
- §5.0b: `ℙ¹_ℤ`, `m = 12`.
- §5.1: `|q|^{−1/2}` excluded.
- §5.2 Jensen; §5.5 `12 h_Fal`; §§5.6/6.4 finiteness of `j`.
- §5.8: `m(2,2) = −9.8248`, `M(2,2) = 4.7410`, `c(2) = 65.265`.
- §5.9: `U(j=0) = 0.0020272`, `min f = 0.0017218`.
- §6.1: `E⁸`; §6.3: `#GL₂(ℤ/12) = 4608`.
- §6.5: `−1.4913g > −1.5g`.
- §6.6: `n = 0` excluded.

**Ownership.** The repair moves ownership claims only toward the pins: Euclidean heights, Chow groups, minimal discriminants, local duality and finite locally free sheaves. It claims no new object for this roadmap. The previous report's ownership audit against the open pull requests (FaltingsFinitenessAndIsogenyTheorems, its Part II, ArakelovGeometryAndAbelianHeightsPartII, HeightsRationalPointsAndObstructionsPartII, GrossZagierAndArithmeticHeights) is unaffected. Its consumer FaltingsFinitenessAndIsogenyTheorems cites `determinantObj` too (its README lines 325, 535); that is a note for that roadmap.

## Not verifiable

- Faltings–Chai, *Degeneration of Abelian Varieties* (Springer, paywalled): every locator into it is cited by locator alone, as in the previous report. No changed passage adds a locator into it.
- Bombieri–Gubler §1.5 (line 81, paywalled): cited by locator alone. Both facts it supports are pinned declarations (`NumberField.mulHeight_algebraMap`, `TauCeti.absoluteProjectiveTupleHeight_comp`).
- faltings83 §2 Bemerkung d) and deligne85 §1.10: displayed values lost in the text layers, as before. These passages are unchanged.

## Source issues

- none
