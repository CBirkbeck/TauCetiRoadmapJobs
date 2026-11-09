# Review of ClassFieldTheory (pull request #617 at 4fd7aa6)

**Verdict:** needs changes

This pull request changes 9 lines of this folder: `README.md` lines 1199–1203 and 1336–1342. The rest of the folder is as on main. This is a full review of the folder, so most findings below concern text that this pull request inherits from main. Only R08 items 1–2 and R11 concern the lines it changes.

The gate fails on `set_option` (1), `tex` (3), `sorry-data` (66), `imports` (1), `statement-hygiene` (10), `long-fences` (1) and `outside-folder` (5). It also fails on one non-`sorry` build warning. The Tau Ceti pin is `2fd255d9` and the Mathlib pin is `1b1ccf4b`. At these pins Tau Ceti proves almost every headline this roadmap states as an open target, and that drives R01 and R06.

## R01 (P2) — 66 definitions and instances have `sorry` bodies; 52 restate Tau Ceti definitions, and theorems stated on them can never be proved

**Location:** `TauCetiRoadmap/ClassFieldTheory/Suggested.lean`. Examples: `tateTheorem` (361), `characterConnectingClass` (499), `invMap` (1103), `localClassFormation` (1700), `artinMap` (1925), `localWeilGroup` (2670), `globalFormation` (2912), `globalGroundEquiv` (3762), `globalInv` (3307), `globalClassFormation` (3363), `finiteHilbertSupport` (4384). README §6, lines 2125–2126, mandates this: "every missing map used in a statement is a named `sorry` definition".

**Claim:** An acceptance test may not contain `sorry`'d data. Here it also defeats the test: a statement about an opaque `sorry` term cannot be discharged even by a library that proves that mathematics.

**Witness:** `globalAbelianExistence` (3969) states Tau Ceti's `globalAbelianExistence` (`GlobalExistence/Existence.lean:213`) on this file's carriers. On a scratch copy, `exact TauCeti.ClassFieldTheory.globalAbelianExistence hN` fails with a `whnf` timeout, because `globalNormSubgroup` (3768) is built on the `sorry`'d `globalFormation` and `globalGroundEquiv`.

**Repair:**
1. Turn each `sorry`'d definition into an `abbrev` of its Tau Ceti counterpart, after checking that the types agree. 52 of the 66 have a Tau Ceti declaration of the same name:
   - 47 in `TauCeti/NumberTheory/ClassFieldTheory/` (Formation, Brauer, Local, LocalExistence, WeilGroup, Global, ClassFields);
   - `ideleNormMap`, `ideleClassNorm`, `finiteLocalNormMap`, `infiniteLocalNormMap` and `decompositionRestrict` in Tau Ceti's number-field and Galois files.
2. Map six of the other 14 to Tau Ceti declarations with other names:
   - `kummerEquiv_unit` and `kummerEquiv_mixed` → `kummerEquiv` and `kummerEquivOfCharZero` (`MuNRep.lean:270,358`);
   - `localLayer`, `localNormQuotientEquiv` and `localGaloisAbelianizationEquiv` → `layerGalEquiv` and `unitsLevelEquiv` (`UnitsLayer.lean:148`);
   - `kummerIdeleSubgroup` → `auxiliaryKummerIdeleSubgroup` (`Global/Kummer/`).

   Restate `explicitH1AddEquivH` through `explicitH1AddEquivContinuousCohomology` (`ContCohomology/CohomologyComparison.lean:145`).
3. Delete every definition that no consumer uses. Keep the names that LocalGaloisGroups, QuadraticFormInvariants, GlobalQuadraticForms and IntegralLattices use, about 45 of them, for example `GalRep`, `H`, `muNRep`, `kummerClass`, `localSymbol`, `principalIdele`, `ideleNormMap` and `ringClassArtinMap`.
4. Rewrite README §6 (lines 2061–2136) to the acceptance-test policy.

Tested: on a copy of lines 1–620 with ten Tau Ceti imports added, `tateTheorem := TauCeti.ClassFieldTheory.tateTheorem F L u _h1 _hcard _hgen r` makes this file's `tateIso`, `nakayamaNegTwo`, `artinEquiv` and `artinMap` Tau Ceti's. After that, 23 of the 25 `sorry`s of Layers 0–4 close with one term (exit 0).

## R02 (P2) — `sorry`'d definitions and instances lose their local-field binders, so they are asserted for every field

**Location:** `Suggested.lean`:
- `artinMap` (1925);
- `localWeilGroup` (2670) and the instance `localWeilGroup_normal` (2679);
- the four `WeilGroup` instances (2704, 2707, 2760, 2763);
- `weilDegree` (2774), `weilTransfer` (2799) and `weilRestrict` (2836);
- `localLayer`, `localNormQuotientEquiv` and `localGaloisAbelianizationEquiv` (1719–1732).

**Claim:** Each type mentions only `K` and `[Field K]`, so the section's `[ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]` are dropped. As a result, the local Artin map, the Weil group and its locally compact group topology are asserted for every field. README §6, lines 2127–2130, forbids exactly this.

