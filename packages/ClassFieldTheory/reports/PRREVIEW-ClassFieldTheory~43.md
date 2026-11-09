# Review of ClassFieldTheory (pull request #617 at 911db42)

**Verdict:** needs changes

This is a full review: the folder changed by 178 lines since 066ccf5. Five of the seven previous findings are repaired:
- R01, the principal-ideal-theorem route;
- R04, the locator of the valuation comparison;
- R05, the *Needs:* line of the conductor–discriminant formula;
- R06, the consumers;
- R07, the classification sentences.

The gate failure and the missing merge order are not repaired; they are carried as R02 and R03. The full pass found three new findings:
- a P2 in the conductor–discriminant route;
- six padding declarations in `Suggested.lean`;
- four glue declarations missing from the principal-ideal-theorem *Needs:* line.

## R01 (P2) — Conductor–discriminant, step 4: the completion of the fixed field is equated with a fixed field of the completion, and no supplier gives this

**Location.** `TauCetiRoadmap/ClassFieldTheory/README.md` lines 975–977, step 4: "the conductor exponent of the fixed field of its kernel (…), which is the completion `M_w` of the fixed field `M` of `ker χ`". Steps 2–3 are at lines 969–974 and the *Needs:* line at 994–1014.

**Claim.**
- Step 4 equates two different fields.
  - `TauCeti.ClassFieldTheory.conductorExponent_fixedField_ker` is about an intermediate field of `L_w/K_v`.
  - Step 5's `IsAdmissibleModulus.conductorExponent_le_exponent` is about `adicCompletion M u`, for a prime `u` of `M`.
  - No layer, supplier section or pinned declaration identifies the two as `K_v`-algebras. The route states the identification as a given.
- Steps 2 and 3 also use two facts without naming them:
  - `D` is the Galois group of `L_w/K_v`;
  - `L_w/K_v` is abelian, which step 2's lemma requires as `[IsAbelianGalois K_v L_w]`.

The formula is true and owned here, and the identification is a short argument from pinned facts. What is missing is the step and its inputs, not an owner, so this is P2 rather than P1.

**Witness.**
- At the pin, `TauCeti/NumberTheory/NumberField/LocalGlobal/DecompositionGroup.lean` has `decompositionEquiv` (393), the scoped instance `isAbelianGalois_adicCompletion` (422), and `finrank_adicCompletion_fixedField` (358), which gives only the degree.
- No declaration relates `adicCompletion` of a subfield to `IntermediateField.fixedField` in `L_w`.
- Example: for `ℚ(i, √5)/ℚ` at `5`, `M = ℚ(√-5)` gives `M_u = ℚ₅(√-5)` but fixed field `ℚ₅(√5)`.

**Repair.**
1. At steps 2 and 3, name `IsDedekindDomain.HeightOneSpectrum.decompositionEquiv` and `IsDedekindDomain.HeightOneSpectrum.isAbelianGalois_adicCompletion`.
2. State step 4's identification as a step proved here:
   - The tower map `IsDedekindDomain.HeightOneSpectrum.completionAlgHom` (`TauCeti/NumberTheory/NumberField/LocalGlobal/Completion.lean`) embeds `M_u` in `L_w` over `K_v`.
   - Its image is fixed by `D ∩ ker χ`, by `decompositionHom_algebraMap` and continuity.
   - The image has degree `[D : D ∩ ker χ]` over `K_v` (`finrank_adicCompletion_fixedField`). So it is the fixed field of the image of `D ∩ ker χ` under `decompositionEquiv`.
   - Transport the conductor exponent along this `K_v`-isomorphism with `AlgEquiv.normGroup_eq` (`TauCeti/RingTheory/Norm/Equiv.lean`) and `conductorExponent_le_iff`.
3. Add all of these to the *Needs:* line.
4. Add the example as a Check. At `v = 5`, `g = 2` and `D = Gal(L/ℚ(i))`:
   - Step 1 gives `g · δ = 2 · 1 = 2`.
   - Step 3 gives `0 + 0 + 1 + 1 = 2` over the four characters.
   - Both equal the exponent of `5` in `𝔡 = 1 · 4 · 5 · 20 = 400 = 2⁴ · 5²`.
   - For `M = ℚ(√-5)`, the two fields of step 4 agree only through `√-1 ∈ ℚ₅`.

## R02 (P3) — The push gate still fails on files outside the pull request's declared folders

Carries over the previous R02.

