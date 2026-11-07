<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/7586#issuecomment-6700632517 -->
Review (claude) of df807c1

Verdict: needs_changes

1. **F01** (P3) Field-case Lie derivative already owned elsewhere

   Location: `packages/NashBlowups/design/README.md` line 765 (§4.2 "Define *Derivation.lieDerivative*: for a `k`-algebra `R` and a `k`-derivation `∂ : R → R`, the additive map `L_∂ : Ω_{R/k} → Ω_{R/k}` with `L_∂(a·db) = ∂(a)·db + a·d(∂b)`") and the Scope paragraph (lines 21–33), which lists the Lie derivative among the objects "no other roadmap plans".

   Claim: this roadmap is the sole owner of the Lie derivative on Kähler differentials.

   Witness: `TauCetiRoadmap/DiophantineApproximationAndTranscendence/README.md` lines 3722–3733 (on main) defines `lieDerivativeOneForm D` with the same rule `L_D(a db)=D(a)db+a d(Db)`, and its `Suggested.lean` lines 3582–3590 declares `exists_lieDerivativeOneForm (D : Derivation C F F)` for fields `C ⊆ F` with `[CharZero C]`. That is the field, characteristic-zero specialisation of §4.2.

   Repair: in "Supplied elsewhere and cited" add one clause, for example: "The Lie derivative on one-forms of a field of characteristic zero is DiophantineApproximationAndTranscendence `lieDerivativeOneForm`; §4.2 defines it for an arbitrary `k`-algebra `R` in every characteristic, through `J/J²`, and agrees with that declaration when `R` is a field over a field of characteristic zero." Add the agreement as the fourth API bullet of §4.2. Tested on the instance `R = k[x]`, `∂ = d/dx` (not a field, so outside the supplier's scope): the clause leaves §4.2's definition in place there.

2. **F02** (P3) p-basis contract names a one-directional declaration for an "exactly when"

   Location: `packages/NashBlowups/design/README.md` lines 201–204 ("### From TauCetiRoadmap.DerivedDeRhamCohomology … §0.23 (`DerivedDeRham.IsPBasis`, `DerivedDeRham.pBasis_kaehler_basis`): … a family is a `p`-basis … exactly when its differentials form a `K`-basis") and §5.3 line 920 ("so `x_1, …, x_d` is a `p`-basis by DerivedDeRhamCohomology §0.23").

   Claim: `pBasis_kaehler_basis` states the equivalence, and §5.3 uses its converse half (differentials form a basis ⇒ `p`-basis).

   Witness: DerivedDeRhamCohomology `Suggested.lean` at its head, lines 64–67: `theorem pBasis_kaehler_basis … (hb : IsPBasis p k b) : LinearIndependent k (fun i => D (b i)) ∧ span … = ⊤`. It is the forward direction only. The equivalence is stated in the DerivedDeRhamCohomology README §0.23 prose, line 461, which is what §5.3 needs.

   Repair: in the contract write "§0.23: a family is a `p`-basis exactly when its differentials form a `K`-basis of `Ω¹_{K/𝔽_p}` (the forward half is `DerivedDeRham.pBasis_kaehler_basis`; the converse half is stated in §0.23 and is the one §5.3 uses)". Tested on `K = k(t)`, family `{t}`: the converse half gives the `p`-basis `1, t, …, t^{p−1}` from `dt ≠ 0`, which is what §5.3's first Check computes.

3. **F03** (P3) §4.1 cites §0.5 outside §0.5's stated hypotheses

   Location: `packages/NashBlowups/design/README.md` lines 740–748 (§4.1: "let `k` be a field, `(R, m, κ)` a local `k`-algebra … if `κ` is finite separable over `k`, the `x_j` can be chosen in `m` … For `κ` separable, `m/m² → κ ⊗ Ω_{R/k}` is onto (§0.5)") against lines 316–318 (§0.5: "a Noetherian local `k`-algebra").

   Claim: §0.5 supplies surjectivity of `m/m² → κ ⊗ Ω_{R/k}` for a local `k`-algebra that is not assumed Noetherian.

   Witness: §0.5 is stated for Noetherian `R` (needed only for its injectivity half, stacksAlgebra line 17647); surjectivity is the conormal sequence `m/m² → Ω_{R/k} ⊗ κ → Ω_{κ/k} → 0` (stacksAlgebra line 17678), which needs no Noetherian hypothesis. The only consumers of the separable clause (§4.4 step 5, §5.4) have `R = O_{X,x}` Noetherian, so no statement is false.

   Repair: either add "Noetherian" to the separable clause of §4.1, or split §0.5 into the surjectivity statement (any local `k`-algebra with `Ω_{κ/k} = 0`) and the injectivity statement (Noetherian, `κ` finitely generated separable), and cite the first from §4.1. Tested on `R = k[x]_{(x)}`: both forms give `x_1 = x ∈ m`.

4. **F04** (P3) Unused characteristic hypothesis in the node Checks

   Location: `packages/NashBlowups/design/README.md` line 521 (§2.1 Check: "For the node `xy = 0` in characteristic `≠ 2`, the two branches have tangent quotients `[1 : 0]` and `[0 : 1]`") and line 998 (§6.1 Check: "For the node in characteristic `≠ 2`, `X* = 𝔸¹ ⊔ 𝔸¹` is already normal").

   Claim: the node computation needs characteristic `≠ 2`.

   Witness: in characteristic 2, `Ω_X = (O dx ⊕ O dy)/(x dy + y dx)`; on the branch `y = 0` the quotient is `dx ↦ 1, dy ↦ 0`, on `x = 0` it is `dx ↦ 0, dy ↦ 1`; the Gauss map takes the two values `[1:0]` and `[0:1]`, so `X* = 𝔸¹ ⊔ 𝔸¹` and `X*` is normal in every characteristic. The hypothesis belongs to `y² = x²`, not to `xy = 0`.

   Repair: delete "in characteristic `≠ 2`" in both Checks (or write the node as `y² = x²` and keep it). Tested on the characteristic-2 instance above.

Four P3 findings (R01-R04), each with an exact repair for the fix round; no P1 or P2 finding. The design re-plans nothing, cites every supplier by section, declares no gap, and every statement survived the adversarial pass. There is no `Suggested.lean` at the design stage, so nothing was elaborated and no padding probe ran (this lane does not elaborate; the package stage must do both).

## Verified sound

**Principles.** No route-specific shortcut: every statement is for an arbitrary field `k`, with the characteristic entering only the criteria, and each generalisation beyond the sources (perfect instead of algebraically closed in §5.5, any characteristic-zero field in §4.5) is carried by a route whose steps I checked at that generality. No existing roadmap is re-planned: Nash blowups appear in no roadmap on main and in none of the 466 open pull-request heads (`roadmaps grep -i 'nash blow|nashBlowup|nash modification|nash transform'`: no match). No copied passage; no algorithm; no sorry'd data or `set_option` (no Lean file yet). The gate output:

```
candidate: NashBlowups is not in the merge order yet; checked as if placed after AlgebraicModuliForArithmeticGeometry (the intake inserts it when its design is accepted)
depcheck: 240 roadmaps, 2353 edges, 0 problem(s)
```

**Pins.** `content/lake-manifest.json` pins Mathlib `1b1ccf4b…` and Tau Ceti `2fd255d9…`; `design/plan.json` `baseline` records the same two hashes.

**Supplier order and drift.** Suppliers: AlgebraicModuliForArithmeticGeometry (merge order line 32, folder at its open head), DerivedDeRhamCohomology (line 19, open head), SchemeAndStackFoundations and EnhancedDerivedSheaves (on main). All earlier or on main; no upward citation, no cycle, no pull-request number in the README. Every cited section and name resolved:

- AlgebraicModuliForArithmeticGeometry §1.3 (head README line 602): `coherentGrassmannian` for quasi-coherent finite-type `E` on any `S`, universal quotient, unique classifying maps, `Gr_d(f*E) ≅ Gr_d(E) ×_S T`, `Gr_1(E) ≅ P(E)`, properness over `Spec R` for the sheaf of a finite module, affine points equal to Mathlib's `Module.Grassmannian.functor`; `plucker` closed immersion `Gr_d(E) → P(∧^d E)` with `O(1) ↦ det Q`. §5.4 (line 8893): `ArithmeticModuli.DMNormalization.stack` (agrees with `Scheme.Hom.normalization` of the generic points, smooth base change, unique lifts of generic-point-preserving maps from normal sources, isomorphism when normal), `DMNormalization.finite` over Nagata bases, `DMSchematicClosure.stack` equal to `Scheme.Hom.image` with flat base change. All match the README's contract.
- SchemeAndStackFoundations (main): §0.7 `dimension_theory_finiteType`, `topologicalKrullDimAt_eq_stalk` (README lines 755–766); §0.11 `field_extension_descent` with smoothness among the descended properties (940–946); §0.17 `bijective_of_depth` (1208–1210, exactly the depth-2 / not-associated form used in §5.4 step 4); §0.23 `universalHomeomorphism_criteria` (1484–1486); §0.30 `IsNormalScheme.isDiscreteValuationRing_stalk` (1966); §4.11 `IsModification` and `IsModification.Witness` (5528–5539); §4.13 `IsRegular.isNormal`, `regularLocus_eq_smoothLocus` over a perfect field, `serre_normality_criterion` (5645–5676).
- EnhancedDerivedSheaves §E1.6 (main README line 689; `isRegular_of_frobenius_flat` at line 800, declared in its `Suggested.lean`): a Noetherian `𝔽_p`-algebra with flat Frobenius is regular.
- DerivedDeRhamCohomology §0.23 (head README line 451): `IsPBasis`, `pBasis_kaehler_basis` (see R02).

**Library declarations at the pins** (all opened): Mathlib `Scheme.Hom.smoothLocus` (Morphisms/Smooth.lean:300), `isOpen_smoothLocus` (291), `smoothLocus_eq_top_iff` (320), `preimage_smoothLocus_eq` (333), `dense_smoothLocus_of_perfectField` (361, hypotheses `[PerfectField K] [IsReduced X] [LocallyOfFinitePresentation f]` as the README says), `GeometricallyReduced` (Geometrically/Reduced.lean:44), `Scheme.Hom.image`/`imageι` (IdealSheaf/Subscheme.lean:658–661), `Hom.support_ker` (IdealSheaf/Basic.lean:844, needs `[QuasiCompact f]`), `IsClosedImmersion.lift` (Morphisms/ClosedImmersion.lean:206, needs `f.ker ≤ g.ker`), `isIso_of_isClosedImmersion_of_surjective` (409, needs `[IsReduced Y]`), `ext_of_isDominant_of_isSeparated` (Morphisms/Separated.lean:289, needs `[IsReduced X]`, a separated `s`), `Scheme.Hom.normalization` (Normalization.lean:122), `normalizationDesc` (371), `normalizationPullback` with its `[Smooth g]` isomorphism instance (576–598, requires the normalised morphism quasi-compact and quasi-separated: true for the inclusion of finitely many generic points into a separated `X*`), `LocallyOfFiniteType.jacobsonSpace` (Morphisms/FiniteType.lean:112), `nonempty_inter_closedPoints` (Topology/JacobsonSpace.lean:105, locally closed nonempty set), `tfae_universallyInjective` (Morphisms/UniversallyInjective.lean:106, item 3 is injective with purely inseparable residue extensions), `Module.Grassmannian` (RingTheory/Grassmannian.lean, quotient convention per its header), `tensorKaehlerEquiv` (Kaehler/TensorProduct.lean:238), `mapBaseChange_surjective` (Kaehler/Basic.lean:869), `exact_kerCotangentToTensor_mapBaseChange` (864), `retractionKerCotangentToTensorEquivSection` (Smooth/Kaehler.lean:324, retractions of `I/I² → S ⊗ Ω` versus sections of `P/I² → S`), `Algebra.FormallyEtale.of_isSeparable` (Etale/Field.lean:98), `IsRegularLocalRing` (RegularLocalRing/Defs.lean:52), `Scheme.Modules.pullback` (AlgebraicGeometry/Modules/Sheaf.lean:183, in namespace `AlgebraicGeometry.Scheme.Modules`), `PerfectClosure` (FieldTheory/PerfectClosure.lean:68). Tau Ceti: `Scheme.relativeDifferentials` (Modules/Differentials/Basic.lean:85), `relativeDifferentialsHomEquiv` (101), `isQuasicoherent_relativeDifferentials` (Quasicoherent.lean:96), `isFinitePresentation_relativeDifferentials` (146), `relativeDifferentialsRestrictIso` (Restriction.lean:157), `isFiniteLocallyFree_relativeDifferentials` (LocallyFree.lean:54, `[Smooth (X ↘ Spec R)]`), `FiniteLocallyFreeSheaf.rank_relativeDifferentials_apply` (Rank.lean:74, `[SmoothOfRelativeDimension n]`), `smoothOfRelativeDimension_iff_ringKrullDim_stalk_eq` (Morphisms/Smooth/RelativeDimension.lean:94, smooth and `n`-dimensional stalks at closed points), `isRegularLocalRing_stalk_of_smooth` (Smooth/Regular.lean:43), `smooth_smoothLocus_ι_comp` (Smooth/Locus.lean:46), `preimage_smoothLocus_le_smoothLocus_pullback_snd` (53, an inclusion as the README says), `IsPureDimensional` (Topology/PureDimension.lean:52, every irreducible component has Krull dimension `d`, so the empty space qualifies, as the Conventions say), `isPureDimensional_pullback_Spec_map_iff_of_field` (Scheme/KrullDimension.lean:263), `vanishingIdeal_le_ker_of_range_subset` (IdealSheaf/VanishingIdeal.lean:99, `[IsReduced Y]`), `IdealSheafData.blowup`, `blowupToBase` (Blowup/IdealSheaf.lean:120–124), `isProper_blowupToBase` (191), `blowupLift` (UniversalProperty.lean:372), `blowup_hom_ext` (297), `isIso_blowupToBase_iff` (ExceptionalDivisor.lean:203), `SheafOfModules.exteriorPower` (Algebra/Category/ModuleCat/Sheaf/ExteriorPower/Basic.lean:66). The two "found nowhere" leads of the resolve tool (`DerivedDeRham.IsPBasis`, `DerivedDeRham.pBasis_kaehler_basis`) are roadmap names declared in DerivedDeRhamCohomology's `Suggested.lean` at its head (lines 53, 64), not library names; the tool looked only in the pinned libraries.

**Sources, seeded sample (15 targets), all verified at the locator.**

| target | locator | what the text says at that line | verdict |
|---|---|---|---|
| 0.2 | stacksNormalization line 2926 (01V0), 2953 (01UZ) | base change `(g')*Ω_{X/S} → Ω_{X'/S'}` is an isomorphism; immersion gives `C_{Z/X} → i*Ω_{X/S} → Ω_{Z/S} → 0` | supports both statements |
| 0.3 | stacksAlgebra line 17618 (00TT) | smooth at `q` iff `dim Ω ⊗ κ(q) ≤ dim_x X` iff `=` | supports "rank equals `dim_x X` on the smooth locus" |
| 1.4 | gonzalezSprinberg1982 lines 99–104; nashModificationNotes2024 line 230 | the closure may be taken in `P(∧^d Ω)` via the Plücker closed immersion; `SN(F) ≅ SN(∧^d F)` | supports |
| 1.5 | stacksNormalization line 2198 (081I) | scheme-theoretic image of a quasi-compact morphism commutes with flat base change | supports |
| 2.1 | gonzalezSprinberg1982 lines 85–93; duarteNunezBetancourt2020 line 127; castilloDuarteLeytonLiendo2026 lines 13–21 | closure of the section over the smooth locus in the Grassmannian of rank-`d` quotients of `Ω`, with the Nash cotangent bundle; closure of `σ(U)` with reduced structure; Gauss-map closure | supports |
| 2.5 | nashModificationNotes2024 lines 170–171; duarteNunezBetancourt2020 lines 152–182 | `π` iso ⇒ `Ω` has a locally free quotient; Lemma 2.4 the same with the torsion splitting | supports the forward direction; the converse is the roadmap's own route, checked below |
| 2.6 | nobile1975 lines 42–44 | independence of the immersion, "hence the process globalizes" | supports locality |
| 2.7 | nobile1975 lines 202–203 | `X^{(0)} = X`, `X^{(q)} = (X^{(q−1)})*` | supports |
| 3.2 | nobile1975 line 105 (Theorem 1); nashModificationNotes2024 lines 243–247 | locally a monoidal transform with centre an ideal; blowup of the fractional ideal `φ(∧^d F)` | supports |
| 4.1 | nashModificationNotes2024 lines 194–197, 484–501; duarteNunezBetancourt2020 lines 263–268 | choose `x_j`, derivations with `∂_i(x_j) = δ_ij` by inverting the unit matrix | supports; the roadmap's Nakayama route is its own and is checked below |
| 4.5 | nobile1975 line 143; nashModificationNotes2024 line 143; duarteNunezBetancourt2020 line 136 | Theorem 2 over an algebraically closed field of characteristic zero, pure `r`-dimensional | supports, with the generalisation carried by §4.4 |
| 5.2 | duarteNunezBetancourt2020 lines 271–283; nashModificationNotes2024 lines 394–407 | `(α!)⁻¹ δ^α`, matrix invertible, `φ_γ(x^β) = δ_{γβ}`, `R^p`-linear | supports |
| 6.2 | stacksNormalization line 6570 (035Q (4)) | a morphism from a normal `Z` whose components dominate components of `X` factors uniquely through `X^ν` | supports |
| 7.2–7.3 | castilloDuarteLeytonLiendo2026 lines 58–67 | the Theorem (i)–(iii) and "Consequently … fails to resolve singularities" | supports the principle and its application form |
| 1.1 (extra) | stacksVarieties lines 2112 (056V), 2084 (056T), 296–304 (04KS (3)), 2130 (0B8X) | as cited | supports |

Also verified: nobile1975 Examples 1, 2, 4 and Remark 2 (lines 129–141, 314–324); hamann2003 Lemma 0.1 (56–64); alperModuli Remark 1.1.4(1) (2283) and the proof of Theorem 1.4.5 (2985–3007: closed subfunctor where `K_{T'} → Q_{T'}` vanishes, `Q` flat); stacksAlgebra 00RW (15590), 00TU (17647), 00TV proof (17676–17678), Example 00TY (17720–17726); castilloDuarteLeytonLiendo2026 lines 33–35.

**Adversarial table** (sampled targets, headline theorems, and the targets the notes touch).

| statement | instances tried | values computed | result |
|---|---|---|---|
| Conventions witness, line `y = 2x` | quotient `(k²)* → Ω_X ⊗ κ` | `dx ↦ 1`, `dy ↦ 2` (since `dy = 2dx` on the line), point `[1:2]`; conormal line spanned by `dy − 2dx = (−2, 1)`, point `[2:−1]` | convention pinned, wrong model excluded |
| 0.1 comparison map | `t ↦ (t², t³)`, char 0 and 2; `id`; `Spec k → 𝔸¹` | `c(dx) = 2t dt, c(dy) = 3t² dt`; char 2: `0, t² dt`; `c_{id}(dx) = dx`; `k dx → 0` onto, not injective | sound |
| 0.2 base change / closed immersion | `R → R'` any; `Z ⊂ X` closed | affine charts `B ⊗_A Ω_{A/R} → Ω_{B/R}` are `tensorKaehlerEquiv` resp. `mapBaseChange_surjective` | sound |
| 0.3 `X_sm^{(d)}` | `𝔸² ⊔ 𝔸¹`; cusp over `ℚ`; `Spec k[ε]/ε²` | `X_sm^{(2)} = 𝔸², X_sm^{(1)} = 𝔸¹, X_sm^{(0)} = ∅`; cusp: `X_sm^{(1)} = X ∖ 0`; dual numbers: `Ω ⊗ κ = k dε` has rank 1 in every characteristic but `X_sm = ∅` | sound; rank alone excluded |
| 0.5 cotangent space | `k[x]_{(x)}`; `R = k`; `𝔽_p(t)`, `R = k[x]_{(x^p − t)}` | `x ↦ dx` basis to basis; `0 → 0`; class of `x^p − t ≠ 0` maps to `p x^{p−1} dx = 0` | separability needed for injectivity; surjectivity needs only `Ω_{κ/k} = 0` (R03) |
| 0.6 smooth iff regular at closed points, `k` perfect | cusp; `𝔸ⁿ`; `Spec 𝔽_p(t^{1/p})` over `𝔽_p(t)` | embedding dimension `2 > 1`; all stalks regular; a field (regular) that is not smooth | perfectness needed; (⇐) uses Jacobson: a non-regular closed point would lie in the closed complement of the regular locus |
| 1.1 setting | `Spec 𝔽_p(t)[y]/(y^p − t)`; `Spec k[ε]/ε²`; `𝔸² ⊔ 𝔸¹` | `X_sm = ∅` though reduced; non-reduced excluded, reduction `Spec k` with `d = 0`; `X_sm = X ≠ X_sm^{(2)} = 𝔸²` | sound; converse route via the perfect closure checked (universal homeomorphism needs integral + universally injective + surjective, all present) |
| 1.2 `N(X, F, r, U)` | `F` locally free; `𝔸¹`, `F = O ⊕ O/(x)`, `r = 1`; `𝔸²`, `F = I_0`, `r = 1` | `N ≅ X`; constant section `[1:0]`, closure `X × {[1:0]} ≅ X`, `L = O` by `(a, b) ↦ a`, fibre of `Gr_1` over `0` is `ℙ¹` and is not `N`; `N = Bl_0 𝔸²` with fibre `ℙ¹` | sound; `σ_U` quasi-compact since `Gr_r(F)` is locally Noetherian |
| 1.3 universal property | `id_X`; `Spec k → 0 ∈ 𝔸¹` with quotient `(a, b) ↦ b`; `Bl_p X → X`, `X` smooth | `q = π_N⁻¹`; `[0:1] ∉ N`, `h⁻¹(U) = ∅` not dense; `q = h`, not an isomorphism | density needed; terminal, not universal among all `Z` |
| 1.4 Plücker form | `r = 1`; `r = d` on the cusp | `∧^1 F = F`; `plucker ∘ σ_U` classifies `∧^r(id) = id` of `∧^r F|_U`; closed immersion maps reduced closure to reduced closure | sound |
| 1.5 flat base change | `V ⊆ U`; `g = U ↪ X`; `g : {0} ↪ 𝔸²` (not flat, `g⁻¹(U) = ∅`) | `π_N⁻¹(V) ≅ V`; both sides `U`; fibre `ℙ¹` versus `N({0}, k², 1, ∅) = ∅` | flatness and density needed |
| 2.1 Nash blowup | smooth `X`; cusp char 0; node; `d = 0` | `ν` iso, `L = Ω`; `[1 : 3t/2] → [1:0]`, `ν*Ω = k[t]dx ⊕ k[t]e/(2t³ e)` with `e = dy − (3/2)t dx`, torsion length 3; branches `[1:0]`, `[0:1]`, `X* = 𝔸¹ ⊔ 𝔸¹` in every characteristic (R04); `Gr_0(0) = X` | sound |
| 2.2 proper, modification | cusp char 0; `y² = x²z`; smooth `X` | finite birational not iso; `ν⁻¹(0) ≅ ℙ¹` (nobile1975 line 319), proper not finite; witness `X` | sound |
| 2.3 setting preserved | `𝔸² ⊔ 𝔸¹`, `d = 2` | `Gr_2(Ω|_{𝔸¹}) = ∅`, `X* = 𝔸²`, `ν` not surjective | pure dimension needed |
| 2.4 lift, `isIso_lift_iff` | `Bl_0 𝔸² → 𝔸²`; normalisation of cusp; `𝔸¹ ⊔ 𝔸¹` with `X₁` one line | classifying map is `π` itself (not injective on `E`); `t ↦ (t², t³, [1:3t/2])` injective with nonzero derivative of the `ℙ¹`-coordinate, finite, hence a closed immersion; closed immersion onto one component, lift not iso | surjectivity needed; (⇐) uses `q` closed immersion with image ⊇ dense `ν⁻¹(X_sm)` into reduced `X*` |
| 2.5 triviality criterion | cusp char 2, 3, 0 | relation `x² dx`, quotient `dx ↦ 0, dy ↦ 1`; relation `2y dy`, quotient `dx ↦ 1, dy ↦ 0`; char 0: `2t³ b = 3t⁴ a` forces `b = (3t/2)a` in `k[[t]]`, no unit `a` or `b` in `k[[t², t³]]` | sound both ways; (⇐) section `s` is a closed immersion agreeing with `σ` on `X_sm`, `s(X) = X*` as reduced closed subschemes |
| 2.6 locality, field base change | cusp over `ℚ`, `k' = ℚ(i)`; `V = X_sm`; `𝔽_p(t)` inseparable | `𝔸¹_{ℚ(i)}` both sides; `V* = V`; `X_{k'}` non-reduced, outside the Setting | sound; `g⁻¹(X_sm) ⊆ (X_{k'})_sm^{(d)}` dense, then independence of the open |
| 2.7 iteration | smooth; cusp char 0; cusp char 2 | `i = 0`; `i = 1`; `X^{(i)} ≅ X` for all `i`, never resolved | sound |
| 3.1 Gauss map | line `y = 2x`; cusp; `𝔸ⁿ` | constant `[1:2]`; `[1:3t/2]`, closure `≅ 𝔸¹`; `Gr_n(kⁿ)` a point | sound |
| 3.2 blowup description | `𝔸¹`, `dx ↦ x`; cusp char 0 and 2; `I = 0` | `O·dx ≅ (x)` isomorphism onto `I`, `Bl = X`; `I = (y, x²)`, `Bl = 𝔸¹`; `I = (x²)` principal on a nonzerodivisor, `Bl = X`; `Bl_0 X = ∅` | isomorphism-over-`X_sm` needed; `∧^d L ≅ I·O_{X*}` by reducedness; `V(I)` contains no generic point, so `ν_I⁻¹(X_sm)` is dense |
| 3.3 hypersurface | cusp; node; `x^p − y^q` char `p` | `(2y, 3x²) = (y, x²)`, `(x²)`, `(y)`; `(x, y)`; `(q y^{q−1})` principal on an integral curve; sign `(−1)^{j−1} ∂f/∂x_j` from `df ∧ dx_1 ∧ … dx̂_j … ∧ dx_n` | sound |
| 4.1 coordinates | `k[x,y]_{(x,y)}`; cusp char 3; `d = 0` | `∂_i = ∂/∂x_i`; `q(dx) = 1`, `∂(y² − x³) = −3x² = 0`, `ker q = R dy/(y dy)`; no coordinates | sound (R03 on the separable clause) |
| 4.2 Lie derivative | `k[x]`, `d/dx`; `x d/dx`; `k[x]/(x²)`, `∂x = x` | `L(x dx) = dx`, `L(dx) = 0`; `L(dx) = dx ≠ 0`; `L(dx) = dx`, `L(x dx) = 2x dx = 0` in `Ω`; on `J/J²`: `D(a⊗b − ab⊗1) = ∂a·db + a·d(∂b)` | sound; coefficient-only model excluded (R01 on ownership) |
| 4.3 Seidenberg | `ℚ[x]`; `ℚ[x,y]`, `∂/∂x`; `𝔽_p[x]` | `∂(x²) = 2x ∉ (x²)`, stable ideals `0`, `(1)`; `(y²) ↦ (y)` stable; `(x^p)` stable, `(x)` not | `ℚ ⊆ R` needed |
| 4.4 free quotient ⇒ smooth | smooth; cusp over `ℚ`; cusp over `𝔽_2` | identity quotient; no rank-one free quotient; free quotient exists, proof fails at step 4 exactly where `(x^p)` is stable | route checked: `P_0 = P ∩ k[X]` stable under all `∂/∂X_i`, zero in characteristic 0, `trdeg κ(P) ≥ d`, `P` minimal, contradiction with `T_P = 0` |
| 4.5 Nobile | cusp over `ℚ`; node; cusp char 2 | not iso; `𝔸¹ ⊔ 𝔸¹ ≠ X`; iso though singular | characteristic needed; no algebraic closedness used |
| 5.1 Frobenius finite | `k[t]`; `k`; `𝔽_p(t)(s)` | basis `1, …, t^{p−1}`; iso; `[K : K^p] = p²` | `k^p = k` needed for the count |
| 5.2 operators | `d = 1, p = 2, k[x]_{(x)}`; `d = 0`; cusp char 3 | matrix `((1, x), (0, 1))`, inverse `((1, −x), (0, 1))`, `φ_0 = id − x∂`, `φ_1 = ∂`, `φ_0(1) = 1, φ_0(x) = 0, φ_1(1) = 0, φ_1(x) = 1`; `φ_∅ = id`; `t³ ∉ R³ + R³t² + R³t⁴` (exponents `0, 2, 1` mod 3 and `t ∉ R`) | sound; matrix is the identity modulo `m` |
| 5.3 generic `p`-basis | `k(t)`; `d = 0`; `t^p` | `1, …, t^{p−1}`; `K = K^p`; `d(t^p) = 0` | sound via the converse half of DerivedDeRham §0.23 (R02) |
| 5.4 Frobenius pushforward free | `k[x_1..x_d]_m`; cusp char 3; `d = 0` | standard basis `x^α`; injective, not surjective; identity | steps 1–5 checked: injectivity by `φ_γ`, generic rank `p^d`, DVR splitting from torsion-free cokernel (normality), depth ≥ 2 and `Ass(F_*R) = {0}`, Kunz converse |
| 5.5 Duarte–Núñez-Betancourt over perfect `k` | `x^p + y² + t` over `𝔽_p(t)`; cusp char 2, 3; `z² = xy` | regular, normal, free quotient `dx ↦ 1`, `ν` iso, not smooth; iso but not normal; Jacobian `(x, y, z)` not invertible | perfectness and normality both needed |
| 6.1 normalised blowup | cusp char 0, 2; node; `y² = x²z` | `𝔸¹`; `X* ≅ X`, `X̄* = 𝔸¹`; `η = id`; normalisation finite, `X̄* = X*` with `ℙ¹` over `0` | sound; `ν̄⁻¹(X_sm)` dense since `η` is bijective on components |
| 6.2 universal property | `Z = X̄*`; cusp char 2 with `Z = 𝔸¹`; closed point | identity; `𝔸¹ ≅ X̄*`; outside hypotheses | sound; generic points of `Z` land in `ν⁻¹(X_sm)` |
| 6.3 locality, finite separable base change | `V = X_sm`; cusp over `ℚ(i)`; `C` over `𝔽_p(t^{1/p})` | `V`; `𝔸¹_{ℚ(i)}`; `C_{k'} = V((x + t^{1/p})^p + y²)`, Jacobian `(2y)` so `C_{k'}* = C_{k'}`, `(C_{k'})̄* = 𝔸¹ ≠ C_{k'} = (C̄*)_{k'}` | separability needed; `κ(ξ) ⊗_k k'` a product of fields identifies the generic points |
| 6.4 isomorphism criteria | cusp char 2; smooth; `C` over `𝔽_p(t)` | `ν` iso, not normal, `ν̄` not iso; both iso; `ν̄` iso, not smooth | sound; (⇒) section `s = η ∘ ν̄⁻¹` is a surjective closed immersion into reduced `X*` |
| 7.1 normalised iteration | cusp char 0, 2; `i = 0` | `Y_1 = 𝔸¹`; `Y_1 = 𝔸¹` while `X^{(i)} ≅ X`; `Y_0 = X` | sound |
| 7.2 propagation | `U = Y`; cusp char 2; `U = Y_sm` | identity; `X^{(j)} ⊇ X`; iterates of `U` are `U` | sound; `Y_{(j+1)m} = Y_{m + jm}` contains an open `≅ Y_m ⊇ X` |
| 7.3 never resolves | `m = 0` on the cusp char 0; smooth; cusp char 2, `m = 1` | `Y_1` smooth, conclusion fails, so `m ≥ 1` needed; hypothesis fails; no `X^{(i)}` smooth, `Y_1 = 𝔸¹` resolves | sound |

**Shape and completeness.** 8 layers, 38 targets, 108 tests in `plan.json`, each target with a locator and hypotheses; every definition or construction (0.1, 0.3, 1.2, 2.1, 2.7, 4.2, 6.1, 7.1) has an API list and at least three discriminating Checks; every layer ends with Examples and Dependencies; `*Needs:*` lines match the plan's prerequisites. House style: no LaTeX delimiters, no pull-request numbers, dates, process words or machine paths; `lemma` occurs only in prose ("Seidenberg's lemma", Stacks lemma numbers). The two uncited `IsPBasis` names are the supplier's (R02).

**Duplication.** By object: the Nash blowup, Nash modification of a sheaf, Gauss-map and blowup descriptions, the triviality criterion, Seidenberg's lemma, the `p`-monomial operators and the Frobenius-pushforward freeness exist nowhere at the pins, on main or at any open head (grep over 466 heads). DerivedDeRham §0.24 assumes Frobenius finiteness, it does not prove §5.1. Mathlib has `Scheme.Hom.genericPoint_mem_smoothLocus_of_perfectField` (Morphisms/Smooth.lean:343, integral `X`), which the package may cite in §1.1(3) and §4.4 step 2 in place of the density argument; not a finding. The one overlap is the field-case Lie derivative (R01). Overlaps file: no open pull request changes this roadmap, drops an id it cites, or defines an id only in a revision; the closest roadmaps in vocabulary are revisions of SchemeAndStackFoundations (#1276, #1808, #1807, #1854, #1656), which are not dependencies and do not touch §§0.7–4.13 ids cited here.

**Headline theorems** (from the Summary): triviality criterion (§2.5), Nobile's theorem (§4.5), Duarte–Núñez-Betancourt over perfect fields (§5.5), the `ν̄` criteria (§6.4), the never-resolves principle (§7.3). None was stated in Lean at this stage. For the package: the carriers `X*`, `ν`, `L` rest on the coherent Grassmannian, a roadmap object, so §2.5, §4.5, §5.5, §6.4 and §7.3 are not statable at the pins and the module docstring must say so; §4.4 (a locally free rank-`d` quotient of `Ω_{X/k}` forces smoothness in characteristic zero), §4.3, §5.1, §5.4, §0.5 and §0.6 are statable on Mathlib and Tau Ceti carriers and should be stated.

## Not verifiable

- `hironaka1983`, `spivakovsky1990`, `semple1954`, `teissier1982`, `ega1`: paywalled, settled as uncertified, cited for background only; no target rests on them.
- Elaboration and the one-tactic padding probe: no `Suggested.lean` exists at the design stage (this lane does not elaborate).
- Ownership against open pull requests was checked through `roadmaps grep` over the indexed heads; the index is of 2026-11-07T01:18:07Z.

## Source issues

- **Misprint** in nashModificationNotes2024 at Theorem 5.1, printed p. 10 (line 364): the source says the Nash modification of a normal variety in characteristic `p` is an isomorphism iff the variety is singular; it should be nonsingular; affects a stated result.
- **Misprint** in nashModificationNotes2024 at Theorem 6.2, printed p. 12 (line 512): the source says the normalised `n`-th Nash modification is an isomorphism iff `X` is an isomorphism; it should be iff `X` is nonsingular; affects nothing.
- **Misprint** in nashModificationNotes2024 at Propositions 2.2–2.3, printed p. 5 (lines 173–181): the same proposition and its preamble are printed twice under two numbers; the second copy should be dropped; affects nothing.
- **Error** in nashModificationNotes2024 at Section 2, printed p. 4 (lines 157–160) and Section 3, p. 6 (lines 226–229): the universal property is asserted for every morphism `h : Z → X` carrying a rank-`d` locally free quotient of `h*Ω`; it should require `Z` reduced with `h⁻¹(U)` dense (a closed point of the cusp with the quotient `[0:1]` does not factor); affects a stated result.
- **Gap** in nashModificationNotes2024 at Section 5, p. 11 (line 428) and in duarteNunezBetancourt2020 at the proof of Theorem 3.10, p. 7 (lines 286–287): a splitting of `R_Q → R_Q^{1/p}` is deduced from freeness of `R_Q^{1/p}` alone; it should use that the cokernel is torsion-free because `R_Q` is integrally closed; affects the proof.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "df807c164b4bb91e53fc018044c2dd62a03c729a", "job": "REV-DESIGN-NashBlowups", "model": "fable", "worker": "chris-x10"} -->