**Witness:** A scratch file that imports this module elaborates `artinMap ℚ : ℚˣ →* Field.absoluteGaloisGroupAbelianization ℚ`. Instance search proves `LocallyCompactSpace (WeilGroup ℚ)` and `(localWeilGroup ℂ).Normal`. Tau Ceti's `artinMap` (`Local/ArtinMap.lean:106–114`) and `localWeilGroup` (`WeilGroup/Basic.lean:82–91`) carry these binders.

**Repair:** The aliases of R01 fix this. Any definition or instance that stays must carry `[ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]` in its own signature. Tested: the scratch file above.

## R03 (P2) — `set_option` and roadmap imports in the acceptance test

**Location:**
- `Suggested.lean:21`: `set_option autoImplicit false`.
- Lines 16–19, which import `TauCetiRoadmap.ProfiniteCohomology.Suggested`, `Completed.LocalFieldsRamification.Suggested`, `Completed.GlobalNumberFields.Suggested` and `Completed.NumberFieldArithmetic.Suggested`.
- README lines 2134–2136, which prescribe these imports: "The file imports the four supplier roadmaps".

**Claim:** `set_option` is excluded, and the only imports allowed are `Mathlib` and individual `TauCeti.*` modules. The gate reports `set_option=1` and `imports=1`.

**Witness:** The gate output, lines 1 and 21.

**Repair:**
1. Delete line 21. Tested: with that line removed the file elaborates with exit 0 and the same 275 `sorry` warnings, because every identifier was already bound.
2. Replace lines 16–19 with the Tau Ceti modules of the R01 aliases.
3. State `GalRep`/`H` on Mathlib's `TopRep`/`continuousCohomology`, and `cd_p`/`scd_p` as Tau Ceti's `cohomologicalDimensionAt.{0}`/`strictCohomologicalDimensionAt.{0}`.
4. Update README §6 to match.

One consumer needs an edit in a pull request that merges first: QuadraticFormInvariants reaches three Tau Ceti lemmas only through these imports, and needs `TauCeti.FieldTheory.Trace` and `TauCeti.RingTheory.Norm.Quadratic` (previous review, R01).

## R04 (P2) — Two statable targets are absent from `Suggested.lean` and from its docstring

**Location:**
- `README.md:147`, item 13, "the conductor–discriminant formula";
- `README.md:1834`, "the principal ideal theorem";
- the module docstring, `Suggested.lean:23–94`, which names no headline as unstatable.

**Claim:** Both statements are statable at the pins, yet neither is stated. The principal ideal theorem in its arithmetic form is open at the pin: Tau Ceti has only the class-formation form, `ClassFormation.groundInclusion_mem_normSubgroup_of_range_eq_commutator` (`Formation/PrincipalIdeal.lean:67`). The conductor–discriminant formula is also open: no such theorem exists in Tau Ceti.

**Witness:**
- `(I.map (algebraMap (𝓞 K) (𝓞 (hilbertClassField K)))).IsPrincipal` elaborates with this file's `hilbertClassField`, with only a `sorry` warning.
- `TauCeti.relDiscr` (`RingTheory/DedekindDomain/Discriminant/Basic.lean:33`) exists, and `abelianConductor : (K L : Type) → … → Modulus K` elaborates.
- For `ℚ(ζ₅)`, the discriminant is `125 = 1·5·5·5`.

**Repair:** State the principal ideal theorem for every ideal of `𝓞 K` (Milne, *CFT*, V Theorem 3.17, p. 161). State the conductor–discriminant formula as `relDiscr (𝓞 K) (𝓞 L)` equals the product, over the characters of `Gal(L/K)` (equivalently over the cyclic subextensions `M`, with exponent `φ([M:K])`), of the finite part of `abelianConductor K M` (Milne V Theorem 3.27, p. 165). If a carrier proves missing, name it in the docstring instead. Tested: the principal ideal theorem statement elaborates as written.

## R05 (P2) — Ring class fields are restricted to quadratic orders, which is narrower than the source and the pin

**Location:**
- `README.md:491–492` (§2.7);
- `README.md:147–149` (§1, item 13);
- `README.md:1857–1864`: "is load-bearing … This roadmap therefore asserts no ring class field for a general nonmaximal order";
- `Suggested.lean:4288–4360`, which carries `hK : Module.finrank ℚ K = 2`.

**Claim:** The conclusion does not follow from the stated reason. Only the description of `Pic O` by rational congruences, `I_K(𝔣)/P_{K,ℤ}(𝔣)`, needs `O = ℤ + 𝔣𝒪_K`. For every order `O` in every number field, the ring-class quotient `C_K → Pic O` has an open finite-index kernel. So `H_O` exists for every order, with `Gal(H_O/K) ≅ Pic O`.

**Witness:**
- Kopp–Lagarias, Theorems 1.1–1.3 (`kopp-lagarias` lines 128–181), state this for any order and level datum. The ring class field is `H^O_{O,∅}`.
- Tau Ceti's `ringClassArtinEquiv : Pic O ≃* Gal(ringClassField O/K)` (`ClassFields/RingClass/Field.lean:178`) holds for every `NumberFieldOrder K`.

**Repair:**
1. Drop `hK` from `ringClassIdeleQuotient` through `gal_ringClassField_equiv_pic`, and state the isomorphism as the data `ringClassArtinEquiv`.
2. Keep Cox Prop. 7.22 as the quadratic Check.
3. Cite Kopp–Lagarias Theorems 1.1–1.3. They are already in `sources.toml`, cited for Layer 13.
4. Correct §2.7 and the Layer 13 warning.
5. Update `TauCetiRoadmap/IntegralLattices/Suggested.lean:1280,1293`, which pass `hK`, in the same merge.

