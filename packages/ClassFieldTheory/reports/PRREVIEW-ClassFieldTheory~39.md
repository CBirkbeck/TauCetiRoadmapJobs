# Review of ClassFieldTheory (pull request #617 at 066ccf5)

**Verdict:** needs changes

This is a full review: the folder changed by 421 lines since 2670a4e. Three of the five previous findings are repaired (R03 Tau Ceti paths, R04 unused re-exports, R05 universe claim). The gate failure and the missing merge order are not repaired and are carried as R02 and R03 below. The full pass also found one P1, in the proof route of the principal ideal theorem, and four new P3s.

## R01 (P1) — Step 4 of the principal-ideal-theorem route needs a comparison of two class formations that nobody owns

**Location.** `TauCetiRoadmap/ClassFieldTheory/README.md` lines 863–869 (Layer 13, step 4): "the class in `Cl(H)` of the extended ideal `𝔞𝓞_H` corresponds, under the Artin isomorphism of `H`, to the transfer of the Artin symbol in `Gal(H/K)`". The *Needs:* line is at lines 871–878.

**Claim.** Step 3 applies `artinMap_groundInclusion` inside `globalClassFormation K`, to the layer `G_{H'} ◁ G_H` of `AbsoluteGaloisGroup K`. Step 4 reads the class of `𝔞𝓞_H` through `hilbertClassArtinEquiv` of `H`. That isomorphism is built from `globalClassFormation H`, on `AbsoluteGaloisGroup H`:
- `hilbertClassArtinEquiv` → `rayClassArtinEquiv` → `rayClassArtinMap` → `ideleClassArtinMap` → `globalArtinMap`.

For "the transfer vanishes" to give "the class of `𝔞𝓞_H` is trivial", the route needs a statement that the Artin map of `K`'s formation on a layer with ground `G_H` equals `H`'s own Artin map. That statement is a global analogue of Layer 6's local restriction comparison. No layer states it, the *Needs:* line does not list it, and Tau Ceti does not have it.

**Witness.** At the pin, the theorems about the global Artin map are all for a fixed ground field: `globalArtinMap_comp`, `globalArtinMap_local`, `globalArtinMap_ideal`, `ker_ideleClassArtinMap`, `rayClassArtinMap_*` and the rest. `globalArtinMap_comp` (`…/ClassFieldTheory/Global/Reciprocity.lean:227`) changes only the top field. No theorem relates `globalClassFormation K` to `globalClassFormation H`.

**Repair.** Route step 4 through norm groups, which needs no comparison of Artin maps. Every input except one is at the pin:
1. Start from step 3: the ground inclusion of the class `c` of an idele attached to `𝔞` lies in the norm subgroup of the layer.
2. By `TauCeti.ClassFieldTheory.NormalLayer.ideleClassLevelEquiv_mem_normSubgroup_iff` (`…/Global/IdeleClass/Norm.lean:335`), the image of `c` in `C_H` lies in the range of `ideleClassNormMap H H'`. That image is the class of `ideleExtension K H a` (`ideleClassLevelEquiv_mk`, `ideleCoeffOf_ideleExtension`).
3. Identify that range with the ray subgroup of the trivial modulus of `H`: `range_ideleClassNormMap_rayClassField` (`ClassFields/RayClassField.lean:148`), transported along `H' ≃ₐ[H] hilbertClassField H` by `TauCeti.GlobalNumberFields.range_ideleClassNormMap_eq_of_algEquiv` (`…/Ideles/Norm/Relative.lean:286`).
4. By `rayClassQuotient_mk_of_mem` and `ker_rayClassQuotient`, the ray class of the image is trivial.
5. That ray class is the class of `𝔞𝓞_H`. This is the one input not at the pin: state it as a step proved here, that the fractional ideal of `ideleExtension K H a` is the extension of the fractional ideal of `a`, from `ideleFiniteCoord_ideleExtension` (`TauCeti/NumberTheory/NumberField/Global/Ideles/Extension.lean:100`).

