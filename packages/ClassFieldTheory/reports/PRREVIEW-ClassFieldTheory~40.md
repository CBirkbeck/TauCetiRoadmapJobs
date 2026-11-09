# Review of ClassFieldTheory (pull request #1411 at 6819093)

**Verdict:** needs changes

Four findings, all P3. Nothing blocks: the gate passes, the dependency check is clean, `Suggested.lean` elaborates with `sorry` as the only warning, and every statement tested in the adversarial pass holds. The four repairs are a stronger form of one headline, the folder-ownership record of a forced consumer edit, the form of the §2.4–§2.6 mapping, and one prose slip about a pinned declaration.

## R01 (P3) — The absolute unit-filtration statement carries a closure that is provably redundant

**Location.** `TauCetiRoadmap/ClassFieldTheory/Suggested.lean:537–541`: "`((TauCeti.unitFiltration K n).map (artinMap K)).topologicalClosure = (localAbsoluteUpperRamificationGroup K ⟨n, …⟩).map (QuotientGroup.mk' …)`". The same form is in `README.md:1517–1522` and `README.md:1549–1553`. The depth-0 Check at `README.md:1578–1584` says "at depth `0` the closure changes nothing".

**Claim.** The closure changes nothing at any depth, so the headline is weaker than what the source and the pins support. The depth-0 Check also suggests, wrongly, that the closure matters at positive depth. A consumer that wants the image itself has to reprove closedness.

**Witness.** Tau Ceti's `continuous_artinMap` (`TauCeti/NumberTheory/ClassFieldTheory/Local/ArtinMap.lean:248`) holds for every nonarchimedean local field, and `isCompact_unitFiltration` (`TauCeti/NumberTheory/LocalField/UnitFiltration/Basic.lean:478`) makes `U(K,n)` compact. Its image is therefore compact in the Hausdorff group `G_K^ab`, hence closed. Tau Ceti's depth-0 form, `map_artinMap_unitFiltration_zero` (`Local/Unramified.lean:475`), has no closure.

**Repair.**
- State `(TauCeti.unitFiltration K n).map (artinMap K) = (localAbsoluteUpperRamificationGroup K ⟨n, Nat.cast_mem_ramificationIndexDomain n⟩).map (QuotientGroup.mk' (commutator (Field.absoluteGaloisGroup K)).topologicalClosure)` under a name without `closure`, for example `map_artinMap_unitFiltration`, the all-depth form of Tau Ceti's depth-0 theorem.
- In the README statement, the proof sketch, the module docstring's inventory item 6, *How to read the build* (`README.md:585–587`) and the Layer 7 exit criterion (`README.md:1602–1604`), replace "the closure of `artinMap(U_K^(n))`" by "`artinMap(U_K^(n))`". Add one sentence saying the image is closed by `continuous_artinMap` and `isCompact_unitFiltration`, and add both declarations to the *Needs* line.
- In the depth-0 Check, drop "the closure changes nothing".

Tested at `n = 0`: the new statement, combined with the Check's identification of the image of `G_K^0` with the image of inertia, is exactly `map_artinMap_unitFiltration_zero`. The pull request description and the other open pull request that amends this roadmap use the current name, so record the rename where that pull request's merge order is stated.

## R02 (P3) — The pull request edits a folder that is not recorded as its own

**Location.** `Completed/LocalGaloisGroups/Suggested.lean:326` and `:485`, as changed against main: "`⟨ClassFieldTheory.h2MuEquivZMod_mixed p F n hn⟩`" and "`⟨ClassFieldTheory.h2FpEquivZMod_of_mu p F _ (muNRepIsoTrivialFp p F ζ hζ)⟩`".

**Claim.** The folders this pull request owns are `TauCetiRoadmap/ClassFieldTheory/`, `TauCetiRoadmap/IntegralLattices/` and `TauCetiRoadmap/QuadraticFormInvariants/`. The completed roadmap's file is outside them. The edit is forced by this folder's change of `h2MuEquivZMod_mixed` and `h2FpEquivZMod_of_mu` (`Suggested.lean:322`, `:333`) from `Nonempty`-valued statements to the canonical equivalences.

**Witness.** `git diff --stat origin/main...HEAD` restricted to everything outside the three folders lists `Completed/LocalGaloisGroups/Suggested.lean | 4 ++--`. The gate's targeted build covers `TauCetiRoadmap.ClassFieldTheory.Suggested` and `TauCetiRoadmap.GlobalQuadraticForms.Suggested`. It does not build `Completed.LocalGaloisGroups.Suggested`, which imports this module.

