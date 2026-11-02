# Review of DerivedModuleAlgebra (pull request #1701 at 2e67d26)

**Verdict:** needs changes

The pull request adds six paragraphs and one reference to the README of a roadmap already on main (`Suggested.lean` unchanged). The added material is correct (see *Verified sound*). The verdict is driven by the gate on the head, which fails on the build and on sorry'd data in `Suggested.lean`, and by two blocking defects of the folder as it stands.

## R01 (P1) — Gate: build fails on the module-system warning

Location: `TauCetiRoadmap/DerivedModuleAlgebra/Suggested.lean` line 1, `import Mathlib`.

Claim: the targeted build `lake build TauCetiRoadmap.DerivedModuleAlgebra.Suggested` is clean.

Witness: the gate reports `build=1 FAIL` with the single diagnostic "imports `Mathlib` from package `mathlib`, which is designed for use with the module system; consider adding `module`". At the pinned Mathlib f6090c70 every library file is a `module` file, and the gate counts every warning other than `declaration uses sorry`.

Repair: make the file a module-system file: first line `module`, then `public import Mathlib`, `public import TauCeti.RingTheory.Ideal.ArtinRees`, `public import TauCeti.Algebra.Module.Injective.Envelope.Basic`, the module docstring, `@[expose] public section`, then the namespace as now. `TauCetiRoadmap/TypeAHeckeAlgebras/Suggested.lean` on main (lines 6–12) is the precedent for the header; declarations need no change. Re-run the gate: the build counter must read 0.

## R02 (P1) — 33 `def`/`instance` declarations with `sorry` bodies