**Location.** `git diff --stat origin/main...HEAD` lists files outside `TauCetiRoadmap/{ClassFieldTheory, IntegralLattices, QuadraticFormInvariants}`:
- `Completed/LocalFieldsRamification/{COMPLETION.md, README.md, Suggested.lean}`;
- `Completed/LocalGaloisGroups/{README.md, Suggested.lean}`.

**Claim.**
- The gate reads `outside-folder … FAIL`; every check inside the folder reads `0`.
- The pull request's title ("fix(LocalFieldsRamification): …") makes `LocalFieldsRamification` its subject, but the brief names only the three `TauCetiRoadmap/` folders as its own.
- Part of the `Completed/LocalGaloisGroups` edit is forced by this folder. `h2MuEquivZMod_mixed` now returns an equivalence rather than `Nonempty`, and `h2FpEquivZMod_of_mu` now takes `e : μ_p ≅ T` as data. So `Completed/LocalGaloisGroups/Suggested.lean` lines 321–326 and 485 changed.

**Witness.** gate.md: "outside-folder (4) – Completed/LocalFieldsRamification/COMPLETION.md, …/README.md, …/Suggested.lean, Completed/LocalGaloisGroups/README.md". My re-run lists the same four plus the five files of the two sibling folders.

**Repair.** A human decides whether the `Completed/` edits belong to this pull request:
- If they do, the brief lists those folders and the gate passes.
- If they do not, they move to a separate pull request that merges with this one.

Nothing in this folder changes.

## R03 (P3) — The merge order against #1215 and #1411 is still not stated

Carries over the previous R03.

**Location.** The description of the pull request. Its only merge-order sentence is "Revisions of roadmaps on main whose numbering this roadmap cites, which merge first: #1410".

**Claim.** Two open pull requests change this folder, conflict with this head, and state shared targets differently.
- #1215 states `cyclotomicCharacter_artinMap` as an open target with `sorry` (its `Suggested.lean` line 82). It also states the exponent form `count_relDiscr_eq_finsum_abelianConductor_exponent` (157) and `abelianConductor_eq_lcm` (171).
- #1411 states `algebraMap_vle_algebraMap_iff_of_finite_padic` (402) in place of `valuativeExtension_of_finite`. It also restates `isPrincipal_map_hilbertClassField` (688) and `relDiscr_eq_finprod_abelianConductor` (698).

**Witness.** overlaps.md: "#617 and #1215 conflict in … `TauCetiRoadmap/ClassFieldTheory/README.md`, `TauCetiRoadmap/ClassFieldTheory/Suggested.lean`", and the same for #1411. Both heads were read with `roadmaps show ClassFieldTheory --pr`.

**Repair.** In the merge-order paragraph of this pull request, say which of #617, #1215 and #1411 merges first for this folder. Each later one rebases and keeps one statement of each shared target. Test: the description names both pull requests and the order.

## R04 (P3) — Six declarations of `Suggested.lean` are padding: no consumer uses them in Lean code

**Location.**
- `TauCetiRoadmap/ClassFieldTheory/Suggested.lean`: lines 78 and 93 (the two `TateCohomology` theorems), 191 (`tateDual`), 199 (`muNRepToTateDual`), 304 (`normResidue`) and 310 (`artinMap_norm`).
- README §6, lines 1243–1254: "cite the following names as this roadmap's, in their statements, proofs or docstrings".

**Claim.**
- Each of the six abbreviates one Tau Ceti declaration or closes with it in one term.
- Among consumers:
  - `Completed/LocalGaloisGroups/Suggested.lean` names five of them only in docstrings;
  - `GlobalQuadraticForms` does not name them at all;
  - `tateDual` occurs only in the type of `muNRepToTateDual`.
- Lean does not elaborate docstrings, so deleting the six breaks no build.
- §6 already retires names that only prose cites (the LocalGaloisGroups README list) and maps them old → new. A docstring is prose.
- The previous review counted docstring citations as uses. This review does not, because deleting the names breaks no build.

**Witness.** Outside comments, the LocalGaloisGroups Lean file uses each of the six 0 times. Its docstrings cite them at lines 45, 368, 1602, 1624, 1646 and 1820, for example line 1646: "(`ClassFieldTheory.TateCohomology.projective_ker_of_isZero_res`)".

**Repair.**
1. Delete the six from `Suggested.lean` and from the §6 table.
2. Add them to "Earlier identifiers, old → new":
   - `TateCohomology.projective_ker_of_isZero_res` → `Rep.projective_ker_of_isZero_res`;
   - `TateCohomology.primaryComponent_tateCohomology_eq_bot` → `TauCeti.TateCohomology.primaryComponent_tateCohomology_eq_bot`;
   - `tateDual`, `muNRepToTateDual`, `normResidue` and `artinMap_norm` → their `TauCeti.ClassFieldTheory.` namesakes.