**Repair.** Keep the two lines and have `Completed/LocalGaloisGroups` recorded as one of this pull request's folders where the board reads them. The description already names it, but the folder list this review was given does not. That way the adaptation is reviewed and built with this head. The alternative is to give the canonical equivalences new names and leave the two old names with the types the completed roadmap uses. That would keep `Nonempty (X ≃ Y)` declarations, which the README's own rule (`README.md:598–601`) rejects, so the first option is the right one.

## R03 (P3) — The §2.4–§2.6 mapping is not in a form the overlap check reads

**Location.** `README.md:196–198`: "§2.4 → *Tate's theorem and its Tate–Nakayama generalization*, below; §2.5 → *The direction of reciprocity*, below; §2.6 → *Frobenius convention*, below;".

**Claim.** On main these sections are numbered `### 2.4`, `### 2.5` and `### 2.6` (main `README.md:352`, `:416`, `:460`). This head removes the numbers. The bullets give the targets, but the overlap check at this head still lists the three ids as dropped and cited, so the citing roadmaps are flagged again at every round.

**Witness.** The overlap check at this head reports:
- §2.4 cited by EndoscopicTransferAndUnitaryTraceComparison (#999, lines 106 and 209);
- §2.5 cited by AnticyclotomicLocalUnits (#1692, line 26);
- §2.6 cited by AnticyclotomicLocalUnits (#1692, line 26) and EllipticCurveModularityWild3Adic (#1484, lines 44 and 240).

**Repair.** Replace the three bullets with a table whose header names the former numbering (`| Former section | Now |`), one row each for §2.4, §2.5 and §2.6 (and §4 if that line stays). Alternatively use sentences of the form "§2.4 is now *Tate's theorem and its Tate–Nakayama generalization*, under Conventions." Then rerun `roadmaps overlaps ClassFieldTheory`: the list "Ids of ClassFieldTheory that this pull request drops" should be empty.

## R04 (P3) — Layer 5 describes Tau Ceti's nondegeneracy theorem in the wrong variable

**Location.** `README.md:1075–1077`: "nondegeneracy, `forall_localSymbol_kummerClass_eq_zero_iff`: `a` pairs to zero with every `b` exactly when `a ∈ (Kˣ)ⁿ`".

**Claim.** In the README's own convention the symbol of `a` and `b` has `a` first. The pinned theorem is the second-variable statement. The README's mapping at `README.md:205–207` says so correctly, so the two passages contradict each other.

**Witness.** `TauCeti/NumberTheory/ClassFieldTheory/Local/HilbertPairing.lean:61`, `forall_localSymbol_kummerClass_eq_zero_iff (b : Kˣ)`: for all `a`, the symbol of `kummerClass a` and `kummerClass b` is `0` exactly when `b ∈ powerSubgroup Kˣ n`.

**Repair.** Write: "`b` pairs to zero with every `a` exactly when `b ∈ (Kˣ)ⁿ` (`forall_localSymbol_kummerClass_eq_zero_iff`); the first-variable form follows by `localSymbol_antisymm`." Tested against the declaration: the quantified variable is `a` in the first slot, and the conclusion is about `b`.

## Verified sound

**Gate, build and order.**
- The worker's gate at this head passes every check (`scratch/gate.md`: build=0, depcheck=0, sorry-data=0, imports=0).
- I reran `lake env lean TauCetiRoadmap/ClassFieldTheory/Suggested.lean`: exit 0 in 9 s, with exactly five `declaration uses sorry` warnings, at lines 401, 503, 537, 684 and 694. There is no other warning or error.
- Dependency check output, verbatim: `depcheck: 235 roadmaps, 2263 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line.

**Signatures.** I compared each of the 53 elaborated types in `scratch/signatures.md` with its README statement.
- The two flagged leads, `restrictAbsolute` and `absoluteGaloisGroupExtend`, lose local-field binders that their types do not use. Both are pure Galois-theoretic maps, and the README states them that way, so this is not a defect.
- The `below`, `argument`, `on` and `field` entries are artefacts of the signature tool parsing docstring words.
- `map_unitFiltration_normResidue` keeps `[ValuativeExtension K L]` and `[IsAbelianGalois K L]`.
- `algebraMap_vle_algebraMap_iff_of_finite_padic` keeps `[IsNonarchimedeanLocalField F]`, `[Algebra ℚ_[p] F]` and `[Module.Finite ℚ_[p] F]`, with no continuity hypothesis, matching README `1140–1143`.
- `relDiscr_eq_finprod_abelianConductor` carries `[NumberField L]` and `[IsAbelianGalois K L]`.

**One-tactic probe.** I replaced each `sorry` with `first | rfl | simp | infer_instance | exact?` in a scratch copy and elaborated it, then reran `exact?` alone on line 511.
- Lines 401, 541, 686 and 699: `exact?` cannot close the goal.
- Line 511: `simp` only unfolds `upperRamificationGroup` to `Ideal.ramificationGroup … (psiNat K L n)` and leaves the goal open; `exact?` alone also fails.
- None of the five targets is padding. A grep of Tau Ceti at the pin finds no statement of any of them.
- The only nearby results are `ValuativeExtension.of_continuous_algebraMap` (`Topology/Algebra/ValuativeRel/ContinuousRingHom.lean:174`), which needs continuity, the `FinitePadicExtension` class (`LocalField/AbsoluteRamificationIndex.lean:64`), which bundles compatibility as a field, the abstract principal ideal theorem `ClassFormation.groundInclusion_mem_normSubgroup_of_range_eq_commutator`, and the local formula `finsum_artinConductorExponent_eq_discriminantExponent`.

**Headline theorems** (README *Scope and ownership*, items 1–14).
- Statable and open at the pin, so stated with `sorry`: unit-filtration reciprocity (finite and absolute forms), the principal ideal theorem, the conductor–discriminant formula, and Layer 5's valuation comparison.
- Every other item is proved in Tau Ceti and is consumed under Tau Ceti's name, per the module docstring's inventory. I resolved each inventory name at the pin, including `tateTheorem` (`Formation/Tate/Theorem.lean:122`, with `h1`, `hcard` and `hgen` as separate explicit arguments), `tateTheorem_toAddMonoidHom` (`:150`), `tateIso` (`:168`), `nakayamaNegTwo` (`Formation/ArtinMap.lean:126`), `artinEquiv` (`:139`) and `artinEquiv_eq_tateIso` (`:144`).
- No headline is forced through a stand-in. The closed aliases are justified by consumer files that actually use them:
  - `Completed/LocalGaloisGroups/Suggested.lean` uses `GalRep`, `H`, `muNRep`, `muNRepEquivZMod`, `muNRep_ρ_eq_self`, `kummerEquiv_mixed`, `h2MuEquivZMod_mixed`, `h2FpEquivZMod_of_mu`, `kummerCupPairing(_bil)`, `eulerCharacteristic_finrank_fp`, `normResidue`, `scd_p_absoluteGaloisGroup_eq_two`, `artinMap`, `absoluteGaloisGroupExtend`, `artinMap_norm`, the three cyclotomic theorems and both Layer 0 theorems.
  - `TauCetiRoadmap/GlobalQuadraticForms/Suggested.lean` uses `principalIdele`, `ideleNormMap`, `ideleClassNorm`, `card_ideleClassNormQuotient`, `cyclicHasseNorm`, the three norm predicates, `isGlobalNorm_iff_isLocalNormEverywhere` and `hilbertProductFormula`.
  - `restrictAbsolute` is cited by `Completed/LocalGaloisGroups/README.md:178`. The `kummerClass` pair and the Hilbert invariants are cited by QuadraticFormInvariants (`README.md:297–303` at this head). The ring-class names are cited by GrossZagierAndArithmeticHeights (`README.md:156`) and EllipticCurvePeriodsAndModularParametrizations (`README.md:316`).

**Library declarations opened at the pins.**
- Tau Ceti:
  - Conductor criterion, Artin conductor and discriminant: `unitFiltration_le_normGroup_iff_upperRamificationGroup_eq_bot` (`Local/Conductor/UpperNumbering.lean:64`; its `variable` block at `:56–59` has no characteristic hypothesis, confirming "either characteristic"), `conductorExponent_le_iff_upperRamificationGroup_eq_bot` (`:121`), `conductorExponent_fixedField_ker` (`:130`), `finsum_artinConductorExponent_eq_discriminantExponent` (`LocalField/Discriminant/Conductor.lean:58`), `relDiscr` as the relative norm of the different (`RingTheory/DedekindDomain/Discriminant/Basic.lean:33`), `abelianConductor` (`Global/AdmissibleModulus/Basic.lean:193`, defined without an abelian hypothesis).
  - Ramification groups and unit filtration: `upperRamificationGroup` (`LocalField/Herbrand/Basic.lean:421`), `lowerRamificationGroupReal` read through the ceiling (`LocalField/RamificationGroup.lean:278`, `:282`), `RamificationIndexDomain` (`:86`), `unitFiltration` with `U(K,0)` the image of `𝒪[K]ˣ` (`LocalField/UnitFiltration/Basic.lean:104`).
  - Local reciprocity: `artinMap_restrict` (`Local/ArtinMap.lean:132`), `localArtinEquiv_eq_of_iota` (`Local/Reciprocity.lean:111`), `natCard_H2_units_dvd_finrank` (`Brauer/LocalH2Bound.lean:78`), `h2MuEquivZMod` (`Brauer/RootsOfUnity.lean:89`), `h2EquivZModOfMuNRepIso` (`:156`), `kummerEquivOfCharZero_ofMul_mk` (`MuNRep.lean:371`), `localSymbol_eq_zero_iff_mem_normGroup` (`Local/CyclicClass.lean:293`, for `L = K(s)`, `sⁿ = b`, matching README `1070–1074`), `strictCohomologicalDimensionAt_absoluteGaloisGroup_eq_two` (`Local/CohomologicalDimension/Strict.lean:236`).
  - Class fields: `fieldRange_le_hilbertClassField_iff` (`ClassFields/RayClassField.lean:362`, unramified at finite and infinite places, as the principal-ideal route needs), `hilbertClassArtinEquiv` (`:262`).
  - A scripted pass over all 689 backticked README names found every Tau Ceti and Mathlib name declared at the pins. The exceptions are roadmap names, the supplier roadmaps' own declaration names (resolved below), the `ClassFormation` structure fields (`subsingleton_h1`, `inv_restrict`, `inv_infl`, `inv_conj`; `Formation/ClassFormation.lean:94–112`), notation such as `Art_K`, and the ten former `ClassFieldTheory.*` names, which the Conventions map to Tau Ceti names on purpose.
- Mathlib: `valueGroupWithZeroIsoInt` (`NumberTheory/LocalField/Basic.lean:117`), the instance `ValuativeRel ℚ_[p] := .ofValuation mulValuation` (`NumberTheory/Padics/ValuativeRel.lean:34`), `hensels_lemma` (`NumberTheory/Padics/Hensel.lean:460`), `Algebra.IsAlgebraic.of_finite` (`RingTheory/Algebraic/Integral.lean:108`), `IsGalois.normalBasis` and `normalBasis_apply` (`FieldTheory/Galois/NormalBasis.lean:121`, `:128`), `IntermediateField.restrictNormalHom_ker` (`FieldTheory/Galois/Basic.lean:437`), `IntermediateField.fixingSubgroup_fixedField` (`:283`), `AlgEquiv.restrictNormalHom_surjective` (`FieldTheory/Normal/Basic.lean:233`), `InfiniteGalois.restrictNormalHom_continuous` (`FieldTheory/Galois/Profinite.lean:148`), `MonoidHom.domRestrict_surjective` and `card_domRestrictHom_ker` (`GroupTheory/FiniteAbelian/Duality.lean:107`, `:133`), `NumberField.IdeleGroup.unitEmbedding` (`NumberTheory/NumberField/AdeleRing.lean:110`), `legendreSym.quadratic_reciprocity` (`NumberTheory/LegendreSymbol/QuadraticReciprocity.lean:107`), `Submodule.nonempty_basis_of_pid` (`LinearAlgebra/FreeModule/PID.lean:278`).

**Cross-roadmap citations resolved** (on main):
- ProfiniteCohomology: `coeffMap` (Layer 1), `H1ConjInvariants` (Layer 5), `longExact_exact`, `corestriction_comp_res`, `corestriction_mackey` and `shapiroIso` (Layer 10), `cd_p_le_of_isClosed`, `cd_p_le_scd_p` and `strictCohomologicalDimensionAt_le_iff_forall_openSubgroup` (Layer 11), `cup_add_left`, `cup_gradedComm` and `cup_coeffMap` (Layer 12). `degreeCast` is credited to Layer 12 by ProfiniteCohomology's own text at its `README.md:1346`.
- Completed ProfiniteProPGroups: `cd_p_eq_of_isProPSylow` and `cd_p_le_iff_elementaryAbelian_of_isProP`.
- RepresentationTheory/ModularInduction: `modRepK0` and `modRepK0.lift` (Layer 0), `modRepK0.ind` (Layer 1), the three `latticeDefect_*` lemmas (Layer 3), `modularArtin_exists_nsmul_mem_indCyclicCoprime` (Layer 4).
- The roadmaps named only as consumers are not suppliers, and the dependency check agrees. RamificationOfCompleteDiscretelyValuedFields (head of #1410, its lines 18–20), FilteredLocalGaloisGroups (#1795, lines 52–61) and FunctionFieldArithmetic (sibling head, lines 1326–1340) all take the absolute upper filtration or unit-filtration reciprocity from this roadmap's Layer 7, or derive it without stating a target. So no object has two owners.
- The other open pull requests changing this roadmap (#617, #1215) conflict with this head. The description states the order: whichever merges first, the others rebase onto it.
- No id this README cites is dropped by an open pull request, and no id is defined only by an open revision.

**Adversarial pass** (values computed on each side).

| Statement | Instance | Left side / right side | Result |
|---|---|---|---|
| `algebraMap_vle_algebraMap_iff_of_finite_padic` | `F = ℚ_2(i)`, `(a,b) = (2,1)`, `(1,2)` | in `F`: `v_F(2) = 2`, so `2 ≤ᵥ 1` true, `1 ≤ᵥ 2` false / in `ℚ_2`: true, false | holds; normalized valuations (2 vs 1) would fail, so comparing relations is right |
| same | `a = 0`; `b = 0`, `a ≠ 0` | `0 ≤ᵥ b` true on both sides; `a ≤ᵥ 0` false on both sides (`algebraMap` injective) | holds |
| same, wrong models | `ℚ_5` with a valuation extending the 3-adic one; trivial relation on `F` | `u(6) = u(3) < 1` while `6 ∈ 1 + 5ℤ_5` is an `n`-th power for every `5 ∤ n`, so the value group is not `ℤ` (excluded by `valueGroupWithZeroIsoInt`); trivial relation: `1 ≤ᵥ p` holds in `F` and fails in `ℚ_p` (excluded by nontriviality) | both hypotheses used, as the Checks say |
| proof sketch, steps (i)–(iii) | Hensel's lemma for `Xⁿ − x`, `x ∈ 1 + pℤ_p`; `p = 2` | `‖f(1)‖ = ‖1 − x‖ ≤ 1/p < 1 = ‖f′(1)‖²`; at `p = 2`, `y ∈ 1 + 2ℤ_2` directly and `2 = 1 + 1` | route sound |
| `map_unitFiltration_normResidue` | `L = K`, every `n` | `{1}` / `{1}` | holds |
| same | `ℚ_2(ζ_8)/ℚ_2`, `n = 2` | image of `1 + 4ℤ_2` under `u ↦ σ_(u⁻¹ mod 8)` is `{σ_1, σ_5}` / `G^2 = {1, 5}` | holds |
| same | `ℚ_2(√2)`, `n = 2, 3` | `n = 2`: `5` is not a norm since `(5,2)_2 = −1`, so all of `Gal` / `G^2 = G_⌈2⌉ = G`; `n = 3`: `1 + 8ℤ_2` consists of norms, so `1` / `G_3 = 1` | holds |
| same | `ℚ_p(ζ_p)`, `p` odd, `n = 0, 1` | all of `Gal` / `G_0 = G`; `1` / `G^1 = 1` (tame) | holds |
| same | unramified `L`, `n = 0` | units are norms, so `1` / `G_0 = 1` | holds |
| same | `𝔽_p((t))`, `y^p − y = t⁻¹`, `n = 1, 2` | all of `Gal` / `G^1 = G` (break 1); `1` / `G^2 = 1` | holds in equal characteristic |
| same, wrong model: lower numbering | `ℚ_2(ζ_8)`, depth 3 | `U^(3) ↦ {1}` / `G_3 = ⟨σ_5⟩` (since `i(σ_5) = v(ζ⁴ − 1) = 4`) while `G^3 = 1` | lower numbering refuted, upper numbering right |
| same, non-abelian | `ℚ_2(∛2, ζ_3)`, group `S_3` | `U^(0) ⊆ N_(L/K)` by norm limitation to the unramified `ℚ_2(ζ_3)` / `#G_0 = 3` | the `IsAbelianGalois` hypothesis is needed and present |
| `localAbsoluteUpperRamificationGroup` | `u = −1` | each `Gal(M/K)^(−1) = G_(−1)` is everything (`𝔪⁰ = 𝒪`), so `G_K` | holds |
| same | `u ∈ (−1, 0]`, unramified level `M` of degree `f` | `ψ(u) = u`, `G_⌈u⌉ = G_0 = 1` at `M`, while `G_K ↠ ℤ/f`; a floor convention would give `G_(−1)` = everything | the ceiling convention is Tau Ceti's (`RamificationGroup.lean:282`) and Milne's (milne-cft line 2379) |
| same | `ℚ_2(ζ_8)`, then its quotient `ℚ_2(√2)` | `u ∈ (1,2]`: `{1, 5}` maps to the nontrivial element, which is `Gal(ℚ_2(√2)/ℚ_2)^u` (break 2); `u > 2`: `1 ↦ 1` | compatible (Milne I, Prop. 4.4) |
| `closure_map_artinMap_unitFiltration` | `n = 0` | closure of `Art(𝒪ˣ)` = `Art(𝒪ˣ)` = image of inertia (`map_artinMap_unitFiltration_zero`) / image of `G_K^0` = image of inertia | holds |
| same, wrong model `G_K^0 = G_K` | `n = 0` | its image would be all of `G_K^ab`, but `unramifiedCoordinate(Art π) = zHat.gen ≠ 1 = unramifiedCoordinate(Art u)` | excluded |
| same | every `n` | `Art(U(K,n))` is compact, hence closed in `G_K^ab` | holds; the closure is redundant (R01) |
| `isPrincipal_map_hilbertClassField` | `K = ℚ`; `I = 0` | `H = ℚ`, so every ideal of `ℤ` is principal; the image of `0` is `0` | holds |
| same | `K = ℚ(√−5)`, `I = (2, 1 + √−5)`, `H = K(i)` | `I² = (2)`; `(1 + i)² = 2i` and `−i · 2i = 2`, so `(I𝒪_H)² = (1 + i)²` and `I𝒪_H = (1 + i)` | holds |
| `relDiscr_eq_finprod_abelianConductor` | `L = K` | `(1)` / one character, conductor `(1)` | holds |
| same | `ℚ(i)/ℚ` | `(4)` / `(1) · (4)` | holds |
| same | `ℚ(ζ_5)/ℚ` | `(5³)` / `(1) · (5) · (5) · (5)` (`ℚ(√5)` and `ℚ(ζ_5)` both have conductor 5); an lcm model would give `(5)` | holds; a product, not an lcm |
| `eulerCharacteristic_finrank_fp` | `ℚ_p`, `p` odd, `A = 𝔽_p` | `dim H¹ = 2` / `1 + 0 + 1 = 2` | holds |
| same | `ℚ_2`, `A = 𝔽_2` | `dim H¹ = 3` (`#ℚ_2ˣ/(ℚ_2ˣ)² = 8`) / `1 + 1 + 1` | holds |
| Layer 5 duality Check | `ℚ_2`, `M = μ_3`, `M′ = ℤ/3` | `(#H⁰, #H², #H¹)`: `M` gives `(1, 3, 3)`, `M′` gives `(3, 1, 3)`; factor `p^(…) = 1` | holds; the swapped pairing would force `#H²(μ_3) = 1`, which is false |
| `scd_p_absoluteGaloisGroup_eq_two` | `ℓ = p` and `ℓ ≠ p`; characteristic `p` | `2` / `2`; characteristic `p` (where `cd_p = 1`) is excluded by `Algebra ℚ_[p] K` | holds |
| `cyclotomicCharacter_artinMap_padic` | `p = 2`, `u = −1`, `−3` on `μ_16` | `χ = −1`, so `i ↦ −i`; `(−3)⁻¹ ≡ 5 mod 16` (`13 · 5 = 65`), against `13` without the inverse | holds; sign pinned |
| `…_padic_uniformizer` | every `p` | `N(1 − ζ_(pⁿ)) = Φ_(pⁿ)(1) = p` | holds |
| `hilbertProductFormula` | `ℚ`: `(−1,−1)`, `(3,7)`, `(5,5)` | invariants at `(∞, 2)` are `(1, 1)`, sum `0`; `(3,7)` is nonzero exactly at 2 (`ε(3)ε(7)` odd) and 7 (`(3/7) = −1`), sum `0`; `(5,5)`: `ε(5) = 2` gives `0` at 2, `(−1/5) = 1` gives `0` at 5 | holds |
| `cyclicHasseNorm`, cyclic hypothesis | `ℚ(√13, √17)/ℚ`, `x = 25` | a local norm everywhere, not a global norm; `(17/13) = (13/17) = 1`; 2 is inert in `ℚ(√13)` (`13 ≡ 5 mod 8`) and split in `ℚ(√17)` | the cyclic hypothesis is essential |
| `card_ideleClassNormQuotient` | `ℚ(i)/ℚ`; `L = K` | `2` / `2`; `1` / `1` | holds |
| Layer 7 conductor formula | `ℚ_2(√2)`, `ℚ_p(ζ_p)`, unramified | `3 = 1 + 2`; `1 = 1 + 0`; `0` | holds |
| Layer 12 Kummer degree | `ℚ`, `p = 2`, `S = {2}`; `ℚ(ζ_3)`, `p = 3` | `[U(S) : U(S)²] = 4 = 2^(1+1+0)`; `[U(S) : U(S)³] = 3 · 3 = 3^(1+0+1)` | holds |
| Layer 10 lifting obstruction | `ℚ(√13, √17)`; `ℚ(√2, √3)` | lcm of local degrees `2 < 4 = #H²(G, C_L)`; local degree 4 at 2 | holds |
| Layer 2 Checks | unramified degree 6, `E` of degree 2; corestriction from index 3 | `2 · (1/6) = 1/3`, of order `3 = [L:E]`; `1/2 = 3 · (1/6)` | holds |
| Layer 5 coordinate sign | `ℚ_7`, `n = 3`; `n = 2` | invariant `1/3` gives coordinate `1`, the negated coordinate gives `2`; at `n = 2`, `−1 = 1` | holds; at `n = 2` a sign error is undetectable, as stated |
| Layer 6 Frobenius | `ℚ_2(ζ_5)/ℚ_2` | `2` has order 4 mod 5, `Art(2)(ζ_5) = ζ_5²`; geometric Frobenius would give `ζ_5³` | holds |
| Layer 11 transfer | `ℚ ≤ ℚ(√5) ≤ ℚ(ζ_5)`; Klein four `ℚ(√5, √13)` | `V(g) = g²`, onto `H`; `V(x) = x² = 1` | holds |
| Layer 12 `D₄` composita | two `D₄` fields with a common biquadratic subfield | the fibre product of order 16 has commutator subgroup `{(z,z)}` of order 2, so its abelianization has order 8, against 4 | holds |

**Sources: the seeded sample.**
- *Local units and the `H²` bound.* milne-cft lines 4716–4758, printed pp. 104–105: Lemmas 2.3–2.6. At line 4733 Milne proves Lemma 2.4 only in characteristic zero, and his footnote at line 4743 points to p. 134 of Serre 1967b (Cassels–Fröhlich), exactly as stated.
- *The `p`-adic valuation on a finite extension of `ℚ_p`.* jahnke-koenigsmann lines 113–115, p. 3: Theorem 2.1 is F. K. Schmidt's theorem as cited.
- *Local duality and the Euler characteristic.* milne-adt lines 1227–1229, p. 31: Theorem 2.8 is the Euler–Poincaré formula for finite modules of order prime to the characteristic, which matches `#H¹ = #H⁰ · #H² · p^([F:ℚ_p] v_p(#A))`.
- *The principal ideal theorem.* milne-cft line 7252, p. 161: Theorem 3.17. Line 7323, p. 163: Theorem 3.19, the group-theoretic statement.
- *Conductors*, *The coordinates of `H²(F, μ_n)`*, *The Hilbert symbol* and *The Kummer class* carry no source locator. They name Tau Ceti declarations, which I resolved at the pin (above). The zero-module counterexample in *coordinates* is right: `H²(F, 0) = 0`, which is not `ℤ/p`.
- *Exit criterion* (Layers 0–14). Every declaration each criterion names exists at the pin: `tateTheorem`, `ClassFormation.tateIso`, `nakayamaNegTwo`, `artinEquiv`, `cupClass`, `cohomologyRes`, `cohomologyCor`, `LayerRestriction.trans`, the three `*_subgroupLayer` theorems, `normSubgroup_maximalAbelianLayer`, `Br`, `invMap`, `localSymbol`, `tateDualityPairing_perfect_mixed`, `finite_H`, `eulerCharacteristic_mixed`, `localArtinMap`, `localClassFieldCorrespondence`, `localClassFieldCorrespondencePrimeToResidueCharacteristic`, `injective_artinMap`, `localWeilArtinEquiv`, `globalInv`, `globalArtinMap`, `globalClassFieldCorrespondence`, `globalAbelianGaloisEquiv`, `globalClassField_index`, `cyclicHasseNorm`, the four class fields, `kroneckerWeber`, `hilbertProductFormula` and `sumLocalInv_brLocalization_eq_zero`. The remaining open items in the criteria are this file's five `sorry` targets.
- Further locators checked beyond the sample:
  - milne-cft I §4: line 2379 (ceiling convention); line 2410, p. 46 (Prop. 4.4); lines 2415–2419, p. 46 (the infinite filtration defined after Prop. 4.4).
  - milne-cft I 1.9: line 1321, p. 23.
  - milne-cft II 3.11: line 3911 (Tate's theorem).
  - milne-cft III §4: lines 5068–5119, pp. 112–113 (Steps 3–4, Theorem 4.4).
  - milne-cft V: Example 3.11 (line 7121, p. 159); Theorem 3.27 and Remark 3.28 (lines 7423–7437, p. 165); Example 5.4 (line 8142, p. 179).
  - milne-cft VII: Prop. 2.7, Prop. 3.1, Lemmas 4.1–4.2 and Theorem 4.3 at pp. 206–211; Cor. 4.4 (p. 211); Theorem 5.1 (p. 212); Theorem 8.1(b) (line 10045, p. 221); Lemma 9.3 with `S ⊇ S_∞` (lines 10218–10221, p. 224).
  - milne-cft VIII §4: the calculation before Lemma 4.1 (lines 10886–10914, p. 240); Theorem 4.7 (line 11011, p. 242).
  - kopp-lagarias: Theorems 1.1–1.3 (lines 128–185) at level datum `(O; O, ∅)`, which gives the ring class field, the ramification bound at `f(O)`, the splitting criterion and `Art_O : Pic O ≅ Gal(H_O/K)`.

## Not verifiable

- serre-local-fields (uncertified, paywalled): XV §2, Theorem 2 and Corollary 3 to Theorem 1, cited for unit-filtration reciprocity. The statement was checked mathematically and against Milne I 1.11 (milne-cft lines 1374–1378). There Milne states the analogous correspondence for `Gal(K_π/K)`: `U_K^(n)` maps to the upper ramification groups. Also IV §4, VI §3 and IX §§3–5.
- artin-tate (waived): XIII §4 (principal ideal theorem), XIV §§1–6, XI §5, XII and XV. Milne's proof of V 3.19 (milne-cft line 7329) cites "Artin and Tate 1961, Chapter XII" for the group-theoretic theorem. Without the text I cannot tell which chapter number the AMS edition uses.
- nsw (uncertified): (3.3.4), (7.1.8)(i), (7.2.5) and (7.3.1)–(7.3.4).
- neukirch-ant (uncertified): VII §11.
- Cited works that are not in the manifest and are outside the seeded sample, so not fetched:
  - Serre, *Local class field theory* (Cassels–Fröhlich VI, p. 134), whose locator agrees with Milne's footnote;
  - Tate, *Number theoretic background* (Corvallis, §1) and *Global class field theory* (Cassels–Fröhlich);
  - Cox, *Primes of the Form x² + ny²*, Prop. 7.22 and Thm. 9.18;
  - Serre, *Galois Cohomology* II §5.3 and *A Course in Arithmetic* III §§1–2;
  - Lang, *Algebra* III Thm. 7.1; Brown, *Cohomology of Groups* VI §8; Rim 1959; Tate 1952; Nakayama 1957; Weil 1951.
- Whether `Completed/LocalGaloisGroups/Suggested.lean` builds at this head: its roadmap imports are not built in this worktree, and the commands allowed for this review do not include building them. CI's `Completed` target builds it (see R02).

## Source issues

- none