Checked: Tau Ceti's `ringClassField` takes any `O : NumberFieldOrder K` (`RingClass/Field.lean:92,111`). It is therefore defined for the cubic order `ℤ + 2𝒪_K` of index 4, the README's own example.

## R06 (P3) — Padding: the `sorry`'d theorems restate theorems Tau Ceti proves at the pin, and README Layers 3–14 present them as open

**Location:** The 209 `sorry`'d theorems of `Suggested.lean`, of which the witness below is a checked sample; README Layers 3–14 and §5.

**Claim:** At the pin these are proved results, not targets. The §5 regression tests are Checks that compute values.

**Witness:** In the R01 probe, 23 of the 25 `sorry`s of Layers 0–4 close with one term. `kroneckerWeber` (4364) closes with `TauCeti.ClassFieldTheory.kroneckerWeber E` (`ClassFields/KroneckerWeber.lean:178`), whose statement is the same. Further counterparts at the pin are listed under Verified sound.

**Repair:**
1. In `Suggested.lean`, delete every `sorry`'d theorem that has a Tau Ceti counterpart. Keep only the names consumers use, each as a theorem whose proof is the Tau Ceti term.
2. Delete the §5 tests from `Suggested.lean`; the README keeps them as Checks.
3. In the README, record Layers 3–14 as implemented, citing the Tau Ceti names in the supplier contracts as Layers 1–2 already do. Keep only the open targets (R04).

## R07 (P3) — The ten statement-hygiene hits of the gate

**Location:** `Suggested.lean`:
- `Nonempty (… ≃ …)` conclusions at 1127, 1134, 1143, 4264, 4271 and 4352;
- `haveI` in the signature of `prod_cyclotomicSymbol` (2212);
- `.choose` inside `localClassField`, `localClassFieldPrimeToResidueCharacteristic` and `globalClassField` (2471, 2550, 4009).

**Witness:** The gate reports `statement-hygiene=10`. README line 2114 itself excludes "an arbitrary `Nonempty (X ≃ Y)` where a canonical map is required".

**Repair:**
1. State the `H²(μ_n) ≃+ ZMod n` maps as Tau Ceti's data `h2MuEquivZMod` (`Brauer/RootsOfUnity.lean:89`). Keep the `Nonempty` forms as `nonempty_*` corollaries, and update the two uses in `Completed/LocalGaloisGroups`.
2. Replace the three Galois-group isomorphisms with Tau Ceti's data: `rayClassArtinEquiv` and `hilbertClassArtinEquiv` (`ClassFields/RayClassField.lean:209,262`), and `ringClassArtinEquiv` (`RingClass/Field.lean:178`).
3. Turn the `haveI` into an instance binder.
4. Make the three class-field definitions `abbrev`s of Tau Ceti's (R01).

## R08 (P3) — Stale and inaccurate claims about the pin, two of them in this pull request's lines

**Location and claims:**
1. **(Changed here.)** `README.md:1339` now reads "Both are Tau Ceti's, and `LocalFieldsRamification` imports them". `Suggested.lean:90–93` still says that LocalFieldsRamification "states the ones the pinned Tau Ceti revision lacks". `Suggested.lean:2078–2079` still says that `ker_restrictMaximalUnramifiedHom` "landed after this repository's Tau Ceti pin", but it is at `LocalField/Unramified/Inertia/Basic.lean:208`.
2. **(Changed here.)** `README.md:1201–1202`: "the logarithm identifies `G`-equivariantly … (`LocalFieldsRamification.deepUnitExpLogEquiv`)". The cited declaration (`Completed/LocalFieldsRamification/Suggested.lean:303`) is `Multiplicative (𝓂[K]^i) ≃* unitFiltration K i` for a single field. It is the exponential direction, and it carries no Galois action, so the equivariance is stated nowhere.
3. `README.md:1016–1017` says that `isSolvable_algEquiv` "landed after this repository's Tau Ceti pin". It is at `LocalField/Solvable.lean:52`.
4. `README.md:376–377` says "all are Tau Ceti's except `tateIso_res_trans`, a target of Layer 3". It is at `Formation/Tate/Naturality.lean:152`.
5. `README.md:677` places the Nakayama–Rim theorems "in Tau Ceti's `TateCohomology` namespace". At the pin they are `Rep.*`: `TateCohomology/Projective/Basic.lean:96–285` and `NakayamaRim.lean:117`.
6. `README.md:1081–1085` describes `IsSmoothDiscrete` as "every point stabilizer open" and adds `[DiscreteTopology A.V]` as a separate binder. Tau Ceti's structure has the field `discreteTopology` (`SmoothDiscrete/Basic.lean:259–263`), so that binder is implied.