3. Qualify the README's own mentions at lines 321–322, 533, 545, 623, 629, 650, 658 and 683. Otherwise the gate's `readme-ids-missing` check fails on the bare names.
4. Reword lines 1251–1254 so that only the three Hilbert invariants remain as type-only names.

Test: both consumer files still elaborate, since neither uses the six names outside docstrings.

## R05 (P3) — The principal-ideal-theorem *Needs:* line omits four declarations that steps 4 and 5 use

**Location.** README lines 878–884 (step 4: "is the class of `x_H` in the level `C_H`, both being the class of the same idele of `Kˢ`") and lines 895–900 (step 5). The *Needs:* line is at 905–938.

**Claim.** The identity in step 4 and the order comparison in step 5 do not close with the declarations listed. Four more are needed:
- `TauCeti.ClassFieldTheory.LayerRestriction.groundInclusion_apply_coe`: the ground inclusion is the inclusion of levels.
- `TauCeti.ClassFieldTheory.ideleCoeffOfIntermediateField_coe`: `globalGroundEquiv_mk` is stated through `ideleCoeffOf K ⊥`.
- `TauCeti.GlobalNumberFields.ideleExtension_comp`: it is also stated through `ideleExtension K ⊥`, and `ideleCoeffOfIntermediateField_ideleExtension` goes through the bottom field.
- Mathlib's `Ideal.ramificationIdx'_eq_ramificationIdx`: `valued_adicCompletionExtension` gives the order through `ramificationIdx'`, while `Ideal.map_algebraMap_eq_finsetProd_pow` uses `Ideal.ramificationIdx`.

**Witness.** `TauCeti/NumberTheory/ClassFieldTheory/Global/IdeleClass/Level.lean:227` states `globalGroundEquiv_mk` with `ideleCoeffOf K ⊥ (… ideleExtension K ⊥ a)`. `TauCeti/RingTheory/DedekindDomain/AdicCompletionExtension.lean:376` gives `Valued.v x ^ v.asIdeal.ramificationIdx' w.asIdeal`.

**Repair.** Add the four declarations to the *Needs:* line with their files:
- `…/ClassFieldTheory/Formation/Restriction.lean` (411);
- `…/ClassFieldTheory/Global/Coefficients.lean` (574);
- `…/NumberField/Global/Ideles/Extension.lean` (77);
- `Mathlib/RingTheory/RamificationInertia/Ramification.lean` (253).

Test: rewriting with `globalGroundEquiv_mk`, then `ideleCoeffOfIntermediateField_coe`, then `ideleExtension_comp`, then `ideleCoeffOfIntermediateField_ideleExtension` at `F = ⊥`, and comparing with `ideleClassLevelEquiv_mk`, puts both sides in the form `ideleClassMk K (ideleCoeffOfIntermediateField K H (ofMul x_H))`.

## Previous findings

- **R01** (principal-ideal-theorem step 4): **repaired**. Steps 4 and 5 now read the conclusion through norm groups and fractional ideals of `H`: "the route uses only the global class formation of `K` and needs no comparison between it and the global class formation of `H`" (lines 857–860).
  - Every declaration named there is at the cited file (list below).
  - The route closes, apart from the glue in R05.