List all of these in the *Needs:* line. If the Artin-square wording is kept instead, add the formation comparison as a Layer 11 target with its own route. Test on `K = ℚ(√−5)`: `H = ℚ(√−5, i)` has class number 1, so `H' = H`, `N_{H'/H}(C_{H'}) = C_H`, and the norm route gives `𝔭₂𝓞_H = (1 + i)`, as the Check states.

## R02 (P3) — The push gate still fails on files outside the pull request's declared folders

Carries over the previous R01.

**Location.** `git diff --stat origin/main...HEAD` lists the following outside `TauCetiRoadmap/{ClassFieldTheory, IntegralLattices, QuadraticFormInvariants}`:
- `Completed/LocalFieldsRamification/{COMPLETION.md, README.md, Suggested.lean}`;
- `Completed/LocalGaloisGroups/{README.md, Suggested.lean}`.

**Claim.** The worker's gate at this head reads `outside-folder=4 … FAIL`, and every check inside the folder reads 0. The pull request's title and metadata make `LocalFieldsRamification` its subject. The brief names only `IntegralLattices` and `QuadraticFormInvariants` as its own.

**Witness.** gate.md: "outside-folder (4) – Completed/LocalFieldsRamification/COMPLETION.md, …/README.md, …/Suggested.lean, Completed/LocalGaloisGroups/README.md". My re-run lists the same four plus the five files of the two sibling folders.

**Repair.** A human decides whether the `Completed/` edits belong to this pull request. If they do, the brief lists those folders and the gate passes. If they do not, they move to a separate pull request. Nothing in this folder changes.

## R03 (P3) — The merge order against #1215 and #1411 is still not stated

Carries over the previous R02.

**Location.** The pull request's description. Its only merge-order sentence is "Revisions of roadmaps on main whose numbering this roadmap cites, which merge first: #1410".

**Claim.** Two open pull requests change this folder, conflict with this head and state the same open targets differently:
- #1215 (head 8f8c72c) states `cyclotomicCharacter_artinMap` as an open target with `sorry` (`Suggested.lean:81`). It also states `isPrincipal_map_hilbertClassField` (145), the exponent form `count_relDiscr_eq_finsum_abelianConductor_exponent` (156) and `abelianConductor_eq_lcm` (170).
- #1411 (head 37bd865) states `algebraMap_vle_algebraMap_iff_of_finite_padic` (401), the `K = ℚ_p` case of `valuativeExtension_of_finite`. It also states `isPrincipal_map_hilbertClassField` (684) and `relDiscr_eq_finprod_abelianConductor` (694).

**Witness.** overlaps.md: "#617 and #1215 conflict in … `TauCetiRoadmap/ClassFieldTheory/README.md`, `TauCetiRoadmap/ClassFieldTheory/Suggested.lean`", and the same for #1411. The latest review of #1215 (PRREVIEW-ClassFieldTheory~38) asks that #1215 merge first and that #617 and #1411 rebase on it.

**Repair.** In the merge-order paragraph of this pull request, say which of #617, #1215 and #1411 merges first for this folder. Each later one rebases and keeps one statement of each shared target. Test: the description names both pull requests and the order.

## R04 (P3) — The open target `valuativeExtension_of_finite` has no source locator

**Location.** README lines 549–578 ("Open target: the comparison of valuations") and `Suggested.lean` lines 206–220. The statement and the route cite no source; the only references nearby are to Tau Ceti and Mathlib declarations.

**Claim.** This is a target with a full route but no locator, either for the statement or for its decisive step. Lines 103–108 cite F. K. Schmidt's theorem (Jahnke–Koenigsmann Theorem 2.1, p. 3) only as excluded from scope.

**Witness.** The seeded sample asked for this passage's theorem number and page. There is none to check.

**Repair.** At the claim, add a locator for the step the route rests on. That step is that every unit of a nonarchimedean local field, raised to the power `q − 1`, is an `ℓ^k`-th power for every `k` and every prime `ℓ ≠ p`. It follows from `Kˣ ≅ ϖ^ℤ × μ_{q−1} × U^(1)` with `U^(1)` pro-`p`. Cite it at its theorem and page in Serre, *Local Fields*, or Neukirch, *Algebraic Number Theory*; both are settled in the manifest and may be cited by locator alone. Put the same locator in the docstring of `valuativeExtension_of_finite`.