**Repair:**
1. Correct `Suggested.lean:90–93` and `2078–2079` to match the new README line 1339.
2. Write "the deep logarithm `U(L,n) ≅ 𝔭_L^n` (`TauCeti.deepUnitExpLogEquiv`), which commutes with every `σ ∈ G` because `σ` is continuous and the logarithm is a power series with rational coefficients". Alternatively, cite only the isomorphism and state the equivariance as a target. The Euler characteristic is in any case Tau Ceti's at the pin (R06).
3. For items 3–5, cite the pinned names.
4. For item 6, describe `IsSmoothDiscrete` as discreteness plus open stabilizers, and drop the redundant binder in Layer 5.

## R09 (P3) — A false Check in §5.6 (the previous R10, unrepaired)

**Location:** `README.md:2023–2025`: "In a cyclic group of order four, transfer to the subgroup of order two is not interchangeable with the quotient map".

**Claim:** In `C₄` the two maps agree up to the unique isomorphism of the groups of order 2.

**Witness:** Take `G = ⟨g⟩ ≅ C₄` and `H = ⟨g²⟩`. For abelian `G`, `V(g) = g^[G:H] = g²`, so `ker V = H = ker q`, and `V` is `q` followed by `G/H ≅ H`. In `V₄`, by contrast, `V ≡ 1` while `q ≠ 1`.

**Repair:** Attribute the distinction between transfer and quotient to the Klein-four case `ℚ(√5,√13)`. In the `C₄` case, say that it distinguishes inclusion (`g² ↦ g²`, not onto `G`) from transfer (onto `H`). Checked on both groups as above.

## R10 (P3) — README shape, process wording, TeX and a long fence (the previous R12, unrepaired)

**Location and witness:**
- **Shape.** `## Purpose` (line 3) and numbered `## 1.`–`## 8.` sections. The layers are `###` headings under `## 4. Build plan`, with no `### Examples` and no `### Dependencies`. §3 is a "Frozen public interface" table of target names (lines 521–594).
- **Process wording.**
  - "Suggested home" (60);
  - "may change during implementation" (524);
  - "audit and complete" and "Fix the exact Mathlib pin and inventory" (642, 648);
  - "The first versions may be proved … They should not wait" (1911–1912);
  - "should be added only after the following supplier maps have stable names" (2050);
  - "as the supplier audit is completed" (2267–2269).
- **Gate `tex`.** Lines 99 and 298 sit inside fences indented in list items, which the scanner does not treat as code. Line 348 is a code span broken across a line break.
- **Gate `long-fences`.** Lines 2145–2197 are a 51-line ASCII graph.

**Repair:**
1. Use the house headings: `**Summary.**`, `## Scope and ownership`, `## Conventions`, `## Exact supplier contracts`, `## How to read the build`, and `## Layer k`, each layer ending with `### Examples` and `### Dependencies`.
2. Fold §3 into per-layer prose and delete the process sentences.
3. Write `N_(U/V)` and `inv(U,V)`, or join the code span on line 348 into one line.
4. Replace the graph with a per-layer `*Needs:*` list, or cut it below 40 lines.

## R11 (P3) — Two conflicting open pull requests on this folder, with no stated order

**Location:** The pull request description. Its merge-order paragraph names only #1410.

**Witness:** #1215 and #1411 both change `TauCetiRoadmap/ClassFieldTheory/README.md`, and both conflict with this head. At #1411's head, `README.md:1213` still cites `LocalFieldsRamification.localLogarithm`. That name occurs twice in main's `Completed/LocalFieldsRamification/README.md` and 0 times at this head.

**Repair:** State in the description which of #1215, #1411 and this pull request rebases onto which. Ask #1411 to cite `deepUnitExpLogEquiv`, as line 1202 here does.

## R12 (P3) — An edit outside the folders this pull request names

**Location:** `Completed/LocalGaloisGroups/README.md` and `Completed/LocalGaloisGroups/Suggested.lean`; the gate reports `outside-folder`.

**Claim:** `Completed/LocalFieldsRamification` is this pull request's own folder; LocalGaloisGroups is not named anywhere.

**Witness:** `git diff --stat origin/main...HEAD` shows 20 changed lines in the README and 6 in `Suggested.lean` of LocalGaloisGroups, for example the switch from `LocalFieldsRamification.tameInertiaEquiv` to `TauCeti.quotientWildInertiaSubgroupEquiv`.

**Repair:** Name LocalGaloisGroups in the description as a consumer changed with LocalFieldsRamification, so that it gets its own review. Alternatively, move those edits to a pull request that merges together with this one.

## R13 (P3) — A non-`sorry` warning in the build, on a padding test

**Location:** `Suggested.lean:2643`, the test `localArtinMap_Q2_zeta5 [ValuativeRel ℚ_[2]] [IsNonarchimedeanLocalField ℚ_[2]] …`.

**Witness:** Elaboration (exit 0) emits `linter.concreteInstances`: "There exists a global instance of type class `ValuativeRel ℚ_[2]`". Tau Ceti proves the same value as `localArtinMap_Q2_zeta5` (`Local/Cyclotomic.lean:205`).

**Repair:** Delete the theorem from `Suggested.lean`; README §5.3 keeps it as a Check. If it is kept, drop the two binders and use the global instances.

## Previous findings

The previous review (`~5`) read #1411's head 71f458c, a rewrite of both files. This head instead carries main's files plus this pull request's 9 README lines.