- **R02** (gate `outside-folder`): **not repaired**. Carried as R02.
- **R03** (no order against #1215 and #1411): **not repaired**. The description is unchanged. Carried as R03.
- **R04** (no locator for the valuation comparison): **repaired**. README lines 563–564 and the docstring at `Suggested.lean` lines 214–216 now read "(Milne, *Algebraic Number Theory*, v3.08, Proposition 7.31, p. 120: a simple root modulo the uniformizer lifts)".
  - milne-ant line 5295 is on PDF page 122, printed p. 120.
  - There, Proposition 7.31 states that a simple root modulo the uniformizer of a complete discrete valuation ring lifts uniquely, which is the use made of it.
- **R05** (conductor–discriminant *Needs:*): **repaired**. Lines 996–1002 now list:
  - `differentExponent_adicCompletion_eq_multiplicity_differentIdeal` and `multiplicity_differentIdeal_adicCompletionIntegers_eq_multiplicity_asIdeal`, at `…/Different/Exponent.lean:198` and `:220`;
  - `finrank_residueField_adicCompletion`, at `…/AdicValuation/InertiaDegree.lean:78`;
  - `discriminantExponent_eq_inertiaDegree_mul_differentExponent`, at `…/LocalField/Discriminant/Basic.lean:162`.

  The new `ℚ(ζ₁₅)` Check is correct (table).
- **R06** (consumers): **repaired**.
  - Lines 1229–1232 add `AnalyticNumberTheoryPartI` with Layers 7, 11 and 13. That README's lines 1336, 1429 and 1747 cite those layers.
  - Lines 1233–1235 give IntegralLattices Layers 13 and 14 with `hilbertProductFormula`.
- **R07** (classification sentences): **repaired**.
  - Lines 1245–1246 read "a Tau Ceti or Mathlib declaration (`H` is Mathlib's `continuousCohomology` and `principalIdele` is Mathlib's `NumberField.IdeleGroup.unitEmbedding`)".
  - Lines 1272–1273 give the `restrictAbsolute` exception.
  - `Suggested.lean` lines 52–53 match.

## Verified sound

**Gate, dependency check and elaboration.**
- Gate re-run (`gate … --base origin/main`): every check inside the folder reads `0`, including:
  - `statement-hygiene`, `stray-files`, `imports`, `sorry-data` and `readme-ids-missing`;
  - `depcheck` and `metadata` (`topic = "math.NT"`).

  `outside-folder` lists 9 files: the four of R02 and the five of the two sibling folders. The worker's targeted build reports `build=0`.
- Dependency check (`--movable`): `depcheck: 235 roadmaps, 2260 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- `lake env lean TauCetiRoadmap/ClassFieldTheory/Suggested.lean` gives three `declaration uses 'sorry'` warnings, at lines 218, 426 and 435, and nothing else.
- `TauCetiRoadmap/GlobalQuadraticForms/Suggested.lean`, which imports this module, gives `sorry` warnings only.

**Signatures.** In a scratch copy I ran `#check @` on the 16 theorems and definitions of `Suggested.lean` that are not plain abbreviations, and on 44 Tau Ceti and Mathlib declarations that the routes cite.
- Every elaborated type matches its README statement, and no section binder is lost:
  - `isPrincipal_map_hilbertClassField` binds `K` and `I` only;
  - `relDiscr_eq_finprod_abelianConductor` carries `[IsAbelianGalois K L]`, the predicate `IsCyclic Gal(↥M/K)` and the exponent `(finrank K ↥M).totient`;
  - `valuativeExtension_of_finite` binds `K : Type u_1` and `F : Type u_2`.
- `signatures.md` lists a spurious declaration `closed` at line 54. It is the word "closed" in the module docstring, not a declaration.

I changed nothing in the folder.

**Padding probe.** I replaced each `sorry` with `first | infer_instance | rfl | simp | exact?`. On all three, `exact?` could not close the goal (lines 226, 436, 452 of the probe), so the three open targets are not padding.

The other theorems are kept for consumers. R04 lists the six that no consumer uses in code. Code uses by consumers, outside comments:
- `Completed/LocalGaloisGroups/Suggested.lean`:
  - `GalRep` 2, `H` 2, `muNRep` 8, `muNRepEquivZMod` 3, `muNRep_ρ_eq_self` 2;
  - `kummerEquiv_mixed`, `h2MuEquivZMod_mixed`, `h2FpEquivZMod_of_mu`, `kummerCupPairing` and `kummerCupPairing_bil` 1 each;
  - `absoluteGaloisGroupExtend` 1, `scd_p_absoluteGaloisGroup_eq_two` 1, `artinMap` 5;
  - the three cyclotomic theorems 1 each.
- `TauCetiRoadmap/GlobalQuadraticForms/Suggested.lean` uses its ten idele, norm and Hilbert names.

**Names resolved.** Every backticked Lean name of the README resolves at the pins:
- 399,095 declarations indexed from the Tau Ceti and Mathlib `.ilean` files;
- 13 names in modules without object files, checked by source and namespace, among them:
  - `Local/Quadratic.lean:57,87`;
  - `Global/Cyclotomic/Prime.lean:42,71` and `Gaussian.lean:45`;
  - `Global/Brauer/Exactness.lean:98`;
  - `ClassFields/CyclotomicLevel.lean:72,83`;
  - `Global/QuadraticReciprocity.lean:185`;
  - `LocalField/Norm/Unramified/Quotient.lean:83`;
  - `TateCohomology/Cup/TateNakayama.lean:360`;
  - the `ClassFormation` fields at `Formation/ClassFormation.lean:106`.

**Principal-ideal-theorem route, declarations at the pin.**
- `globalGroundEquiv` and `globalGroundEquiv_mk`: `Global/IdeleClass/Level.lean:216, 227`. `ideleClassLevelEquiv_mk`: same file, line 162.
- `ideleCoeffOfIntermediateField_ideleExtension`: `Global/Coefficients.lean:556`.
- `NormalLayer.ideleClassLevelEquiv_mem_normSubgroup_iff`: `Global/IdeleClass/Norm.lean:335`.
- `range_ideleClassNormMap_rayClassField`: `ClassFields/RayClassField.lean:148`. `hilbertClassField`: line 241, an `abbrev` of `rayClassField (Modulus.one K)`. `fieldRange_le_hilbertClassField_iff`: line 362.
- `ideleExtension` and `ideleFiniteCoord_ideleExtension`: `Ideles/Extension.lean:41, 100`.
- `range_ideleClassNormMap_eq_of_algEquiv`: `Ideles/Norm/Relative.lean:286`.
- `ker_rayClassQuotient` and `rayClassQuotient_mk_of_mem`: `Ideles/Ray/ClassQuotient.lean:316, 223`.
- `ideleCongrOneSubgroup_one`: `Ideles/Congruence.lean:160`. `oneEquivClassGroup_rayClassMk`: `RayClass/Basic.lean:327`. `NumberField.IdeleGroup.ofFiniteIdele`: `Ideles/Basic.lean:103`.
- `toFractionalIdeal_surjective` and `count_coe_toFractionalIdeal`: `FiniteAdeleRing/ClassGroup.lean:212, 191`.
- `valued_adicCompletionExtension`: `AdicCompletionExtension.lean:376`.
- `ClassFormation.groundInclusion_mem_normSubgroup_of_range_eq_commutator`: `Formation/PrincipalIdeal.lean:67`.
- Mathlib: `IsSepClosed.lift` (`FieldTheory/IsSepClosed.lean:293`), `Ideal.map_algebraMap_eq_finsetProd_pow` (`RingTheory/DedekindDomain/Factorization.lean:829`) and `ClassGroup.mk0_eq_one_iff` (`RingTheory/ClassGroup/Basic.lean:400`).

**Seeded sample.**
- *Definitions on Tau Ceti's carriers*:
  - `kummerEquivOfCharZero`, `kummerEquivOfCharZero_ofMul_mk` and `kummerClass_eq_muNRepH1Equiv_kummerCocycleClass` are at `MuNRep.lean:358, 371, 300`.
  - `h2MuEquivZMod`, `toRatAddCircle_h2MuEquivZMod` and `h2EquivZModOfMuNRepIso` are at `Brauer/RootsOfUnity.lean:89, 103, 156`.
  - `kummerCupPairing` and `kummerCupPairing_bil` are at `Local/Symbol.lean:207, 257`.
  - Each of the four definitions has three Checks, recomputed in the table.
  - The README's generality matches the Lean binders: `kummerEquiv_mixed` has no local-field instance; the other three carry `IsNonarchimedeanLocalField F`.
- *The local symbol and the Hilbert pairing*: `localSymbol` and `localSymbol_apply` are at `Local/Symbol.lean:320, 327`. `muNRepToTateDual`, `bijective_muNRepToTateDual` and `tateDualityPairing_muNRepToTateDual` are at `Local/Duality/RootsOfUnity.lean:61, 72, 120`.
- *Open target: the comparison of valuations*:
  - The locator is milne-ant line 5295, printed p. 120, Proposition 7.31. Its hypothesis, a complete discrete valuation ring, holds for `𝒪[K]`.
  - The *Needs:* inputs are at the pins: `TauCeti.normalizedValuation` (`LocalField/NormalizedValuation.lean:114`) and `TauCeti.henselianLocalRing_integer` (`LocalField/Henselian.lean:41`).
  - Every step of the route is recomputed in the table.
- *Restriction to a finite Galois extension*: `AlgHom.restrictNormalHom` and `AlgHom.restrictNormalHom_commutes` are at `FieldTheory/Galois/Restriction.lean:73, 80`, `TauCeti.absoluteGaloisGroupRestrictEquiv` at `…/AbsoluteGaloisGroup/Basic.lean:340`, and `artinMap_restrict` at `Local/ArtinMap.lean:132`.
- *The cyclotomic normalization for every finite `F/ℚ_p`*:
  - Milne CFT VII Example 8.2 is at milne-cft line 10059, printed p. 221. Line 10072 gives `[p^s]` and line 10075 gives `[u⁻¹]` at `l`, as the README says.
  - `localCyclotomicCharacter_artinMap_unit` (`…/ExplicitCyclotomicSymbol/ArtinMap.lean:311`) carries `[ValuativeExtension ℚ_[p] F]`, which `valuativeExtension_of_finite` discharges.
- *Open targets* (Layer 13):
  - V Theorem 3.17 is at milne-cft line 7252, printed p. 161, and the reduction (a)/(b) at lines 7303–7322, pp. 162–163.
  - V Theorem 3.27 is at line 7423 and Remark 3.28 at line 7436, both printed p. 165. The theorem uses the finite parts of the conductors, and the remark gives the conductor of a character as that of the fixed field of its kernel, as stated.
  - The conductor–discriminant declarations are at the pin: `finsum_artinConductorExponent_eq_discriminantExponent` and `conductorExponent_fixedField_ker` (`Local/Conductor/UpperNumbering.lean:130`), the admissible-modulus trio at `AdmissibleModulus/Basic.lean:193, 200, 208`, and `conductorExponent_le_exponent` at `Ramification.lean:116`.
- *Other locators*:
  - milne-cft: II Theorem 3.11 at line 3911 (p. 84) and Remark 3.12 at 3988 (p. 85); V Theorem 3.6 at 7051 (p. 158) and Example 3.9 at 7092 (p. 159); VII Theorem 8.1 at 10042 (p. 221); VIII Theorem 4.2 at 10937 (p. 241).
  - milne-adt: I Corollary 2.3 at line 1138 (p. 28) and Theorem 2.8 at 1227 (p. 31).
  - kopp-lagarias: Theorem 1.1 at line 128 (p. 3), Theorems 1.2 and 1.3 at 160 and 174 (p. 4).
  - jahnke-koenigsmann: Theorem 2.1 at line 113 (p. 3).
- The README flags no locator as unverified.

**Duplication and ownership.**
- None of the three open targets is at the pins:
  - The only `ValuativeExtension` instances are Mathlib's `K → Completion K` and Tau Ceti's worked examples over `ℚ_2` and `ℚ_3`.
  - Tau Ceti's principal ideal theorem is the class-formation form only.
  - No Tau Ceti theorem relates `relDiscr` to `abelianConductor`.
- `roadmaps grep` over main and the 457 open heads:
  - ArithmeticGaloisRepresentations §3.5 has the local Artin-representation form only.
  - AnalyticNumberTheoryPartI cites this roadmap's Layer 13.
  - ArithmeticGaloisDuality uses the group-theoretic theorem.
  - #1215 and #1411 are R03.
- Cross-roadmap citations:
  - GlobalNumberFields Layers 2, 4, 6, 7, 8 and 11 match the §3 rows (`Completed/GlobalNumberFields/README.md` lines 279, 418, 439, 459, 476, 571).
  - LocalFieldsRamificationPartII §4.1 is at its board README line 995 and is named only as the owner of excluded material.

**Adversarial table.**

| Statement | Instances tried | Values on each side | Result |
|---|---|---|---|
| `valuativeExtension_of_finite` | `K = ℚ₂`, `F = ℚ₂(i)` | `w(2) = 2`, `v(2) = 1`; `2 <ᵥ 1` on both sides, `1 ≤ᵥ 2` on neither | holds; normalized valuations differ, as stated |
| same, units step | `ℚ₂`, `u = -3`, `ℓ = 3`, `q = 2` | `f = X^{3^k} + 3`: `f(1) = 4 ≡ 0 mod 2`, `f'(1) = 3^k` a unit ⇒ root ⇒ `3^k ∣ w(-3)` for all `k` ⇒ `w(-3) = 0` | holds |
| same, units step | `ℚ₃`, `u = 2`, `ℓ = 2`, `k = 2` | `X⁴ - 4`: `f(1) = -3 ≡ 0`, `f'(1) = 4` a unit; root `√-2` (`-2 ≡ 1 mod 3`), `(√-2)⁴ = 4` | Proposition 7.31 applies |
| same, `ℓ = p` | `ℚ₂`, `u = 3`, `ℓ = 2` | `X² - 3`: `f'(1) = 2` not a unit; `3 ≢ 1 mod 8`, not a square | the route needs `ℓ ≠ p`, as stated |
| same, inseparable | `𝔽_p((t))`, `t ↦ t^p` | degree `p`; `w(t^p) = p > 0` | holds without separability |
| same, uniformizer step | `ϖ = (1 + ϖ) - 1` | `w(1 + ϖ) = 0 = w(1)` ⇒ `w(ϖ) ≥ 0`; `w(ϖ) = 0` ⇒ `αⁿ` or `c₀` dominates ⇒ `w = 0` on `Fˣ` | contradicts nontriviality; closes |
| `eulerCharacteristic_mixed` | `ℚ_p, ℤ/p` (`p` odd); `ℚ₂, ℤ/2`; `ℚ_p, ℤ/ℓ` with `ℓ ∤ p(p-1)` | `p² = p·1·p`; `8 = 2·2·2`; `ℓ = ℓ·1·1` | equal |
| same, nontrivial action | `ℚ₂`, `ℤ/3` with Frobenius `-1`, so `≅ μ₃` | `#H⁰ = 1`, `#H² = 3`, `#H¹ = #ℚ₂ˣ/ℚ₂ˣ³ = 3 = 1·3·2⁰` | equal |
| `eulerCharacteristic_finrank_fp` | `ℚ₂, 𝔽₂`; `ℚ₃, 𝔽₃` | `3 = 1 + 1 + 1`; `μ₃ ⊄ ℚ₃` ⇒ `2 = 1 + 0 + 1` | equal |
| `cyclotomicCharacter_artinMap` | `ℚ₂`, `u = -3` on `μ₁₆`; `ℚ₂(i)`, `u = i` | `13⁻¹ ≡ 5 mod 16` (`13·5 = 65`), not `13`; `N(i) = 1` | arithmetic convention; holds |
| `kummerEquiv_mixed` | `ℚ₂, n = 2`; `-7`; `ℚ₃, n = 2, 1` | `8` classes (`-1, 2, 5`); `-7 ≡ 1 mod 8` is a square; `4`; `1` | agrees |
| `h2MuEquivZMod_mixed` | `ℚ₂, n = 1, 2, 3`; `ℚ₇, n = 3` | orders `1, 2, 3`; invariant `1/3 ↦ 1`, the other equivalence `↦ 2` | the invariant fixes the map |
| `h2FpEquivZMod_of_mu` | `T = 0`; `p = 3`, `e ∘ inv` | `#μ₃ = 3 ≠ 1` ⇒ no `e`; `H²(inv) = -1` ⇒ negated | `e` is data |
| `kummerCupPairing` | `n = 2, ζ = -1`; `ℚ₇`, `ζ` versus `ζ²` | `(-1,-1) ↦ -1` (`1·1`), the zero pairing gives `1`; `(ζ²)² = ζ` ⇒ `(ζ, ζ) ↦ ζ²` | the root is data |
| local symbol | `ℚ₂`, `(-1,-1)`, `(5,-1)` | `(-1,-1)₂ = -1 ↦ 1`; `5 = 1² + 2² ↦ 0` | agrees with the Hilbert symbol |
| restriction along `iota` | splitting field of `X³ - 2` | `σ` fixes `∛2` ⇒ `s` fixes `∛2`; along `iota ∘ τ`: `τ⁻¹ s τ` fixes `τ⁻¹(∛2) ≠ ∛2` | the embedding is data |
| `isPrincipal_map_hilbertClassField` | `ℚ(√-5)`, `H = ℚ(√-5, i)`; `K = ℚ`; `I = ⊥` | `𝔭₂² = (2)`, `(1+i)² = (2i)` ⇒ `(1+i)`; `𝔭₂𝔭₃ = (1+√-5)` ⇒ `𝔭₃𝓞_H = ((1+√-5)/(1+i))`; `ℤ` is a PID; `⊥` is principal | holds |
| same, steps 1–2 | `ℚ(√-5)` | `h(H) = 1` ⇒ `H' = H`; `Gal(H'/K) = C₂`, commutator `1 = Gal(H'/H)` | consistent |
| same, steps 4–5 | `ℚ(√-5)` at `𝔭₂` | `N(C_{H'}) = C_H`; `2 = 𝔭₂²` in `K` and `(2) = 𝔓²` in `H` ⇒ `e(𝔓 ∣ 𝔭₂) = 1`; `N(1+i) = 4 = 2^f` | fractional ideal of `x_H` is `(1+i) = 𝔭₂𝓞_H` |
| same, step 5 Check | `ℚ(i)/ℚ` at `2` | order `1 ↦ e = 2`; `(1+i)² = (2)` up to a unit | `e` is needed, as stated |
| `relDiscr_eq_finprod_abelianConductor` | `ℚ(ζ₅)`; `ℚ(ζ₈)`; `L = K` | `1·5·5² = 125 = 5³`; `1·4·8·8 = 256 = 2⁸`; `⊤ = ⊤^{φ(1)}` (`abelianConductor_self`) | equal |
| same, `ℚ(ζ₁₅)` | 8 characters `χ₃^a χ₅^b` | `a = 1` for 4 ⇒ `3⁴`; `b ≠ 0` for 6 ⇒ `5⁶`; discriminant `15⁸/(3⁴·5²) = 3⁴·5⁶` | equal |
| same, step 1 Check | `ℚ(ζ₁₅)` at `5` | `e = 4`, `f = 2`, `g = 1`; `f·d = 2·3 = 6`; without `f`, `3` | the Check is correct |
| same, non-cyclic `M` | `M = ℚ(ζ₈)`, `φ(4) = 2` | including it would multiply by `8² = 64` | the `IsCyclic` predicate is needed and present |
| same, steps 2–4 (R01) | `ℚ(i, √5)/ℚ` at `5` | `g·δ = 2·1`; `χ|_D` exponents `0, 0, 1, 1` ⇒ `2`; `𝔡 = 400 = 2⁴·5²`; `M = ℚ(√-5)`: `M_u = ℚ₅(√-5)`, fixed field `ℚ₅(√5)` | formula holds; identification unsupplied |
| Layer 13, Hasse norm | `25` in `ℚ(√13, √17)` | at `2`: `ℚ₂(√13) = ℚ₂(√5)` unramified, `v = 0`; at `5`: unramified, `v = 2`; `17 ≡ 2² mod 13`; `13 ≡ 8² mod 17`; `25 > 0` | local norm everywhere; known global non-norm |
| Layer 10, lift obstruction | the same field | every `|D_v| ≤ 2` ⇒ `2·H²(G, I_L) = 0`; `H²(G, C_L) ≅ ℤ/4` | as stated |
| Layer 12, `D₄` | two distinct `D₄` fields over one biquadratic `B` | `G = D₄ ×_{V₄} D₄` of order `16`; one alternating form on `V₄` ⇒ `G' = ⟨(z, z)⟩`, `|G^ab| = 8 > 4` | as stated |
| §5.6, transfer | `C₄ ⊃ ⟨g²⟩`; `V₄ ⊃ C₂` | `V(g) = g² ≠ 1`; `V(g) = g² = 1` | as stated |
| §2.3 | `[U:V] = 4`, `[U:U'] = 2`, `[V:V'] = 3` | `inv(cor u_{U',V}) = 1/2 = 2·(1/4)`; `inv(inf u_{U,V}) = 1/4 = 3·(1/12)` | as stated |
| Layer 14 | `(3, 7)`, `(-1, -1)` over `ℚ` | `0, 1, 0, 1` at `∞, 2, 3, 7` (`(3/7) = -1`), sum `0`; `1` at `2` and `∞` | sums vanish |
| narrow versus wide Hilbert | `ℚ(√3)` | `2 - √3 > 0` ⇒ `2 + √3` totally positive; `±√3(2+√3)^k` never is; `3` inert in `ℚ(i)` ⇒ `(√3)` inert; `disc ℚ(ζ₁₂) = 144 = 12²` | as stated |
| Layer 13, orders | `ℤ[√-3]` (`f = 2`); `ℤ[2i]` | `h = (2/3)(1 + 1/2) = 1`; `h = (2/2)·1 = 1` | `Pic` trivial |

## Not verifiable

- These are cited by locator only, as the manifest settles them:
  - Artin–Tate, *Class Field Theory* (waived);
  - Serre, *Local Fields*; Neukirch, *Algebraic Number Theory*; NSW, *Cohomology of Number Fields*; Engler–Prestel, *Valued Fields* (uncertified).
- These §8 background citations have no manifest entry, and I did not read them: Serre, *Galois Cohomology* II §5; Brown, *Cohomology of Groups* VI §8; Rim 1959; Lang, *Algebra* III 7.1; Cox §§7 and 9; Weil 1951; Tate, Corvallis; Tate 1952; Nakayama 1957.
- I did not elaborate `Completed/LocalGaloisGroups/Suggested.lean`. It imports `TauCetiRoadmap.ProfiniteCohomology.Suggested`, which has no object file here, and the brief allows building only `TauCeti.*` modules. Its uses of this file's names were checked textually (above).

## Source issues

- none