## R05 (P3) — The conductor–discriminant *Needs:* line omits the completion of the different

**Location.** README lines 892–896 (step 1): "since the different of `L/K` completes to that of `L_w/K_v`, the exponent is `g · δ(L_w/K_v)`". The *Needs:* line is at lines 922–935.

**Claim.** Step 1 uses two facts that the *Needs:* line does not name:
- the comparison of the global different at `w` with the local different of `L_w/K_v`;
- the local formula `δ = f · d`.

Both are at the pin.

**Witness.**
- `IsDedekindDomain.HeightOneSpectrum.differentExponent_adicCompletion_eq_multiplicity_differentIdeal` and `…multiplicity_differentIdeal_adicCompletionIntegers_eq_multiplicity_asIdeal`, in `TauCeti/NumberTheory/NumberField/LocalGlobal/Different/Exponent.lean` lines 198 and 220.
- `TauCeti.discriminantExponent_eq_inertiaDegree_mul_differentExponent`, in `TauCeti/NumberTheory/LocalField/Discriminant/Basic.lean` line 162.

**Repair.** Add these three declarations, with their files, to the *Needs:* line. Test on `ℚ(ζ₅)/ℚ` at 5: `g = 1`, `f = 1` and `d = 3`, so `multiplicity_relDiscr` gives `3`, which equals `δ = 0 + 1 + 1 + 1`.

## R06 (P3) — §6 omits a consumer of the open conductor–discriminant target, and part of IntegralLattices' use

**Location.** README lines 1125–1149 (§6 *Downstream consumers*). Line 1144 reads "`IntegralLattices`: Layer 13, through Tau Ceti's `…ringClassField` and `…ringClassArtinEquiv`".

**Claim.** Two consumer entries are incomplete:
- `AnalyticNumberTheoryPartI`, which is on main, consumes Layers 7, 11 and 13, including this roadmap's open target `relDiscr_eq_finprod_abelianConductor`. §6 does not list it.
- `IntegralLattices` also consumes Layer 14.

**Witness.**
- `TauCetiRoadmap/AnalyticNumberTheoryPartI/README.md` line 111: "[Layer 13][R28] supplies conductor–discriminant". Its line 1757 uses the formula, and its line 2218 lists "ClassFieldTheory Layers 7, 11 and 13".
- `TauCetiRoadmap/IntegralLattices/README.md` lines 1010–1011 and 1159 consume `TauCeti.ClassFieldTheory.hilbertProductFormula`.

**Repair.** Add the bullet "`AnalyticNumberTheoryPartI`: Layers 7, 11 and 13 (`characterConductorExp`, global reciprocity with its conductors, the conductor–discriminant formula)". Change the IntegralLattices bullet to "Layers 13 and 14, through Tau Ceti's `ringClassField`, `ringClassArtinEquiv` and `hilbertProductFormula`".

## R07 (P3) — Two sentences classifying the kept and retired names are false

**Location.**
- README lines 1155–1156 and `Suggested.lean` lines 52–54: "each is an abbreviation of a Tau Ceti declaration, one of the four definitions of Layer 5 …, or a theorem closed by Tau Ceti's theorem".
- README lines 1179–1180: "each is the Tau Ceti declaration of the same short name".

**Claim.**
- `H` abbreviates Mathlib's `continuousCohomology` (`Suggested.lean:110`), and `principalIdele` abbreviates Mathlib's `NumberField.IdeleGroup.unitEmbedding` (`Suggested.lean:369`). Neither is a Tau Ceti declaration.
- `Completed/LocalGaloisGroups/README.md` line 178 cites `restrictAbsolute`, which has no Tau Ceti namesake. README line 1227 maps it to `AlgHom.restrictNormalHom iota` after `TauCeti.absoluteGaloisGroupRestrictEquiv K`.

**Witness.** The `#check` output for `H` and `principalIdele` (below), and a search of the Tau Ceti pin, which has no declaration named `restrictAbsolute`.