Location: `TauCetiRoadmap/DerivedModuleAlgebra/Suggested.lean` lines 295, 308, 320, 323, 374, 377, 596, 613, 617, 626, 636, 653, 662, 666, 670, 732, 796, 800, 812, 818, 833, 842, 909, 912, 1038, 1042, 1052, 1056, 1066, 1070, 1075, 1086, 1110 (the gate's `sorry-data` list).

Claim: `Suggested.lean` states headline theorems against the pins with only real-bodied definitions.

Witness: `def derivedTensor (R : Type u) [CommRing R] : D R ⥤ D R ⥤ D R := sorry` (line 613), `def derivedLimit … := sorry` (796), `instance derivedLimit_commShift … := sorry` (800), `def derivedCompletion … := sorry` (909), `def ModuleTower.shift … := sorry` (295). Everything built on them is a statement about an unspecified functor: `HasTorAmplitude` (706), `PerfectSystem` (757), `perfectInverseSystemEffectivity` (881), `completedColimit` (919), the whole §1.6 block (1038–1125), `ModuleTower.lim`/`limOne` (302, 305) and the two `Tower` comparisons (374, 377).

Repair: delete every sorry'd `def`/`abbrev`/`instance` and every declaration whose type mentions one (the list above plus `shift_apply`, `shift_natural`, `productMap_apply`, `lim`, `limOne`, `limMap`, `limOneMap`, `limComparison`, `limOneComparison`, `simplicialTensorComparison_natural`, `derivedTensor_flatModel`, `simplicialTensorDerived`, `bisimplicialDiagonalComparison`, `HasTorAmplitude`, `isPerfect_baseChange`, `isPerfect_finiteTorAmplitude`, `finiteFreeBaseChangeModel`, `finiteFreeModelLift`, `PerfectSystem` and its `transition`, `FiniteFreeSystemModel`, `compatibleFiniteFreeModels`, `derivedLimit_triangle`, `finiteFreeSystemDiagram`, `finiteFreeSystemLimit*`, `pseudoCoherent_residueCriterion`, `perfectInverseSystemEffectivity`, `PerfectLimitChecks.differential`, `completionComplete`, `completedColimit`, `simplicialAlgebraUnderlying*`, `simplicialAlgebra_connective`, every `ringCompletion*` and `simplicialRingCompletion*`). Keep what has real bodies and is statable: the two `PolynomialLaw` predicates, `PD.augmentation`/`augmentationIdeal`, `dp_two_not_mem_span_dp_one`, `moduleKInjectiveReplacement`, `flatModuleFilteredFree`, the `CompactCoefficients.Tower` API with `limOne_subsingleton_of_isMittagLeffler` and `limOne_exact`, `derivedCompleteness` with `isDerivedCompleteGenerators`/`Radical`/`Cohomology`/`_triangle`, `IsCompletelyFlatModule` with `isCompletelyFlatModule_of_flat`, `IsPerfect`/`IsPseudoCoherent` with `isPerfect_iso`/`retract`/`shift`/`triangle`/`isPseudoCoherent`, `IsRingTowerLimit` with `ringTowerLimit_jacobson`, `SimplicialAlgebra`, `simplicialAlgebraCochains`, `simplicialAlgebraWeakEquivalences`, `SimplicialAlgebraHomotopy`, `simplicialAlgebraLocalization`, `multiplicationComplex`. Name in the module docstring the headlines these deletions remove and the carrier each lacks: the unbounded derived tensor and its K-flat model (§0.2), the shuffle/Alexander–Whitney equivalences (§0.2.2), the derived limit functor and its exactness (§1.1), the completion reflector with its adjunction and derived Nakayama (§1.3), simplicial-algebra completion (§1.6), compatible finite-free models and perfect-system effectivity (§§1.E.0–1.E.1). The README keeps every statement.

## R03 (P2) — §0.K.1 cites a Mathlib Koszul interface that is not at the pin

Location: `TauCetiRoadmap/DerivedModuleAlgebra/README.md` lines 552–562 (§0.K.1, the paragraph beginning "Use Mathlib's linear-functional Koszul-complex interface"), and `Suggested.lean` line 1167 (`0.K.1: koszulComplex, koszulComplex.map`).

Claim: Mathlib supplies `koszulComplex φ`, its differential, `koszulComplex.map`, the tensor identification and the homotopy, so §0.K.1 only specialises them.

Witness: at the pinned Mathlib f6090c70, `grep -rn koszulComplex Mathlib` returns nothing; the only Koszul mentions are a comment in `Mathlib/Algebra/Homology/LocalCohomology.lean` line 43 and the TODO "Koszul regular sequences" in `Mathlib/RingTheory/Regular/RegularSequence.lean` line 21. The three links are to open Mathlib pull requests 43706, 43708, 43711, which the README is not allowed to cite (pull-request references, and a library declaration cited where it does not exist).

Repair: make the linear-functional Koszul complex a target of §0.K.1 in the roadmap's own words (the exterior-power terms, the contraction differential, `map` along `φ′ ∘ g = φ`, the tensor identification with its sign, the homotopy `d(m ∧ v) + m ∧ d(v) = φ(m)v`), with the Stacks locators already present as its sources; delete the sentence "Use Mathlib's … interface", the two "follow [interface]" sentences and the three pull-request URLs; drop `koszulComplex, koszulComplex.map` from the Lean catalogue (which R06 deletes anyway). The supplier-contract row "Mathlib exterior powers and regular sequences" already lists only `ExteriorAlgebra.exteriorPower`, `exteriorPower` maps and `RingTheory.Sequence.IsWeaklyRegular`, which do exist, so it needs no change.

## R04 (P2) — Matlis biduality is statable at the pins but absent from `Suggested.lean`

Location: `README.md` lines 2272–2345 (§§1.M.1–1.M.2) and line 7 (Summary names "Matlis duality" among the end results); `Suggested.lean` states nothing from these sections and its docstring does not say why.

Claim (implicit in the file): the Matlis statements are not statable at the pins.

Witness: every carrier exists. Mathlib f6090c70 has `IsLocalRing`, `IsNoetherianRing`, `IsLocalRing.ResidueField` (`Mathlib/RingTheory/LocalRing/ResidueField/Defs.lean` line 28) and `IsAdicComplete` (`Mathlib/RingTheory/AdicCompletion/Basic.lean` line 56); Tau Ceti 358314d4 has `TauCeti.IsInjectiveEnvelope (f : M →ₗ[R] Q) : Prop` (`TauCeti/Algebra/Module/Injective/Envelope/Basic.lean` line 101), already imported by the file. The biduality headline reads: for `R` a Noetherian local ring with `IsAdicComplete (IsLocalRing.maximalIdeal R) R`, `e : IsLocalRing.ResidueField R →ₗ[R] E` with `TauCeti.IsInjectiveEnvelope e`, and `M` with `Module.Finite R M`, the evaluation map `M →ₗ[R] ((M →ₗ[R] E) →ₗ[R] E)` is bijective; the Artinian-side statement reads the same with `IsArtinian R M`.

Repair: state the two biduality theorems (finite side, Artinian side) with `sorry` in a `/-! ## 1.M: Matlis duality -/` section, hypotheses exactly as above (the finite-residue-field hypothesis of §1.M.1 is not needed for biduality and §1.M.2 drops it; state the general form once). If the author prefers to keep §1.M.1's finite-residue-field version as a separate statement, it is a Check, not a second headline.

## R05 (P3) — Padding: 49 admitted `example`s, Check-mirroring theorems, one-tactic API lemmas

Location: the gate's `sorry-examples` list (49 lines, 55–1137); `Suggested.lean` lines 136–152 (`augmentation_test_positive_with_scalar`, `augmentation_test_degree_one`, `augmentationIdeal_test_positive`, `augmentationIdeal_test_unit`), 237–240 (`augmentationIdeal_test_degree_one_insufficient`, proved by `exact dp_two_not_mem_span_dp_one`), 275–276, 298–311, 384–396, 454–476 (`mem_lim`, `shift_apply`, `productMap_apply`, `Hom.onProduct_id/comp/zero` proved by `rfl`, `Hom.limOneMap_id/comp/zero`), 405–412 (`isMittagLeffler_of_surjective`, `isMittagLeffler_of_finite`, `limOne_subsingleton_of_surjective`).

Witness (probe on scratch copies, `lake env lean`): line 275's example closes with `exact Module.bijective_dual_eval (ZMod 2) (Fin n → ZMod 2)` (`Mathlib/LinearAlgebra/Dual/Defs.lean` line 216); the `dp` identities at lines 88–98 reduce under `simp [sq, DividedPowerAlgebra.dp_mul]` to `↑(Nat.choose 4 2) * dp ℤ 4 1 = 6 * dp ℤ 4 1` and `2 * dp (ZMod 2) 2 1 = 0`, small-value computations; the four `augmentation_test_*` theorems are the README Checks of the same name. An admitted `example` tests nothing.

Repair: delete them from `Suggested.lean`; the README keeps each as a Check or API bullet. Keep the proved `example` at line 47 (identity law homogeneous of degree one) only if the author wants one proved test of `IsHomogeneousOfDegree`.

## R06 (P3) — Catalogue of names and a docstring that does not say what is not statable

Location: `Suggested.lean` lines 1144–1336 (`## API of the full constructions`, a list of about two hundred names) and lines 5–14 (module docstring: "representative target signatures", "the catalogue at the end records their names").

Claim: the catalogue documents the contracts without placeholder carriers.

Witness: the file rules forbid catalogues of names and ask the docstring to name each headline that is not statable and the carrier it lacks; the catalogue also carries process wording ("not exhaustive", "discharging them finishes neither a section nor the roadmap") and the `koszulComplex` names of R03.

Repair: delete lines 1144–1336; rewrite the docstring as "DerivedModuleAlgebra: target signatures", saying the roadmap is `README.md`, that this file states the headline theorems against the pinned APIs, and listing the headlines of R02 as not statable with their missing carriers.

## R07 (P3) — Two chapter-page slips in Stacks locators

Location: `README.md` line 611 ("[StacksCt] Definition 3.1, Tag 08PM, p.3") and line 1142 ("§3, Lemma 3.4 (Tag 08S9) … pp.4, 17–19").

Witness: in the cotangent chapter text, Definition 3.1 (StacksCt line 81) precedes the page-3 marker (line 87), so it is on chapter page 2; Lemma 3.4 (line 108) precedes the page-4 marker (line 129), so it is on chapter page 3. Definition 3.2 (08PN) is on p.3 as stated.

Repair: "p.2" at line 611; "pp.3, 17–19" at line 1142.

## R08 (P3) — Unused finite-generation hypotheses

Location: `Suggested.lean` lines 941–949 (`isDerivedCompleteRadical` takes `hI : I.FG` `hJ : J.FG`; `isDerivedCompleteCohomology` takes `hI : I.FG`).

Witness: `derivedCompleteness A I M` quantifies over every `f ∈ I`; Stacks Lemma 93.2 (Tag 091Q, StacksMA line 12049) says the set of `f` with `T(K,f) = 0` is a radical ideal, and Lemma 93.6(2) (Tag 091U) identifies complete objects with complexes of complete cohomology, both for an arbitrary ideal. Neither statement's truth nor the README's proof route uses finite generation.

Repair: drop the three binders, or leave them with a one-line note; not blocking.

## R09 (P3) — README shape

Location: `README.md` headings (lines 9, 32, 49, 60–2346, 2437).

Witness: the roadmap has `## Scope and ownership`, `## Exact supplier contracts`, `## Conventions` and `## References`, but no `## How to read the build`, no `## Layer k:` headings (sections are `### 0.DP.1`, `### 1.T.1`, `### S.1` …), no `### Examples`/`### Dependencies` per layer and no `## Downstream consumers` heading (the consumer list sits in Scope). API bullets carry backticked names of this roadmap's own (`Crystalline.Augmentation.*`, `DoubleComplex.*`, `Algebra.CotangentComplex.*`) that `Suggested.lean` does not declare; the citation check lists 131 of them.

Repair (author's choice, not blocking): group the sections into layers with the house headings; turn the API bullets into prose without backticked own names, or keep only the names the Lean file declares.

## Verified sound

**The pull request's change (README lines 247–252, 304–308, 343–346, 374–376, 1624–1630, 2414–2421, 2444–2446, 2468).** Fetched `https://github.com/daddeziomath/affine-crystalline` at tag `v1.0.0` (identical to `main` for the five cited files) and the Zenodo API record for concept DOI 10.5281/zenodo.23573534 (version record 23573535, published 2026-10-22, title as cited). Every cited declaration exists in the cited file:

| Citation in README | File at v1.0.0 | Line | Agrees with README? |
| --- | --- | --- | --- |
| `FreeConstruction.augmentation` | `Envelope/FreeConstruction/DPAlgebraAugmentation.lean` | 79 | yes: `DividedPowerAlgebra.lift'` on `fun nm ↦ if nm.1 = 0 then 1 else 0`, so "built from its generator values", `{R M : Type u}` one universe, `[CommRing R] [AddCommGroup M] [Module R M]` |
| `augmentation_apply_dp`, `augmentation_apply_algebraMap` | same | 109, 115 | yes |
| `positiveIdeal` = `Ideal.span positiveGenerators` | same | 124 | yes, the span form |
| `dp_mem_positiveIdeal`, `positiveIdeal_le_augmentation_ker` | same | 127, 132 | yes |
| `sub_augmentation_mem_positiveIdeal` | same | 153 | yes: `x − algebraMap (ε x) ∈ positiveIdeal` |
| `positiveIdeal_eq_augmentation_ker` | same | 181 | yes, sides as README says (span = kernel) |
| `CechNerveData` | `Cohomology/Cech.lean` | 84 | yes: `X : SimplexCategory ⥤ J`, `S : J → Type v`, `nonempty`, `equiv : (X.obj ⦋n⦌ ⟶ Z) ≃ (Fin (n+1) → S Z)` |
| `rightDerivedLimIsoCech` | `Cohomology/CechDerived.lean` | 70 | yes: `(lim.rightDerived n).obj F ≅ (cech D F).homology n`, `cech` the alternating coface complex of `F(X[•])` (Cech.lean 151) |
| `RawBi.augRowι_quasiIso`, `augColι_quasiIso` | `Homology/TotM.lean` | 911, 1055 | yes: columns, resp. rows, of the augmented bicomplex exact ⇒ augmentation quasi-iso |
| `RawBi.totMap_quasiIso` | `Homology/TotQuasiIso.lean` | 549 | yes: column surjectivity/injectivity hypotheses `ColSurj`, `ColInj` |

The repository's `lake-manifest.json` pins Mathlib `c026161a` (committed 2026-07-22 in our Mathlib checkout's history) against our pin f6090c70 (2026-09-28): "pinned to an earlier Mathlib" is correct. `ℕᵒᵖ` carries no `CechNerveData`: the data require `Hom(X[0], Z) ≃ S(Z)` nonempty for every `Z`, i.e. a weakly initial object, and in `ℕᵒᵖ` the object `n` maps to `Z` only when `Z ≤ n`. The licence file is Apache-2.0. No instruction-like text was found in the fetched files.

**Gate and order.** Depcheck output: `depcheck: 205 roadmaps, 1511 edges, 0 problem(s)`; no UPWARD or CYCLE line. The roadmap is on main and cites no roadmap supplier (the AlgebraicTopology link `#stage-6-cohomology-products-and-manifold-duality` resolves to the heading at `TauCetiRoadmap/AlgebraicTopology/README.md` line 946 on main; the listed downstream consumers EnhancedDerivedSheaves, KhovanovHomology, PerfectoidSpaces, EtaleCohomologyFoundations, CharacteristicClasses, AffineMorseLefschetz, DGFloer all exist on main). `git diff --stat origin/main...HEAD` touches only `TauCetiRoadmap/DerivedModuleAlgebra/README.md`. Ownership: `roadmaps grep --lean-only` for `derivedCompletion`, `IsPerfect`, `derivedLimit`, `derivedCompleteness`, `augmentationIdeal`, `structure Tower` finds no other owner on main or in the 439 open pull requests; no open roadmap cites `koszulComplex`.

**Library declarations opened at the pins** (Mathlib f6090c70 unless said): `Module.Flat.exists_factorization_of_finitePresentation` (`RingTheory/Flat/EquationalCriterion.lean` 270; hypotheses `[Flat R M]`, `[FinitePresentation R P]`, as §0.2.1 uses), `dividedPowersBot` (`RingTheory/DividedPowers/Basic.lean` 95), `DividedPowerAlgebra.lift`/`lift_apply_dp`/`lift'`/`lift'_apply_dp`/`algHom_ext`/`induction_on`/`dp_zero`/`dp_mul`/`embed_def`/`map_apply_dp` (`RingTheory/DividedPowerAlgebra/Init.lean` 346, 364, 316, 335, 235, 147, 152, 171, 224, 431), `CategoryTheory.Functor.IsMittagLeffler` (`CategoryTheory/CofilteredSystem.lean` 137), `PolynomialLaw.id`/`comp`/`ground` (`RingTheory/PolynomialLaw/Basic.lean` 118, 271, 232), `CochainComplex.mappingCone.inl_v_triangle_mor₃_f` (`Algebra/Homology/HomotopyCategory/Pretriangulated.lean` 60: the composite is minus the shift isomorphism, as §0.25 and the Check `transitivityTriangle_cone_sign` say), `IsAdicComplete`, `IsLocalRing.ResidueField`, `Module.bijective_dual_eval` (`LinearAlgebra/Dual/Defs.lean` 216), `coreE₂CohomologicalNat`, `IsFirstQuadrant`, `spectralObjectMappingCone`, `mapHomologicalFunctor`, `TensorSigns`, `embeddingDownNat`, `ofOpSequence`, `IsKInjective`, `derivationToSquareZeroEquivLift`, `Algebra.Generators.equivH1Cotangent`, `exact_cotangentComplex_toKaehler`, `exact_liftBaseChange_map_of_flat`, `AdicCompletion.ofTensorProductEquivOfFiniteNoetherian`, `CommAlgCat` (all present). Tau Ceti 358314d4: `TauCeti.ArtinRees.exists_controlled_lift` (`RingTheory/Ideal/ArtinRees.lean` 78, `[IsNoetherianRing R] [Module.Finite R M]`), `TauCeti.IsInjectiveEnvelope`, `.isEssential_range`, `.exists_linearEquiv` (`Algebra/Module/Injective/Envelope/Basic.lean` 101, 31, 63). Absent: `koszulComplex` (R03).

**Elaborated signatures.** The worker's `signatures.md` lists all 136 declarations with no dropped section binder; I compared `derivedCompleteness`, `isDerivedComplete*`, `IsCompletelyFlatModule`, `IsPerfect`, `IsPseudoCoherent`, `pseudoCoherent_residueCriterion`, `finiteFreeModelLift`, `completedColimit`, `flatModuleFilteredFree`, `moduleKInjectiveReplacement`, `limOne_exact` with their README statements: generality agrees (unital rings for perfectness and towers, commutative rings for Tor amplitude and completeness, `Type u` with the local `HasDerivedCategory.{u+1}` instance as §1.2 states).

**Sampled targets against the sources** (text lines are in the worker's cache; chapter pages for Stacks):

| Target | Source at locator | Statement supported as written? |
| --- | --- | --- |
| 0.1 | StacksCt Def 3.1 (08PM, line 81, p.2), Def 3.2 (08PN, 89, p.3), Lemmas 4.1–4.3 (08PS–08PU, 144–193, pp.4–5), 4.4 (203), Remark 5.5 (08QI, 360, p.9), Lemmas 5.6–5.7 (08QJ–08QK, 382–395, pp.9–10) | yes; `P₀ = A[B]`, `P_{n+1} = A[P_n]`; Remark 5.5 states its three equivalences under "each `P_n` surjects onto `B`", which for a simplicial-module quasi-isomorphism onto a discrete `B` is automatic (`π₀P = coker(d₀−d₁) ≅ B` forces `P₀ ↠ B`), so the README's "equivalently" holds |
| 0.2.2 | StacksSites Remark 39.11 (08QD, line 4324; chapter 21 so "21.39.11" is right); Dold–Puppe Satz 2.9 (line 422, printed 213/214), Satz 2.15 (567, printed 217), Bemerkung 2.16 (583) | yes; 2.9 is the universal homotopy equivalence total ↔ diagonal for any bisimplicial object (no flatness), 2.15 names shuffle and Alexander–Whitney with `sign(μ,ν)`; Stacks adds the flat case identification with `⊗^L` |
| 0.5 | StacksDefos Lemmas 2.1–2.3 (08S5, 08S7, 0GPT, lines 56, 127, 161, pp.2–4), Remark 2.4 (0GPU, 177); GR 2.5.4–2.5.7 (lines 1454–1480, p.30) | yes; Exal ≅ Ext¹(NL, N), torsor under Ext¹, Baer sum via `(E ⊕ F)∗δ` with `α : I ⊕ I → I` (GR 2.5.5) matches the antidiagonal-quotient description |
| 0.7 | StacksCt Lemma 4.5 (08QF, 206), 11.2 (08RA, 916, p.21), 11.3 (08RB, 933, p.21), 13.3 (09CG, 1146, p.26) | yes |
| 0.9 | GR Prop 8.1.7 and proof (lines 10619–10660, pp.219–221): `R• = S• ×_S R`, `L_{S/R} ≃ L^Δ_{S•/R•}` via Illusie II.1.2.6.2, `E¹_{ij} = H_j(L_{S[i]/R[i]}) ⇒ H_{i+j}(L^Δ)` | yes, same spectral sequence and same reduction |
| 0.11 | StacksCt Lemma 3.4 (08S9, 108, p.3), 8.1 (08QZ, 779, p.17), 8.4(3) (08R2, 805, p.18), 8.6 (08SF, 827, p.19) | yes (page slip, R07) |
| 0.12 | StacksCt Lemma 9.1 (08R5, 847, p.19), 8.4(5), 4.7 (08QH, 228) | yes; "smooth" in Stacks includes finite presentation |
| 0.16 | SAG Construction 25.2.2.3 (line 62308, p.1700), Remark 25.2.2.4 (62327, p.1701), Prop 25.2.3.1 (62365, p.1702), Prop 25.2.3.4(3) (62412, p.1703: `Γⁿ_A(M) ≅` Σₙ-invariant tensors for flat `M`); Dold–Puppe 4.13 and (4.14) (lines 1023–1035, printed 230: `LT ≅ LΓ_m` for the invariants functor) | yes |
| 0.17 | DM Lemma 3.3 (line 863, p.21: filtration of `∧ⁱ` for a short exact sequence of projectives with `gr_j = ∧ʲL ⊗ ∧^{i−j}N`); SAG Prop 25.2.4.2 (62450, p.1704: `LSymⁿ(ΣM) ≃ Σⁿ∧ⁿM`, `∧ⁿ(ΣM) ≃ ΣⁿΓⁿM`); Bhatt12 Prop 3.22 (523, p.11), Remark 3.43 (893, p.18) | yes |
| 0.25 | StacksCt §16 situation (1388–1407) and Lemma 16.1 (08SP, 1408, p.31), 21.1 (08UZ, 1676); StacksAlg Lemma 99.8 (051C, 11014, pp.233–234); StacksDefos Lemma 2.1 (08S5); GR Thm 2.5.30 (1672, p.34), 2.5.32 (1685, p.35), Lemma 3.2.1 (1946, p.41), Cor 3.2.11 (2016) | yes; Stacks' problem is for an arbitrary `A`-linear `c : I → N`, as the README says; 99.8 gives flatness from `M/IM` flat and `Tor₁(R/I, M) = 0` for nilpotent `I` |
| 1.1.1 | StacksMA §75 (0A5W, 8707), (75.0.1)–(75.0.2) (0A63–0A64), Lemma 75.1 (0A65, 8723); StacksSites §35 (3668) | yes |
| 1.3 | StacksMA Lemma 93.10 (091V, 12163, p.264), 93.18 (0920, 12293, p.267), 93.20 (0G1U, 12344, p.268), 93.21 (0AAJ, 12374, p.268) | yes; `K^∧ = RHom(extended alternating Čech complex, K)`, `= Rlim K ⊗^L K(fⁿ)`, derived Nakayama |
| 1.6 | StacksCt Def 3.1, Remark 5.5; Prisms §1.2 footnotes 5–6 (lines 399–446, pp.10–11: Koszul tower `Aₙ = Kos(A; fⁿ)` of simplicial rings, `Â ≃ lim Aₙ`) | yes |
| 1.8 | BMS19 Lemmas 4.6–4.7 (lines 895, 908, pp.221–222), Cor 4.8 (958, p.223) | yes; bounded torsion is a hypothesis of 4.6 and 4.7 as in the README |
| 1.9 | BMS19 Remark 4.9 (973, p.223), Theorem 3.1 (751, p.217) | yes; Remark 4.9 is the `∧ⁱL^∧` case, Theorem 3.1(i=0) is faithfully flat descent; the README's module statement is the limit over `n` of descent for `D(A/pⁿ)`, as the remark indicates |
| Supporting: 1.E.0/1.E.1 | StacksMA 76.1–76.5 (8793–8826), 77.5 (0BCB, 9085: stably free lift when `1+I` are units, free if `E^i` free), 79.2 (068V, 9295: pseudo-coherent + residue-field Tor interval ⇒ perfect in `[a,b]`), 89.1–89.5 (10946–10994), 89.10–89.12 (11108–11133), 99.3 (0CQG, 13310: the all-perfect alternative) | yes |
| 1.T.1 | StacksMA 88.1 (07KW, 10638), 88.9–88.10 (07KX–07KY, 10797, 10814); StacksAlg 86.4 (0598, 9540) | yes |

**Adversarial pass** (statement, instances, values computed on each side, result):

| Statement | Instances | Values | Result |
| --- | --- | --- | --- |
| 0.DP.3 ε on generators | `dp 0 m`, `dp n m` (n>0), `algebraMap r`, `R = M = 0` | `lift (dividedPowersBot) 0`: `dpow 0 0 = 1`, `dpow n 0 = 0` (n>0); zero ring: ε = 0 = 1 consistently | sound |
| 0.DP.3 ε(3 + dp 2 m) = 3 in char 2 | `R = 𝔽₂` | 3 = 1 in 𝔽₂; ε(1 + dp 2 m) = 1 | sound |
| 0.DP.3 degree one does not generate | `Γ_{𝔽₂}(𝔽₂)`: `x·x^[n] = (n+1) x^[n+1]` | `x·x^[1] = 2x^[2] = 0`, so `(x)` is spanned by odd `x^[m]`, `x^[2] ∉ (x)`; over ℚ `x^[2] = x²/2 ∈ (x)` | sound both directions |
| 0.DP.2 `γ₁(1)² = 2γ₂(1)`, `γ₂(1)² = 6γ₄(1)` | `R = ℤ`, via `dp_mul`: `dp n · dp p = C(n+p, n) dp (n+p)` | `C(2,1) = 2`, `C(4,2) = 6` | sound |
| 0.1 `test_resolution_not_quasi_iso` | constant `A[t] → A[t]/(t²)`, `A ≠ 0` | alternating face complex of a constant object is `A[t][0]`; target `A[t]/(t²)`; `t ↦ 0`? no: kernel `(t²) ≠ 0` | not a quasi-iso, sound |
| 0.2.2 shuffle of degree-one generators | Dold–Kan objects of `A[1]`, the two (1,1)-shuffles | `+s₁x ⊗ s₀y − s₀x ⊗ s₁y`; swap gives `(−1)^{1·1} = −1` on `H^{−2} ≅ A`; over 𝔽₂ `+1 = −1` | sound |
| 0.2.2 `s(X ⊗ X)` for a free resolution `X` of ℤ/2 | Tor | `Tor₀ = ℤ/2`, `Tor₁ = ℤ/2`: `H⁰ = H^{−1} = ℤ/2` | sound |
| 0.5 non-split extensions | `ℤ/4 → ℤ/2`, `ℤ/9 → ℤ/3`, `ℚ[ε] → ℚ` over ℤ | a ring section ℤ/2 → ℤ/4 would send 0 = 2·1 to 2 ≠ 0; Exal_ℤ(𝔽_p, 𝔽_p) ≅ Hom(pℤ/p²ℤ, 𝔽_p) ≅ 𝔽_p; ℚ[ε] has the section ℚ → ℚ[ε] | sound; `2·[ℤ/4] = 0`, `[ℤ/9]` of order 3, as the Checks say |
| 0.5 `extensionCategory_polynomial` | `a + εb ↦ a + ε(b + a′)` on `ℚ[X] ⊕ εℚ[X]` | product `(a+εb)(c+εd) = ac + ε(ad+bc)` maps to `ac + ε(ad+bc+(ac)′)`; images multiply to `ac + ε(ad + ac′ + bc + a′c)` | equal by Leibniz, sound |
| 0.6 `conormalComparison_zmodNine` | `ℤ/9 → 𝔽₃`, inclusion `1 ↦ 3` and `1 ↦ 6` | `3 = i(1)` so `3 mod 9 ↦ 1`; with `1 ↦ 6`, `3 = i(2)` so `↦ 2` | sound |
| 0.7 `H^{−2}(L_{B/k}) ≅ k` for `B = k[x,y]/(x,y)²` | Koszul homology of `(x², xy, y²)` | syzygies free of rank 2 (`r₁ = (y,−x,0)`, `r₂ = (0,y,−x)`), Koszul boundaries `x r₁`, `y r₁ + x r₂`, `y r₂`; `H₁(K) = P²/N` has dimension 6 − 3 = 3; `0 → H₂(L_{B/P}) → H₁(K) → B³ → J/J² → 0` with `dim B³ = 9`, `dim J/J² = 7` gives `dim H₂ = 3 − 2 = 1`; transitivity for `k → P → B` transfers it | sound (the naive truncation indeed loses it) |
| 0.8/0.25 `transitivityConnecting_polynomial_quotient` | `k[x]/(x³) → k[x]/(x²) → k` | `(x²)² = 0`; `H^{−1}(L_{B/A} ⊗^L k) = (x²)/(x⁴) ⊗ k = k`; its image in `H^{−1}(L_{k/A}) = (x)/(x²)` is `x² = 0`, so the connecting map onto `k` is nonzero | sound |
| 0.25 cone sign | Mathlib `inl_v_triangle_mor₃_f` | `inl ≫ mor₃ = −(shift iso)` | README's "minus projection onto the shifted source" and `transitivityTriangle_cone_sign` agree with the pin |
| 0.25 `test_deformation_zero_map` | `A′ = ℤ/4 → A = B = 𝔽₂`, `N = 𝔽₂`, `c = 0`, `B′ = 𝔽₂[ε]/ε²` | kernel `𝔽₂ε ≅ N`, image of `2` is `0` so induced `c = 0`; `2B′ = 0 ≠ B′` so not flat over ℤ/4 | sound: the flat specialisation needs the canonical `c` |
| 0.25 `polynomialLift_sign` | `h_a(X) = X + aε` on `ℚ[ε]/ε²[X]` | `h_a(X²) − X² = 2aXε`, `h_a(P) − P = aP′(X)ε` | sound |
| 0.16/0.17 décalage at a line | `N = ℤ`, `n = 2` | `L∧²(ℤ[1]) ≃ Γ²(ℤ)[2] ≅ ℤ[2] ≠ 0`; ordinary `∧²ℤ = 0` | sound, agrees with 0.14 Check `integral_boundary` |
| 1.T.1 `limOne_mul_p` | `(a_n) ↦ Σ pⁿ a_n` | `Σ pⁿ(a_n − p a_{n+1}) = a₀ ∈ ℤ`; `2 · (1/2) = 1 ∈ ℤ` kills the 3-adic half | sound; `lim = 0` since `a₀ = pⁿ a_n` for all `n` |
| 1.T.1 converse of ML ⇒ lim¹ = 0 fails | `pⁿℤ_p` with inclusions | images `p^{n+k}ℤ_p` never stabilise; `a_n = Σ_{k≥n} b_k` solves `a_n − a_{n+1} = b_n` | sound |
| 1.T.1 Milnor Check | `K_n = [ℤ → ℤ/pⁿ]` | `H⁰(K_n) = pⁿℤ` (≅ the mult-by-`p` tower), `H¹(K_n) = 0`, `H¹(K) = ℤ_p/ℤ = lim¹` | sound |
| 1.1 levelwise-split triangle not distinguished | `A_n = ⊕_{m≥n}k`, `B_n = V`, `C_n = kⁿ` | `lim A = 0`, `lim B = V`, `lim C = ∏k`, six-term gives `lim¹A = ∏k/⊕k`; a zero boundary would force `⊕k ↠ ∏k` (the all-ones family is missed) | sound |
| 1.1 fibre homotopy square | `h(x)_n = x₀` for even `n`, target tower `ℤ[1]` with `×3` | class `Σ 9^m = 1/(1−9) = −1/8 ∉ ℤ` | sound |
| 1.1.1 `test_module_rhom_nonperfect` | `L = ℤ[1/p]`, `M = ℤ` | `RHom = Rlim(ℤ ←p ℤ ←p …)`: `H⁰ = 0`, `H¹ = ℤ_p/ℤ` | sound, consistent with 1.T.1 |
| 1.2 `derivedCompleteness` at `I = ⊥`, `I = ⊤` | `f = 0`: `Localization.Away 0 = 0`; `f = 1` | every object complete; `Hom(A[n], M) = H^{−n}(M) = 0` for all `n` iff `M = 0` | sound |
| 1.3 no cokernel of `2 : ℤ[0] → ℤ[0]` | `End(ℤ[0]) = ℤ` | a cokernel is a split epi onto a summand of `ℤ[0]`, hence `0` or `ℤ[0]`; `ℤ[0] → (ℤ/2)[0]` kills 2 and is nonzero | sound |
| 1.5 `test_ordinary_tower_unbounded_torsion` | `A = ℤ_p ⋉ ℚ_p/ℤ_p`, `I = (p)` | `pⁿT = T` so `A/pⁿ = ℤ/pⁿ`; Koszul tower `H^{−1} = T[pⁿ]`, `H⁰ = ℤ/pⁿ`, both surjective: `H^{−1}(C) = T_p(T) = ℤ_p`, `H⁰(C) = ℤ_p` | sound |
| 1.7 `IsCompletelyFlatModule` | `ℤ`, `ℤ_p`, `𝔽_p` over ℤ at `(p)` | `Tor₁^ℤ(ℤ, 𝔽_p) = 0`, `Tor₁^ℤ(ℤ_p, 𝔽_p) = 0`, `Tor₁^ℤ(𝔽_p, 𝔽_p) = 𝔽_p ≠ 0` | sound |
| 1.8 finite amplitude does not bound torsion | `∏_{n≥1} ℤ/pⁿ` over ℤ_p | `Tor₁(∏ℤ/pⁿ, 𝔽_p) = ∏𝔽_p ≠ 0`, so p-complete amplitude exactly `[−1,0]`, unbounded `p`-torsion | sound |
| 1.E.1 `PerfectLimitChecks.differential` | `[k[[t]] →t k[[t]]]`, `n ≥ 1` | `H^{−1}(K) = ker t = 0`; over `k[t]/(tⁿ)`, `ker t = (t^{n−1}) ≅ k ≠ 0` (n = 1: `t = 0`, kernel `k`) | sound |
| 1.M.1 `Hom_A(K, K/A)` for a complete DVR | `f(ϖ^{−n}) = b_n mod A` | `ϖ b_{n+1} − b_n ∈ A`, so `c = lim ϖⁿ b_n` exists and `f(x) = cx mod A`; `End(K/A) = A` | sound (and fails for non-complete `A`: `End = Â`) |
| S.1 stabilisation bound | `d_r : E_r^{pq} → E_r^{p+r,q−r+1}` | outgoing zero for `r > q+1`, incoming zero for `r > p` | `r > max(p, q+1)` sound |
| S.1 `n ≥ 1` necessary | only `A^{00} = ℤ` | both edge maps are identities, composite ≠ 0 | sound |
| 1.T.1 `limOne_exact` hypotheses | levelwise exact, `f` injective, `g` surjective | snake lemma on `0 → ∏A → ∏B → ∏C → 0` with the shifts | hypotheses are exactly those the sketch uses; sound |

**Headlines.** Statable and stated: Lazard (`flatModuleFilteredFree`), unbounded K-injective replacement (`moduleKInjectiveReplacement`), Mittag-Leffler ⇒ `lim¹ = 0` and the six-term exactness (`limOne_subsingleton_of_isMittagLeffler`, `limOne_exact`), the derived-completeness characterisations (`isDerivedComplete*`), complete flatness of flat modules, closure laws of perfect complexes. Statable but absent: Matlis biduality (R04). Not statable at the pins and correctly so: the cotangent complex and its universal property/transitivity/obstruction theory (no cotangent carrier), the derived powers, the spectral sequence of a double complex with its abutment (Mathlib's spectral object records pages only) — but the file states the derived tensor, limit and completion headlines through sorry'd functors instead of naming them in the docstring (R02).

**Not checked.** Locators into [Chenevier], [Roby], [BL22], [IllusieI]/[IllusieII], [NSW] and the Tau Ceti–independent parts of §§0.DP.1–0.DP.2, 0.K.1, 0.3–0.4, 0.8, 0.10, 0.13–0.15, 1.2, 1.4–1.5, 1.7, 1.E.0, 1.M.2 and S.1 were not opened against their texts this round (outside the seeded sample); their statements were only read for internal consistency in the table above.

## Not verifiable

- [IllusieCC] (LNM 239, Springer): behind a paywall; cited in §0.9 only alongside GR Prop 8.1.7, whose proof I read and which quotes the same II.1.2.6.2. Cited by locator alone.

## Source issues

- none