- **R01 (consumers fail after the roadmap imports and `ringClassArtinMap` were dropped): not applicable here.** Lines 16–19 and `ringClassArtinMap` (4327) are present, and the worker's targeted build of QuadraticFormInvariants, GlobalQuadraticForms and IntegralLattices succeeds. The imports themselves are now R03.
- **R02 (pinned objects defined a second time): not repaired.** At this head they are `sorry`'d: `finiteHilbertSupport` (4384), `globalClassField` built by `.choose` (4009), `ringClassField` (4318), and `unramifiedCoordinate` through the `sorry`'d lemma at 2050. See R01 and R06.
- **R03 (#1411's Layer 7 re-plans pinned results): not applicable.** This head has no such Layer 7.
- **R04 (two statable headlines absent): not repaired.** See R04.
- **R05 (#1410 and #1474 claim objects #1411 owns): not applicable.**
- **R06 ("LocalFieldsRamification Layer 3" citations): not applicable.** This README cites no LocalFieldsRamification layer number.
- **R07 (padding): not repaired.** See R06.
- **R08 (statement hygiene): not repaired.** There are 10 hits here; see R07.
- **R09 (stale claims): partly repaired.**
  - Repaired: item 4 (README 1103 cites `LocalFieldsRamification.card_powerClasses_mixed`, declared at `Completed/LocalFieldsRamification/Suggested.lean:318`) and item 5 (all §5 test names are declared here).
  - Not repaired: items 1, 3 and 6; see R08.
  - Not applicable: items 2 and 7.
- **R10 (false `C₄` Check): not repaired.** See R09.
- **R11 (conflicting open pull request with no stated order): not repaired.** See R11.
- **R12 (README shape and process wording): not repaired.** See R10.

## Verified sound

**Gate and build.** My run of the gate reproduces the worker's counts and its `FAIL`. `lake env lean` on `Suggested.lean` exits 0, with 275 `sorry` warnings and the one linter warning of R13.

**Dependency check** (`--movable`):

```text
depcheck: 238 roadmaps, 2352 edges, 0 problem(s)
```

ClassFieldTheory is on main and is not listed in the merge order.

**Signature check.** I elaborated 452 `#check @` lines against the built module. 443 declarations elaborate; the other 9 lines are docstring words picked up by the extraction regex. Comparing the types with the README turned up four things:
- the binder losses of R02;
- `kummerEquiv_unit`, `brRes`, `brCor` and `brInfl` drop the local-field structure, which is harmless because Kummer theory and restriction, corestriction and inflation exist over every field;
- `ringClassField` carries `hK` (R05);
- `cd_p_…` and `scd_p_…` keep the local binders.

**One-tactic probes** (scratch copies):
- **Layers 0–4.** 23 of 25 close, after `tateTheorem` and `characterConnectingClass` are aliased:
  - Layer 0 (6): the free-submodule theorem and the five Nakayama–Rim theorems;
  - `tateTheorem_toAddMonoidHom`, `tateIso_res`, `tateIso_cor`, and `tateIso_res_trans` (through `tateIso_res` at `S.trans T`);
  - `ker_artinMap`, `artinMap_eq_zero_iff`, `surjective_artinMap` and `character_artinMap`;
  - the four Artin–Tate diagrams;
  - `normSubgroup_maximalAbelianLayer`, `artinMap_trivialLayer` and `isGenerator_artinMap_iff`.

  `eq_artinMap_of_character` differs from Tau Ceti's only in how the character cup is spelled. `artinMap_quadratic_eq_nontrivial_iff_not_norm` follows from `artinMap_eq_zero_iff` in a group of order 2.
- **`kroneckerWeber`** closes.
- **`eulerCharacteristic_mixed`** is Tau Ceti's theorem in another spelling (`[FinitePadicExtension F p]`).
- **`globalAbelianExistence`** cannot be closed (R01).

**Theorems this file restates that Tau Ceti proves at the pin** (the R06 sample):
- local theory: `injective_artinMap` (`LocalExistence/ArtinMap.lean:113`), `tateDualityPairing_perfect_mixed` (`Local/Duality/Perfect.lean:280`), `eulerCharacteristic_mixed` (`Local/EulerCharacteristic/Theorem.lean:98`), `strictCohomologicalDimensionAt_absoluteGaloisGroup_eq_two` (`Local/CohomologicalDimension/Strict.lean:236`), `localClassFieldCorrespondencePrimeToResidueCharacteristic` (`LocalExistence/Correspondence.lean:238`), `weilTopology_unique` (`WeilGroup/Topology.lean:141`);
- global theory: `exists_br_of_sum_eq_zero` (`Global/Brauer/Exactness.lean:98`), `globalArtinMap_local` (`Global/LocalArtin/Compatibility.lean:179`), `globalArtinMap_ideal` (`Global/LocalArtin/Frobenius.lean:170`), `globalClassFieldCorrespondence` (`GlobalExistence/Correspondence.lean:118`), `cyclicHasseNorm` (`Global/HasseNorm/Basic.lean:154`), `hilbertProductFormula` (`Global/Hilbert/Reciprocity.lean:65`);
- the §5 tests, for example `localArtinMap_Q2_zeta5` (`Local/Cyclotomic.lean:205`) and `globalArtinMap_Qi_prime` (`Global/Cyclotomic/Gaussian.lean:45`).

**Library declarations opened at the pins.** The file and line of each is in the findings:
- `tateTheorem` and `tateIso` (`Formation/Tate/Theorem.lean:122,168`), `nakayamaNegTwo`, `artinEquiv` and `artinMap` (`Formation/ArtinMap.lean:126,139,169`);
- `Rep.isZero_res_of_projective` (`TateCohomology/Projective/Basic.lean:123`) and `Submodule.free_of_isPrincipalIdealRing` (`LinearAlgebra/FreeModule/PID.lean:42`);
- `deepUnitExpLogEquiv` (`LocalField/DeepUnits/Basic.lean:117`), `restrictMaximalUnramifiedHom` (`Unramified/Inertia/Basic.lean:181`), `inertiaSubgroup` (`:112`) and `maximalUnramifiedGaloisGroupEquivZHat` (`Unramified/ZHat.lean:197`);
- `IsSmoothDiscrete` (`SmoothDiscrete/Basic.lean:259`);
- `ringClassField` and `ringClassArtinEquiv` (`RingClass/Field.lean:111,178`), with `kroneckerWeber`, `globalAbelianExistence`, `localAbelianExistence` (`LocalExistence/Existence.lean:159`, which needs only `[CharZero K]` and no openness hypothesis) and the cd/scd theorems (`CohomologicalDimension/AbsoluteGaloisGroup.lean:95`, `Strict.lean:236`).

**This pull request's ClassFieldTheory lines.**
- `deepUnitExpLogEquiv` exists in LocalFieldsRamification at this head (`Completed/LocalFieldsRamification/Suggested.lean:303`), with Tau Ceti's hypothesis `e < (p − 1) i`, as written on line 1202. The equivariance claim is R08.2.
- `restrictMaximalUnramifiedHom`, `maximalUnramifiedGaloisGroupEquivZHat`, `inertiaSubgroup` and `IsArithFrobeniusLift` are Tau Ceti's at the pin, and LocalFieldsRamification imports them (its README, line 576), so line 1339 is correct. The stale lines it leaves behind are R08.1.

**Cross-roadmap citations resolved** (main `dcf5cfe`):
- ProfiniteCohomology: `cd_p_le_of_isClosed`, `cd_p_le_scd_p`, `corestriction_comp_res`, `corestriction_mackey`, `longExact_exact`, `H1ConjInvariants`, `shapiroIso`, `cup_coeffMap`, `cup_gradedComm` and `strictCohomologicalDimensionAt_le_iff_forall_openSubgroup`, all in its README and `Suggested.lean`;
- ProfiniteProPGroups: `cd_p_eq_of_isProPSylow` and `cd_p_le_iff_elementaryAbelian_of_isProP` (Completed);
- RepresentationTheory/ModularInduction: `modRepK0`, `modRepK0.lift`, `modRepK0.ind`, `modularArtin_exists_nsmul_mem_indCyclicCoprime` and the three `latticeDefect_*` names; its Layers 0, 3 and 4 exist;
- LocalFieldsRamification at this head: `card_powerClasses_mixed` (318), `deepUnitExpLogEquiv` (303) and `isOpen_range_powMonoidHom` (328).

All 6 leads in `citations.md` resolve in these roadmaps. `galRepOfQuotient` (README 1166) is a name this roadmap asks to be stated, and `Suggested.lean` does not declare it; it disappears with R06. No declaration reuses the fully qualified name of a declaration in another roadmap's `Suggested.lean`.

**Ownership.**
- #616 ProfiniteCohomology (line 116) and #1839 ProfiniteCohomologyPartII (lines 60, 209) defer class formations and local duality to this roadmap. #1743 EtaleDualityAndPerverseSheavesPartII owns none of them.
- #1187 (LocalGaloisGroups, ProfiniteCohomology) and #858 (ArithmeticGaloisDuality), which `overlaps.md` lists, were not given with files, so ownership against them was not checked.

**Sources checked at their locators** (cached texts):
- `milne-cft` II Theorem 3.11, Tate's theorem, p. 84 (line 3911). Its hypotheses are only (a) `H¹(H,C) = 0` and (b) `H²(H,C)` cyclic of order `(H:1)` for all `H`. The restriction-generation hypothesis of §2.4 is derived in the proof (line 3919) from `Cor∘Res = (G:H)`, so §2.4's three hypotheses are equivalent to Milne's for a generator `u`. Remark 3.12 (line 3988) is the `Tor₁ = 0` generalization in §2.4.
- `milne-cft` VII Example 8.2, pp. 221–222 (lines 10059–10100): `φ_∞(a) = [sign a]`, `φ_p(u p^s) = [p^s]` for `p ≠ l`, and `φ_l(u l^s) = [u⁻¹]`. These are the explicit symbols that fix the §2.6 and §5.5 conventions.
- `milne-cft` V Theorem 3.17, p. 161 (line 7252), and Theorem 3.27, p. 165 (line 7423): the locators given in R04. Milne states the second without proof.
- `kopp-lagarias` Theorems 1.1–1.3, pp. 3–5 (lines 128–181): R05.

**Adversarial table.** It covers the sampled §§2.1–2.7 and §§5.1–5.8, the headlines, and every target a finding touches.

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| §2.1 layer, ground level, norm quotient | `G = G_{ℚ₂}`, `A = ℚ̄₂ˣ`, `V = G_{ℚ₂(i)}`; `V = U` | `Γ = C₂`, `A^U = ℚ₂ˣ`, index 2 (`−1` not a norm since `(−1,−1)₂ = −1`); at `V = U`, `Γ = 1` and the quotient is trivial | sound | none |
| §2.2 axioms 3–4 | unramified `L/K` of degree 6, `E` of degree 2 | `inv u = 1/6`; `inv_E(res u) = 2/6 = 1/3`, of order 3 = `[L:E]`; the wrong model "restriction preserves inv" gives 1/6, outside the order-3 subgroup | sound | none |
| §2.3 res, inf, cor scalings | `[U:V] = 4`, `[U:U'] = 2`, `[V:V'] = 3` | res: `2·¼ = ½ = 1/[U':V]`; inf: `¼ = 3·(1/12)`; cor: `½ = 2·¼`; the reversed index `[U':U] = ½` is not an integer | sound | none |
| §2.4 Tate's theorem | `C₂` on `ℂˣ` with `u = [−1]`; trivial `C₂` on `ℤ/2`; `u = 0` | `ℂˣ`: `H¹ = 0`, `#H² = 2`, `Ĥ⁻² = C₂ ≅ ℝˣ/ℝ_{>0}`; `ℤ/2`: `H¹ = ℤ/2` and `Ĥ⁻¹(ℤ) = 0 ≠ Ĥ¹(ℤ/2) = ℤ/2`; `u = 0` fails `hgen` at `C₂`, and the cup is 0 | sound | none |
| §2.4 Tate–Nakayama `Tor₁ = 0` | `M = ℤ/2`, `C = ℂˣ` | `Tor₁(ℤ/2, ℂˣ) = μ₂ ≠ 0`, so excluded; `M = ℤ` satisfies it | sound | none |
| §2.5 `artinEquiv = nakayamaNegTwo.symm` | `ℚ₂(ζ₅)`, `Art(2)` | `ζ₅ ↦ ζ₅²`; the inverse direction gives `ζ₅³` (`2·3 ≡ 1 mod 5`); Tau Ceti's `localArtinMap_Q2_zeta5` proves the first with this chain | sound | none |
| §2.6 `χ(Art_K u) = N(u)⁻¹` | `ℚ₂`: `u = −3` on `μ₁₆`, `u = −1` on `μ₄`; `K = ℚ₂(i)`, `u = i`; Ex 8.2 at `m = 5`, `a = 2` | `(−3)⁻¹ ≡ 5 mod 16`, against 13 without the inverse; `i ↦ −i`; `N(i) = 1`, so `Art(i)` acts trivially; `[2]·[3]·[1] = [6] = [1]` | sound | none |
| §2.7 directions; `Ĥ⁰` inflation | `G_{ℚ₂(ζ₅)} ≤ G_{ℚ₂(√5)}`; `G = H = Gal(ℚ₂(i)/ℚ₂)` | `⟨16⟩ℤ₂ˣ` (index 4) `≤ ⟨4⟩ℤ₂ˣ` (index 2), with the fields reversed; inflation would need `ℚ₂ˣ ⊆ N(ℚ₂(i)ˣ)`, false | sound | none |
| §2.7 ring class field, quadratic only | `O = ℤ + 2𝒪_K`, cubic `K`, index 4 | Kopp–Lagarias Theorems 1.1–1.3 and Tau Ceti's `ringClassArtinEquiv` give `Gal(H_O/K) ≅ Pic O` | narrower than the source | R05 |
| §5.1 trivial layer, `localNormSubgroup_top` | `U/U`; `V = ⊤` | `N = id`, quotient 0, `(U/U)^ab = 1`, `Art = 0`; `⊤ ↦ Kˣ` | sound, at the pin | R06 |
| §5.2 cyclic index and generators | `ℚ₂(ζ₅)/ℚ₂` | index 4; `[2]` generates and `Frob` generates; `[4]` does not, and neither does `Frob²` | sound | none |
| §5.3 unramified | `ℚ₂(ζ₅)`, `x = 8`, `u ∈ ℤ₂ˣ`; `L = K` | `Art(8) = Frob³`: `ζ₅ ↦ ζ₅³`; `Art(u) = 1`; `ZMod 1` | sound | none |
| §5.4 local quadratic | `ℚ₂(i)`, `a = −1, 5`; `𝔽₂((t))` | `(−1,−1)₂ = −1` and `Art(−1) = τ`; `5 = 1²+2²` and `(5,−1)₂ = 1`; in characteristic 2, `IsPrimitiveRoot ζ 2` has no solution, so the statement is vacuous, as intended | sound | none |
| §5.4 global quadratic | `ℚ(i)` at 3, 5; `ℚ(√5)` at 11, 7 | 3 inert (`i³ = −i`), 5 split; 11 split, 7 inert | sound | none |
| §5.5 cyclotomic | `ℚ(ζ₅)` at 2, 3, 11; `ℚ(ζ₈)` at 3, 5, 7; `m = 1, 2` | `ζ₅², ζ₅³, ζ₅`; `ζ₈³, ζ₈⁵, ζ₈⁷`; `1 = 1^ℓ`; `(−1)^ℓ = −1` | sound | none |
| §5.6 `ℚ(√5) ⊂ ℚ(ζ₅)` | `ℓ = 11, 19, 2, 7` | 11 ≡ 1 and 19 ≡ 4 fix `ℚ(√5)`; 2 and 7 do not | sound | none |
| §5.6 `C₄` transfer sentence | `C₄ ⊇ ⟨g²⟩`; `V₄ ⊇ C₂` | `C₄`: `V(g) = g²` and `ker V = ker q = H`; `V₄`: `V ≡ 1` while `q ≠ 1` | false for `C₄` | R09 |
| §5.7 Hasse norm counterexample | `ℚ(√13,√17)`, `x = 25` | at 2, local degree 2 and `v(25) = 0`; at 5, unramified with `v = 2`; `(25/13) = (25/17) = 1`; at ∞, `25 > 0`; decomposition groups have order ≤ 2, so lcm 2 < 4 | sound | none |
| §5.8 suite | the seven names | declared here and at the pin (`TrivialLayer.lean:149`, `NormSubgroup.lean:199`, `Unramified.lean:342`, `Quadratic.lean:57`, `Gaussian.lean:45`, `Prime.lean:42`, `AdmissibleModulus/Basic.lean:239`) | sound, restates the pin | R06 |
| headline: Tate's theorem, Layers 0–4 | probe | 23 of 25 close with one term | at the pin | R01, R06 |
| headline: `globalAbelianExistence` | `ℚ`, ray subgroup of `4∞` (index 2); probe | `ℚ(i)`, degree 2; Tau Ceti's proof times out on the `sorry`'d carrier | unprovable as stated | R01 |
| `card_ideleClassNormQuotient` | `ℚ(i)/ℚ`; `L = K` | 2; 1 | sound, at the pin | R06 |
| `cyclicHasseNorm` | `ℚ(i)/ℚ` at `x = 3, 5`; `V₄` | 3 is not a norm at 3 (inert, `v = 1`), and `x²+y² = 3` has no solution; `5 = 1+4`; `V₄` is excluded by `IsCyclic` | sound, at the pin | R06 |
| `kroneckerWeber` | `ℚ(√5)`; `ℚ` | `n = 5`; `n = 1`; closes by Tau Ceti's theorem | at the pin | R06 |
| `hilbertProductFormula` | `ℚ`: `(3,7)`, `(−1,−1)` | `(3,7)`: ∞ 0, 2 ½, 3 0, 7 ½, sum 0; `(−1,−1)`: ½ at 2 and at ∞, sum 0 | sound, at the pin | R06 |
| `eulerCharacteristic_mixed` | `ℚ_p` (p odd) with `ℤ/p`; `ℚ₂` with `ℤ/2`; `ℚ_p` with `ℤ/ℓ`, `ℓ ∤ p(p−1)` | `p² = p·1·p`; `8 = 2·2·2`; `ℓ = ℓ·1·1` | sound, at the pin in another spelling | R06 |
| `cd_p…_eq_two`, `scd_p…_eq_two` | `ℚ_p`; `𝔽_p((t))` | `H²(ℚ_p, μ_ℓ) = ℤ/ℓ ≠ 0`; `cd_p = 1` in characteristic p, excluded by `[Algebra ℚ_[p] K]` | sound, at the pin | R06 |
| `localAbelianExistence`; `injective_artinMap` exclusion | `ℚ₂`, `N = (ℚ₂ˣ)²`; `𝔽_q((t))` | `ℚ₂(i,√2,√5)`, degree 8 = index; prime-to-p norm subgroups contain `1 + t𝔽_q[[t]]` | sound | R06 |
| conductor–discriminant (absent) | `ℚ(ζ₅)/ℚ` | `disc = 125 = 1·5·5·5` | statable, absent | R04 |
| principal ideal theorem (absent) | `ℚ(√−5)` | the `IsPrincipal` statement elaborates on this file's `hilbertClassField` | statable, absent | R04 |
| `artinMap`, `WeilGroup` instances | `K = ℚ, ℂ` | `artinMap ℚ` elaborates; `LocallyCompactSpace (WeilGroup ℚ)` is found by instance search | binders lost | R02 |
| README 1202, deep logarithm | the cited declaration | `Multiplicative (𝓂[K]^i) ≃* U(K,i)`, one field, no Galois action | equivariance not stated | R08 |
| `localArtinMap_Q2_zeta5` | elaboration | concreteInstances linter warning on `[ValuativeRel ℚ_[2]]` | warning, padding | R13 |

## Not verifiable

- **Tate, Ann. of Math. 56 (1952), and Nakayama, Ann. of Math. 65 (1957)** (§2.4, lines 354 and 404): JSTOR, paywalled. I found no open copy, and neither is in the manifest. Milne II 3.11 and Remark 3.12 were checked instead.
- **Artin–Tate** (waived; §2.1, §2.4 Preliminaries §2 Theorem A, XIV §4 Theorem 1) and **Neukirch, *ANT*** (uncertified): cited by locator only, as settled.
- **Serre, *Local Fields*** and ***Galois Cohomology*; NSW; Milne, *ADT*; Brown; Rim 1959; Lang, *Algebra*; Cox; Weil 1951; Tate, Corvallis** (outside the sample): not in the manifest, and no legal copy was located.

## Source issues

- none