**Repair.**
- Change "a Tau Ceti declaration" to "a Tau Ceti or Mathlib declaration" in both places.
- Change the second sentence to "each is the Tau Ceti declaration of the same short name, except `restrictAbsolute`, which is `AlgHom.restrictNormalHom iota` after `TauCeti.absoluteGaloisGroupRestrictEquiv K`; all are listed below".

## Previous findings

- R01 (gate `outside-folder`): **not repaired**. The worker's gate at 066ccf5 still reads "outside-folder=4 … FAIL". Carried as R02.
- R02 (no order against #1215 and #1411): **not repaired**. The description still names only #1410, and both conflicts remain in overlaps.md. Carried as R03.
- R03 (Tau Ceti file paths): **repaired**. README lines 922–923 now read "`TauCeti.relDiscr` (`…/Discriminant/Basic.lean`), `TauCeti.multiplicity_relDiscr` (`…/Discriminant/Valuation.lean`)". Lines 929–932 put the three conductor declarations with `…/AdmissibleModulus/Basic.lean`. Checked at the pin: `relDiscr` at Basic.lean:33; `abelianConductor`, `isAdmissibleModulus_iff_abelianConductor_dvd` and `isAdmissibleModulus_abelianConductor` at AdmissibleModulus/Basic.lean:193, 200 and 208; `multiplicity_relDiscr` at Valuation.lean:52; `conductorExponent_le_exponent` at Ramification.lean:116.
- R04 (nine unused re-exports): **repaired**. The nine theorems and the seven declarations only they used are gone from `Suggested.lean`.
  - The §6 table now lists only names that a consumer's Lean file cites (checked below).
  - README lines 1200–1236 map all 16 retired names to Tau Ceti.
  - Lines 1175–1181 state that the LocalGaloisGroups README cites them in prose.
  - One sentence there is still inaccurate (R07).
- R05 (universe claim): **repaired**. `Suggested.lean` lines 56–59 now say the Layer 0 theorems and the valuation comparison are universe-polymorphic. `#check` confirms `{k G : Type u_1}` for the Layer 0 theorems, `K : Type u_1`, `F : Type u_2` for the comparison, and `Type` for the rest.

## Verified sound

**Gate, dependency check and elaboration.**
- Gate re-run: every check inside the folder reads 0, including `statement-hygiene`, `stray-files`, `imports`, `sorry-data` and `depcheck`. `outside-folder` lists 9 files: the four of R02 plus the five files of the two sibling folders.
- Dependency check (`--movable`): `depcheck: 235 roadmaps, 2260 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- `lake env lean TauCetiRoadmap/ClassFieldTheory/Suggested.lean`: three `declaration uses 'sorry'` warnings, at lines 216, 424 and 433, and nothing else.

**Signatures.** In a scratch copy I ran `#check @` on all 40 public declarations and on six Tau Ceti declarations they rest on. Each elaborated type matches its README statement, and no section binder is lost.
- `isPrincipal_map_hilbertClassField` binds only `K`.
- `relDiscr_eq_finprod_abelianConductor` has `[IsAbelianGalois K L]` and the `finprod` over `IsCyclic (M ≃ₐ[K] M)`.

I changed nothing in the folder.

**Padding probe.** I replaced each `sorry` with `first | infer_instance | simp | rfl | exact?` in a scratch copy. All three fail (`exact?` could not close the goal), so none of the three is padding. The remaining re-exports are kept because consumers cite them; the checks are under *Consumers* below.

**Duplication.** None of the three open targets exists at the pins:
- Tau Ceti's `algebraicExtensionValuation_isEquiv` and `algebraicExtensionValuativeRel_eq` (`LocalField/AlgebraicExtension/Basic.lean:254, 277`) assume `ValuativeExtension`. Mathlib's only instance is `ValuativeExtension K (Completion K)`.
- Tau Ceti has the principal ideal theorem only in class-formation form (`Formation/PrincipalIdeal.lean:67`).
- Tau Ceti has no global conductor–discriminant theorem: none of its uses of `relDiscr` mentions `abelianConductor`.

Other roadmaps relate to these targets as follows:
- `AnalyticNumberTheoryPartI` §2.2a has the Artin-conductor form and cites this roadmap's Layer 13 for the abelian form, so the dependency runs one way (R06).
- #1811 LocalAnabelianGeometry cites Layer 7's `cyclotomicCharacter_artinMap` and owns nothing here.
- #1215 and #1411 are R03.

**Consumers.**
- Code uses (outside comments) in `Completed/LocalGaloisGroups/Suggested.lean`: `GalRep`, `H`, `muNRep`, `muNRepEquivZMod`, `muNRep_ρ_eq_self`, `kummerEquiv_mixed`, `h2MuEquivZMod_mixed`, `h2FpEquivZMod_of_mu`, `kummerCupPairing(_bil)`, `absoluteGaloisGroupExtend`, `scd_p_absoluteGaloisGroup_eq_two`, `artinMap` and the three cyclotomic theorems.
- Docstring citations only, in the same file: `TateCohomology.projective_ker_of_isZero_res` (1646, 1820), `TateCohomology.primaryComponent_tateCohomology_eq_bot` (1624), `muNRepToTateDual` (45), `eulerCharacteristic_finrank_fp` (508), `artinMap_norm` (368) and `normResidue` (1602). This matches §6's "statements, proofs or docstrings".
- `TauCetiRoadmap/GlobalQuadraticForms/Suggested.lean` lines 55–92 use the ten idele, norm and Hilbert names.
- `tateDual` and the three Hilbert invariants are cited by no consumer, as §6 says.
- Every retired name that the LocalGaloisGroups README cites (line 178 and its table) is in the old → new list.

**Seeded sample.**
- *Definitions on Tau Ceti's carriers*:
  - `kummerEquivOfCharZero` and `kummerEquivOfCharZero_ofMul_mk` are at `MuNRep.lean:358, 371`; `kummerClass_eq_muNRepH1Equiv_kummerCocycleClass` at 300; `muNRepEquivZMod` at 409.
  - `h2MuEquivZMod`, `toRatAddCircle_h2MuEquivZMod` and `h2EquivZModOfMuNRepIso` are at `Brauer/RootsOfUnity.lean:89, 103, 156`.
  - `kummerCupPairing` and `kummerCupPairing_bil` are at `Local/Symbol.lean:207, 257`.
  - The four definitions each have three Checks, all recomputed (table).
- *The local symbol and the Hilbert pairing*: `localSymbol` and `localSymbol_apply` are at `Local/Symbol.lean:320, 327`. `muNRepToTateDual`, `bijective_muNRepToTateDual` and `tateDualityPairing_muNRepToTateDual` are at `Local/Duality/RootsOfUnity.lean:61, 72, 120`.
- *Open target: the comparison of valuations*: there is no source (R04).
  - Its *Needs:* inputs are at the pins: `normalizedValuation` (`LocalField/NormalizedValuation.lean:114`), the instance `henselianLocalRing_integer` (`LocalField/Henselian.lean:41`), and Mathlib's `instance : Finite 𝓀[K]` (`Mathlib/NumberTheory/LocalField/Basic.lean:142`).
  - The route is correct (table).
- *Restriction to a finite Galois extension*:
  - `AlgHom.restrictNormalHom` and `AlgHom.restrictNormalHom_commutes` are at `FieldTheory/Galois/Restriction.lean:73, 80`, and `absoluteGaloisGroupRestrictEquiv` at `…/AbsoluteGaloisGroup/Basic.lean:340`.
  - `artinMap_restrict` (`Local/ArtinMap.lean:132`) is stated as `ι.restrictNormalHom (absoluteGaloisGroupRestrictEquiv K σ)`, as the passage says.
- *The cyclotomic normalization for every finite `F/ℚ_p`*:
  - Milne CFT VII Example 8.2 is at milne-cft line 10059, PDF page 230 = printed 221, continuing to 222. Line 10072 gives `[p^s]` at `p ≠ ℓ` and line 10075 gives `[u⁻¹]` at `ℓ`, matching the README.
  - `localCyclotomicCharacter_artinMap_unit` is at `Local/ExplicitCyclotomicSymbol/ArtinMap.lean:311`, under `[ValuativeExtension ℚ_[p] F]` as stated.
- *Open targets* (Layer 13):
  - Milne CFT V Theorem 3.17 is at milne-cft line 7252, printed p. 161, and the route at lines 7299–7322, printed pp. 162–163, steps (a) and (b).
  - Theorem 3.27 is at line 7423 and Remark 3.28 at line 7436, printed p. 165: the discriminant is the product over characters of the finite conductors, and the conductor of a character is that of the fixed field of its kernel.
  - Every *Needs:* declaration is at the cited file. `groundInclusion_mem_normSubgroup_of_range_eq_commutator` is at `Formation/PrincipalIdeal.lean:67`. `hilbertClassField`, `hilbertClassArtinEquiv`, `hilbertClassArtinEquiv_mk` and `fieldRange_le_hilbertClassField_iff` are at `ClassFields/RayClassField.lean:241, 262, 277, 362`. `finsum_artinConductorExponent_eq_discriminantExponent` is at `LocalField/Discriminant/Conductor.lean:58`, and `conductorExponent_fixedField_ker` at `Local/Conductor/UpperNumbering.lean:130`.
- *Other locators*: Milne VII Theorem 8.1 is at line 10042 (p. 221). Milne ADT I Corollary 2.3 is at milne-adt line 1138 (printed p. 28) and Theorem 2.8 at line 1227 (printed p. 31). Jahnke–Koenigsmann Theorem 2.1 is at jahnke-koenigsmann line 113 (p. 3); its proof cites EP Theorem 4.4.1. Kopp–Lagarias Theorem 1.1 is at kopp-lagarias line 128 (p. 3), Theorems 1.2 and 1.3 at lines 160 and 174 (p. 4), and the ring class field is at lines 80 and 163.
- The README flags no locator as unverified.

**A Check proved in Lean.** The Layer 13 claim that one `simp` identifies the ring class field of the maximal order with the Hilbert class field elaborates without error in a scratch file:
- the goal is `ringClassField (maximalNumberFieldOrder K) = hilbertClassField K`;
- the `simp` set is `ringClassField`, `hilbertClassField`, `rayClassField`, `ringClassNormSubgroup`, `rayNormSubgroup` and `ker_ringClassIdeleQuotient_maximalNumberFieldOrder`.

**Cross-roadmap citations resolved.**
- `AnalyticNumberTheoryPartI`'s anchors R27, R28 and R29 resolve to this head's Layer 11, 13 and 7 headings.
- `QuadraticFormInvariants` at this head cites "Layers 5 and 14", matching §6, and its `Suggested.lean` no longer imports this module.
- `LocalFieldsRamificationPartII` §4.1 (Krasner, README line 106) exists in the board package as "4.1 The rank-one norm, Krasner's lemma and continuity of roots". It is named only as the owner of excluded material, not as a supplier.
- The retired names still cited elsewhere (`ClassFieldTheory.localSymbol`, `ClassFieldTheory.absoluteGaloisGroupComparison`) occur only in #1187's stale copies of `LocalGaloisGroups` and `QuadraticFormInvariants`. #1187 revises existing roadmaps, so it is not a consumer.

**Adversarial table.**

| Statement | Instances tried | Values on each side | Result / change |
|---|---|---|---|
| `valuativeExtension_of_finite` | `K = ℚ₂`, `F = ℚ₂(i)` | `w(2) = 2`, `v(2) = 1`; `2 ≤ᵥ 1` holds on both sides; `1 ≤ᵥ 2` holds on neither | holds; normalized valuations differ, as stated |
| same, route step for units | `u = −3 ∈ ℤ₂ˣ`, `q = 2`, `ℓ = 3` | `ℤ₂ˣ = {±1} × (1 + 4ℤ₂)`, cubing is bijective on both factors ⇒ `−3` is a `3^k`-th power ∀k ⇒ `3^k ∣ w(−3)` ∀k ⇒ `w(−3) = 0` | holds |
| same, `ℓ = p` | `u = 3`, `ℓ = 2` | `3 ≡ 3 mod 8`, not a square in `ℚ₂` | route needs `ℓ ≠ p`, as stated |
| same, inseparable | `K = F = 𝔽_p((t))`, `t ↦ t^p` | degree `p`; `w(t^p) = p > 0` | holds without separability |
| same, trivial relation on `F` | `1 ≤ᵥ ϖ` | true in `F`, false in `K` | excluded by `IsNonarchimedeanLocalField F` |
| same, `w(ϖ) = 0` branch | `α ∈ Fˣ` with `w(α) < 0` | `w(αⁿ) = n w(α) < w(c_i αⁱ)` for `i < n` | the sum cannot vanish; branch closes |
| `eulerCharacteristic_mixed` | `ℚ_p`, `ℤ/p`, `p` odd; `ℚ₂`, `ℤ/2`; `ℚ_p`, `ℤ/ℓ`, `ℓ ∤ p(p−1)` | `p² = p·1·p`; `8 = 2·2·2`; `ℓ = ℓ·1·1` | equal |
| same, nontrivial action | `ℚ₂`, `ℤ/3` with Frobenius `−1` | `≅ μ₃`; `#H⁰ = 1`, `#H²(μ₃) = #H⁰(ℤ/3) = 3` | agrees with duality |
| `eulerCharacteristic_finrank_fp` | `ℚ₂`, `𝔽₂`; `ℚ₃`, `𝔽₃` | `3 = 1 + 1 + 1`; `μ₃ ⊄ ℚ₃` ⇒ `dim H² = 0`, and `ℚ₃ˣ/(ℚ₃ˣ)³ ≅ (ℤ/3)²` ⇒ `2 = 1 + 0 + 1` | equal |
| `cyclotomicCharacter_artinMap` | `ℚ₂`, `u = −3` on `μ₁₆`; `ℚ₂(i)`, `u = i` | `13⁻¹ ≡ 5 mod 16` (`13·5 = 65`), not `13`; `N(i) = 1` | arithmetic convention detected; holds |
| `kummerEquiv_mixed` | `ℚ₂`, `n = 2`; `−7`; `ℚ₃`, `n = 2, 1` | `8` classes (`−1, 2, 5`); `−7 ≡ 1 mod 8` is a square; `4`, `1` | agrees |
| `h2MuEquivZMod_mixed` | `ℚ₂`, `n = 1, 2, 3`; `ℚ₇`, `n = 3` | orders `1, 2, 3`; invariant `1/3 ↦ 1`, the other equivalence `↦ 2` | the invariant fixes the map |
| `h2FpEquivZMod_of_mu` | `p = 3`, `e` versus `e ∘ inv`; zero `T` | `H²(inv) = −1` ⇒ the equivalence is negated; `#μ₃ = 3 ≠ 1` ⇒ no `e` | `e` is data |
| `kummerCupPairing` | `n = 2`, `ζ = −1`; `ℚ₇`, `ζ` versus `ζ²` | `(−1,−1) ↦ −1` (`1·1`), `(1, y) ↦ 1`; `log_{ζ²} ζ = 2` ⇒ `(ζ, ζ) ↦ ζ²` | the root is data |
| local symbol, `muNRepToTateDual` | `ℚ₂`, `(−1,−1)`, `(5,−1)`; `n = 2` | `(−1,−1)₂ = −1 ↦ 1`; `5 = 1² + 2²` ↦ `0`; `−1 ↦ id`, `1 ↦ trivial` | bijective; agrees |
| restriction along `iota` | splitting field of `X³ − 2`, `iota ∘ τ` | `σ` fixes `∛2` ⇒ transposition `s`; along `iota ∘ τ`: `τ⁻¹ s τ` fixes `τ⁻¹(∛2) ≠ ∛2` | embedding is data |
| `isPrincipal_map_hilbertClassField` | `ℚ(√−5)`, `H = ℚ(√−5, i)`; `K = ℚ`; `I = ⊥` | `𝔭₂² = (2)`, `(1+i)² = (2i)` ⇒ `(1+i)`; `𝔭₂𝔭₃ = (1+√−5)` ⇒ `𝔭₃𝓞_H = ((1+√−5)/(1+i))`; `ℤ` is a PID; `⊥` is principal | holds |
| PIT route, step 4 (R01) | the types of the two Artin maps | step 3: `globalClassFormation K` on `AbsoluteGaloisGroup K`; step 4: `hilbertClassArtinEquiv ↥H` → `globalClassFormation ↥H` on `AbsoluteGaloisGroup ↥H`; no declaration links them | gap; norm route given |
| same, norm route | `ℚ(√−5)` | `h(ℚ(√−5, i)) = 1` ⇒ `H' = H`, `N(C_{H'}) = C_H`, the ray class at `1` is trivial | consistent with `𝔭₂𝓞_H = (1+i)` |
| `relDiscr_eq_finprod_abelianConductor` | `ℚ(ζ₅)`; `ℚ(ζ₈)`; `L = K` | `1·5·5² = 125 = 5³`; `ℚ, ℚ(i), ℚ(√2), ℚ(√−2)`: `1·4·8·8 = 256 = 2⁸`, `L` not cyclic; `⊤ = ⊤^{φ(1)}` | equal |
| same, steps 1–2 (R05) | `ℚ(ζ₅)` at `5`; `ℚ(i)` at `2` | `g = f = 1`, `d = 3` ⇒ `3 = 0+1+1+1`; exponents `0, 2`, conductor `4·∞` ⇒ `𝔡 = (4)` | agrees |
| same, step 5 | `ℚ(ζ₅)` at `5` | global conductor `5·∞`, exponent `1` = local conductor exponent of a tame totally ramified extension | agrees |
| ring class field of the maximal order | Lean, one `simp` | elaborates without error | Check is correct |
| Layer 13, Hasse norm failure | `25` in `ℚ(√13, √17)` | at `2`: unramified, `v = 0`; at `5`: `13·17 ≡ 1`, `v₅ = 2`; `17 ≡ 2² mod 13`, `13 ≡ 8² mod 17` | local norm everywhere; known non-norm |
| Layer 10, lifting obstruction | the same field | every decomposition group has order `≤ 2` (`2`: `17 ≡ 1`, `13 ≡ 5 mod 8`) ⇒ `H²(G, I_L)` is killed by `2`; `H²(G, C_L) ≅ ℤ/4` | as stated |
| §5.6 transfer | `C₄ ⊃ ⟨g²⟩`; `V₄ ⊃ C₂` | `V(g) = g² ≠ 1`; `V(g) = g² = 1` | as stated |
| Layer 14 | `(3, 7)`; `(−1, −1)` over `ℚ` | `0, 1, 0, 1` at `∞, 2, 3, 7` (`(3/7) = −1`), sum `0`; `1` at `2` and `∞` | sums vanish |
| narrow versus wide Hilbert | `ℚ(√3)` | `2 + √3` totally positive; `±√3·(2+√3)^k` never is; `ℚ(√3, i) = ℚ(ζ₁₂)`, `disc 144 = 12²` ⇒ unramified, `(√3)` inert | as stated |

## Not verifiable

- These are cited by locator only, as the manifest settles them:
  - Artin–Tate, *Class Field Theory* (waived);
  - Serre, *Local Fields*; Neukirch, *Algebraic Number Theory*; NSW, *Cohomology of Number Fields*; Engler–Prestel, *Valued Fields* (uncertified).
- These are background citations in §8 with no manifest entry, and I did not read them: Serre, *Galois Cohomology* II §5; Brown, *Cohomology of Groups* VI §8; Rim 1959; Lang, *Algebra* III 7.1; Cox §§7 and 9; Weil 1951; Tate, Corvallis; Tate 1952; Nakayama 1957.
- Ownership against open pull requests: I checked it for the three open targets with `roadmaps grep` over all 456 open heads and main, with `roadmaps show` for #1215, #1411 and #1811, and against the sibling checkouts the brief lists.

## Source issues

- none
