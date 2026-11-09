# Review of ClassFieldTheory (pull request #1411 at 656f837)

**Verdict:** needs changes

This is a full review of the head. The folder changed by 3714 lines since `eb95acd`. The README now has the house headings. `Suggested.lean` shrank to 1398 lines: aliases of Tau Ceti declarations with closed proofs, plus seven `sorry` targets.

The gate fails for three reasons:
- `depcheck=1` (R01);
- `outside-folder` for `Completed/LocalGaloisGroups/Suggested.lean` (R03);
- `tex=1` (R04).

There are 14 findings: two P2 and twelve P3. Of the previous review's 13 findings, 8 are repaired, 3 are partly repaired and 2 are not repaired (list after the findings).

## R01 (P2) — The dependency check still reports an UPWARD supplier edge (previous R02, not repaired)

**Location:** `TauCetiRoadmap/ClassFieldTheory/README.md` lines 507, 538, 1435 and 1488. Line 507 reads: "The absolute upper ramification groups `G_K^u` of `Field.absoluteGaloisGroup K` | `RamificationOfCompleteDiscretelyValuedFields` §4a.1".

**Claim:** ClassFieldTheory is on main. RamificationOfCompleteDiscretelyValuedFields exists only in the open #1410, second in the merge order. If this pull request merged first, main would cite a section that main does not contain. The edge is not a cycle.

**Witness:**
```text
UPWARD: ClassFieldTheory (on main) -> RamificationOfCompleteDiscretelyValuedFields (#2) at README lines [507, 538, 1435, 1488]
depcheck: 238 roadmaps, 2323 edges, 1 problem(s)
```
At #1410's head, ClassFieldTheory is named only as an owner or consumer (its README lines 93 and 1157).

**Repair:** No edit here.
1. Merge #1410 first, as the description's `depends-on` already says.
2. Rebase and rerun the gate. The four citations then become citations between two roadmaps on main.

Do not move §4a.1 back into this roadmap: that brings back the two-owner conflict.

## R02 (P2) — FunctionFieldArithmetic still states unit-filtration reciprocity as its own target (previous R06, not repaired)

**Location:** `README.md:142–144`: "Unit-filtration reciprocity (Layer 7) is this roadmap's in both characteristics … `FunctionFieldArithmetic` consumes it rather than restating it".

**Claim:** At #1474's head, FunctionFieldArithmetic §4.2 states the same equality in equal characteristic, and its absolute form, as part of its target `lubinTate_artin`. It also gives its own Lubin–Tate proof, so the object has two owners. ClassFieldTheory is on main, so it is the earlier owner.

**Witness:** At #1474's head, `TauCetiRoadmap/FunctionFieldArithmetic/README.md:1119–1124` states, for every finite abelian `L/K` in equal characteristic and every `r ≥ 0`, that `Art_{L/K}(U_K^(r)) = Gal(L/K)^r`, and the same for every abelian algebraic `E/K`. The proof is at lines 1138–1150.

**Repair:**
1. In #1474 §4.2, replace that paragraph and its proof by a citation of ClassFieldTheory Layer 7 (`map_unitFiltration_normResidue`, `closure_map_artinMap_unitFiltration`). Keep the other clauses of `lubinTate_artin`.
2. Add #1474 to this description's merge-order paragraph.

## R03 (P3) — Gate `outside-folder`: `Completed/LocalGaloisGroups/Suggested.lean`

**Location:** `Completed/LocalGaloisGroups/Suggested.lean` lines 326 and 485, the two edited lines.

**Claim:** The pull request edits a folder that the brief does not list as its own. The edit is forced:
- `h2MuEquivZMod_mixed` now returns the canonical equivalence instead of a `Nonempty`;
- `h2FpEquivZMod_of_mu` now takes the coefficient isomorphism `e` directly.

**Witness:**
- The gate reports `outside-folder: Completed/LocalGaloisGroups/Suggested.lean`.
- The new line `⟨ClassFieldTheory.h2MuEquivZMod_mixed p F n hn⟩` typechecks only against this head, and the old line only against main.
- A scratch copy of the edited file elaborates against this head (exit 0).

**Repair:** The edit cannot merge on its own. Ask the board to record `Completed/LocalGaloisGroups` as one of this pull request's folders, as IntegralLattices and QuadraticFormInvariants already are, and say so in the description. The two lines stay as they are.

## R04 (P3) — Gate `tex`: a code span broken across two lines

**Location:** `README.md:858–859`: "`#H² = #(ℝˣ/ℝ_{>0}) = 2 =`" continues on the next line as "`#Ĥ⁻²(C₂, ℤ)`".

**Witness:** The gate reports `tex: line 858`. Its line scanner sees `_{` outside a code span.

**Repair:** Reflow the bullet so that the whole span `#H² = #(ℝˣ/ℝ_{>0}) = 2 = #Ĥ⁻²(C₂, ℤ)` sits on one line.

## R05 (P3) — Padding: 47 restatements that no consumer uses, and a `sorry` target that closes in one step (previous R08, partly repaired)

**Location:** `Suggested.lean`:
- 208–216 and 323–366;
- 402–517, except the Layer 4 alias `ClassFormation.artinMap` at 457;
- 618–626, 647–723, 782–808 and 917–958;
- 999–1006, 1050–1055 and 1107–1120;
- 1235–1246, 1319–1324, 1348–1355 and 1380–1386.

The module docstring (lines 60–61) defines the file's role: "names under this roadmap's names the Tau Ceti declarations that other roadmaps consume from it".

**Claim:** The `sorry`'d restatements are gone. In their place the file carries closed aliases of Tau Ceti declarations that no other roadmap uses, in its Lean or in its README. Separately, `ringClassField_maximal` is listed as open (README 593, 2139), but it closes in one step and repeats the README Check at line 2123.

**Witness:**
- None of the 47 names below occurs in the four modules that import this one, or in a consumer README.
- Probe P1 closes `ringClassField_maximal` (exit 0) with one `exact`: `congrArg (fun N => classField K (globalClassField N).1) (Subtype.ext (OpenSubgroup.toSubgroup_injective (ker_ringClassIdeleQuotient_maximalNumberFieldOrder (K := K))))`.

**Repair:**
1. Delete these 47 from `Suggested.lean`:
   - `ratModIntTorsion`, `fundamentalInvariant`;
   - the eight Layer 1 aliases `IsAbelianClassFieldLayer` … `maximalAbelianLayer_eq_self_iff`;
   - `tateTheorem_toAddMonoidHom`, `tateIso`, `tateIso_toAddMonoidHom`, `nakayamaNegTwo`, `artinEquiv`, `artinMap_apply`, `artinEquiv_eq_tateIso`, `characterConnectingClass`, `artinCharacterCup`, `character_artinMap`, `eq_artinMap_of_character`;
   - `kummerClass_mul`, `kummerEquiv_mixed_mk`;
   - `natCard_h2_units_dvd_finrank`, `finite_h2_units`, `natCard_h2_units_le_finrank`;
   - `brRes`, `brCor`, `invMap_brRes`, `invMap_brCor`, `invCoordinate`, `invMap_h2MuToBr_invCoordinate_symm`, `localHilbertSymbol`;
   - `fieldFormation`, `h0_unitsCoeff_eq_level_top`, `localFormation`, `localClassFormation`, `brInfl`, `localArtinEquiv`;
   - `iota_restrictAbsolute_apply`, `unramifiedCoordinate_mk`, `conductorExponent_eq_sInf_upperRamificationGroup`;
   - `GlobalNormSubgroups`, `globalClassField`, `ringClassNormSubgroup`, `ringClassField_maximal`;
   - `finiteHilbertInvariantAt_eq_zero_of_not_mem`.
2. Keep every name that a consumer uses, in its Lean or its README, including `ClassFormation`, `tateTheorem`, `artinMap_conj`, `tateDual`, `finite_H`, `localArtinMap`, `restrictAbsolute`, `artinMap_restrict`, `Br` and `invMap`.
3. In the README, name the deleted objects by their Tau Ceti names, for example `TauCeti.ClassFieldTheory.h2MuEquivZMod` for `invCoordinate` and `unitsFormation` for `fieldFormation`.
4. Keep `ringClassField_maximal` as the Layer 13 Check.
5. Reword the Layer 0 exit criterion (lines 681–683) and the "How to read the build" list (586–593) to match.

Tested: the pruned copy elaborates (exit 0, 1068 lines, 6 `sorry` warnings, all on the remaining open targets).

## R06 (P3) — Two consumed "closed proofs" depend on a `sorry`

**Location:**
- `Suggested.lean:62–64`: "every alias of a Tau Ceti theorem is a closed proof";
- `README.md:588`: "each a Tau Ceti declaration under this roadmap's name and a closed proof".

**Claim:** `eulerCharacteristic_finrank_fp` and `cyclotomicCharacter_artinMap` build `ValuativeExtension ℚ_[p] F` from the open target `algebraMap_vle_algebraMap_iff_of_finite_padic`. Both therefore depend on `sorryAx`. LocalGaloisGroups consumes both.

**Witness:** `#print axioms` in a scratch file reports `[propext, sorryAx, Classical.choice, Quot.sound]` for both, and `[propext, Classical.choice, Quot.sound]` for `hilbertProductFormula`.

**Repair:** In both places, say that these two theorems are closed except for Layer 5's open `algebraMap_vle_algebraMap_iff_of_finite_padic`.

## R07 (P3) — The hypothesis `_htr` is implied by `_hr`

**Location:**
- `Suggested.lean:1085`: `(_htr : TauCeti.IsTotallyRamified K L)`;
- `README.md:1398`: "for a finite totally ramified extension `E/F`".

**Claim:** For `r ≥ 0` we have `G^r ⊆ G^0 = G_0`. So `_hr : G^r = ⊤` already makes `L/K` totally ramified.

**Witness:** Probe P2 derives `IsTotallyRamified K L` from `_hr` alone (exit 0). It uses `upperRamificationGroup_antitone`, `upperRamificationGroup_of_coe_le_zero`, `lowerRamificationGroupReal_intCast` and `lowerRamificationGroup_zero_eq_top_iff`.

**Repair:**
1. Drop `_htr` from the Lean statement.
2. In the README, write "for a finite abelian `E/F` with `J^r = J`, which forces `E/F` to be totally ramified".

Tested: the statement without `_htr` implies the current one (exit 0).

## R08 (P3) — `principalIdele` redefines Mathlib's principal-idele map

**Location:** `Suggested.lean:1219–1221`, with body `Units.map (algebraMap F (NumberField.AdeleRing (𝓞 F) F)).toMonoidHom`.

**Witness:** Mathlib's `NumberField.IdeleGroup.unitEmbedding` (`Mathlib/NumberTheory/NumberField/AdeleRing.lean:110`) has the same body. Tau Ceti's `cyclicHasseNorm` (`Global/HasseNorm/Basic.lean:156`) is stated with it.

**Repair:**
1. Replace the definition by:
   ```lean
   abbrev principalIdele (F) [Field F] [NumberField F] : Fˣ →* NumberField.IdeleGroup (𝓞 F) F :=
     NumberField.IdeleGroup.unitEmbedding (𝓞 F) F
   ```
2. Name Mathlib's declaration in the ideles row of the supplier table (line 512).

Tested: the abbreviation is `rfl`-equal to the current definition. GlobalQuadraticForms only `#check`s the name.

## R09 (P3) — The ids §2.4–§2.6 are dropped, three open roadmaps cite them, and there is no old → new numbering

**Location:** `README.md:303`, `374` and `420` (`### Tate's theorem and its Tate–Nakayama generalization`, `### The direction of reciprocity`, `### Frobenius convention`). On main these are §§2.4, 2.5 and 2.6.

**Witness:**
- #999 EndoscopicTransferAndUnitaryTraceComparison cites "ClassFieldTheory §2.4" (README lines 106 and 209).
- #1692 AnticyclotomicLocalUnits cites §§2.5–2.6 (line 26).
- #1484 EllipticCurveModularityWild3Adic cites §2.6 (lines 44 and 240).

**Repair:** Add one line per moved id under *Conventions*:
- "§2.4 → *Tate's theorem and its Tate–Nakayama generalization*";
- "§2.5 → *The direction of reciprocity*";
- "§2.6 → *Frobenius convention*".

## R10 (P3) — Conflicting open pull requests with no stated order, and a stale description (previous R12, not repaired)

**Location:** The pull request description:
- "**Merge order.** #1410 → this PR";
- "LocalFieldsRamification as amended by #1410 (its §4a.1 absolute closure and the Layer 3 filtered-norm contracts)";
- "the absolute form is a README target".

**Witness:**
- #1215 conflicts with this head in this roadmap's README and `Suggested.lean`, in `Completed/LocalGaloisGroups/Suggested.lean`, and in the IntegralLattices and QuadraticFormInvariants Lean files.
- #617 rewrites main's ClassFieldTheory README lines 1199–1202 and 1336–1342, which this head also rewrites.
- #1410 is RamificationOfCompleteDiscretelyValuedFields.
- The absolute form is now `Suggested.lean:1136`.

**Repair:**
1. State which of #617, #1215 and #1411 is rebased onto which.
2. Add #1474 (R02).
3. Correct the dependency line to "RamificationOfCompleteDiscretelyValuedFields §4a.1 (#1410)".
4. Say that the absolute form is stated in `Suggested.lean`.

## R11 (P3) — Local duality Checks: one value pair is reversed, and the Check tests no stated target

**Location:** `README.md:1159–1161`: "over `ℚ_2` with the nontrivial unramified action on `ℤ/3` they are `3` and `1`".

**Claim:** The README lists `#H⁰(K,M)` and `#H⁰(K,M')` in that order, so the values are 1 and 3. No target of Layer 5 states the unramified annihilator result that this Check exercises. The block has only two Checks.

**Witness:**
- The module `M` is `μ_3` over `ℚ_2`, since Frobenius acts by `2 ≡ −1 (mod 3)`, so `H⁰(ℚ_2, M) = 0`.
- Its dual `M' = Hom(μ_3, μ_3)` is the trivial module `ℤ/3`, with `H⁰ = ℤ/3`.

**Repair:**
1. Write "they are `1` and `3`", or replace the Check by one on a stated target.
2. Add a third Check, for example: over `ℚ_2` at `A = μ_3`, `#H¹ = 3 = 1 · 3 · 1`. Here `H⁰ = 0`, `H² ≅ ℤ/3`, and the factor `p^{[F:ℚ_p] v_p(#A)}` is 1.

## R12 (P3) — The exit criteria of Layers 5 and 7 omit their open targets

**Location:**
- Layer 5, `README.md:1166–1168`;
- Layer 7, `README.md:1473–1474`: "`LocalGaloisGroups` can consume the local-cohomological exports of this roadmap by name, `cyclotomicCharacter_artinMap` included."

**Claim:** Both criteria are already met at the pin. The layers' open targets remain unproved: `algebraMap_vle_algebraMap_iff_of_finite_padic`, and the three unit-filtration statements that are this pull request's purpose. So neither criterion marks the layer complete.

**Repair:**
- Layer 5: append "and `algebraMap_vle_algebraMap_iff_of_finite_padic` is proved".
- Layer 7: append "and `map_unitFiltration_normResidue`, `sup_norm_unitFiltration_eq_of_upper_eq_top` and `closure_map_artinMap_unitFiltration` are proved".

## R13 (P3) — Three locator slips

**Location and witness:**
1. `README.md:520`, "degree casts (Layer 1)". ProfiniteCohomology's own README (line 1346) calls `degreeCast` Layer 12's.
2. `README.md:526–527` places `cup_add_left` in ProfiniteCohomology Layer 12. ProfiniteCohomology states it at line 1343, inside Layer 8 (lines 1265–1362).
3. `README.md:1548`, "Milne, *Class Field Theory*, I §1, Remark 1.9". At `milne-cft` line 1321 this is the unlabelled paragraph 1.9 (printed p. 23).

**Repair:**
1. Write "(Layer 12)" for the degree casts.
2. Attribute `cup_add_left` to Layer 8.
3. Write "I §1, 1.9, p. 23".

## R14 (P3) — README shape: there is no `## Downstream consumers` section (previous R13, partly repaired)

**Location:** `README.md:130`. The consumers are a `###` under *Scope and ownership*, and `## References` (line 2226) follows Layer 14 directly.

**Repair:** Move the consumer bullets (lines 150–177) into a `## Downstream consumers` section placed before `## References`. Keep the ownership boundaries (lines 132–149) in *Scope*.

## Previous findings (review of `eb95acd`)

- **R01 (build):** repaired.
  - QuadraticFormInvariants now imports `TauCeti.FieldTheory.Trace` and `TauCeti.RingTheory.Norm.Quadratic`.
  - IntegralLattices calls `ClassFieldTheory.ringClassArtinMap` (`Suggested.lean:1336`).
  - The worker's build reports `build=0`. My copy of LocalGaloisGroups elaborates (exit 0).
- **R02 (UPWARD):** not repaired; this report's R01.
- **R03 (duplicate definitions):** repaired except `principalIdele` (R08).
  - The README now says "`finiteHilbertSupport a b` is the support of the finite invariants" (line 2171).
  - The Hilbert invariants, `unramifiedCoordinate` and the class-field family are abbreviations of Tau Ceti's declarations.
  - `exists_globalClassField`, `unitsFiniteLayerRep` and `topologicalClosure_commutator_le_ker_restrictMaximalUnramifiedHom` are gone.
- **R04 (Layer 7 re-plans pinned results):** repaired.
  - Lines 1401–1403 read "This is Tau Ceti's `map_normUnits_unitFiltration_psiNat_eq_of_upperRamificationGroup_eq_bot`, for every finite Galois `E/F`".
  - The three cyclotomic theorems are aliases (lines 1162–1195).
- **R05 (absent headlines):** repaired: `isPrincipal_map_hilbertClassField` (1302) and `relDiscr_eq_finprod_abelianConductor` (1312).
- **R06 (#1474 second owner):** not repaired; this report's R02.
- **R07 (#617 drops Layer 3):** repaired. Lines 505–506 and 1435–1443 cite pinned declarations by file, and the overlap scan lists no dropped id.
- **R08 (padding):** partly repaired; R05.
- **R09 (hygiene):** repaired.
  - The gate reports `statement-hygiene=0`.
  - `attribute [local instance] TauCeti.finiteIntermediateFieldValuativeRel …` is at lines 1124–1126.
  - The commented-out block is gone.
- **R10 (stale claims):** all seven items repaired.
  - Every searched phrase now has 0 hits.
  - Line 647 reads "in namespace `Rep`", and line 1133 cites `card_powerClasses`.
- **R11 (C₄ Check):** repaired. Lines 1921–1923 read: "In the Klein four case the transfer to a subgroup of order two is `x ↦ x² = 1`, trivial, while the quotient map is not".
- **R12 (order with #617, #1215):** not repaired; R10.
- **R13 (shape and wording):** mostly repaired.
  - The README has the house headings, and every layer ends with *Examples* and *Dependencies*.
  - Each of these phrases now has 0 hits: "audit", "may change", "not certified", "kbuzzard", "Suggested home".
  - `## Downstream consumers` is still missing (R14).

## Verified sound

**Gate and build.** My run of the gate reports:
```text
tex=1 depcheck=1 outside-folder=3 … FAIL
```
Every other count is 0. The three `outside-folder` entries are LocalGaloisGroups (R03) and the two folders the brief names as the pull request's own. The worker's run reports `build=0`.

**Elaboration.**
- `lake env lean` on `Suggested.lean` exits 0, with exactly 7 `sorry` warnings, at lines 851, 1083, 1097, 1136, 1302, 1312 and 1352.
- A copy of `Completed/LocalGaloisGroups/Suggested.lean` exits 0. Its only other warnings are its own `concreteInstances` linter warnings at its lines 2434 and 2449.

**Dependency check** (`--movable`), run by me:
```text
UPWARD: ClassFieldTheory (on main) -> RamificationOfCompleteDiscretelyValuedFields (#2) at README lines [507, 538, 1435, 1488]
depcheck: 238 roadmaps, 2323 edges, 1 problem(s)
```
This is a true sequencing constraint (R01), not a cycle.

**Signatures.** I compared the 116 elaborated types in `signatures.md` with the README.
- The 7 flagged declarations drop only local-field instances, which their Galois-theoretic bodies do not use: `brRes`, `brCor`, `localFormation`, `brInfl`, `restrictAbsolute`, `iota_restrictAbsolute_apply` and `absoluteGaloisGroupExtend`.
- The seven `sorry` targets keep every binder that their README statements need.

**Probes and tested repairs.** All were run as scratch files with `lake env lean`, and all exit 0.

| Probe | What it shows |
|---|---|
| P1 | `ringClassField_maximal` closes with one `exact` (R05) |
| P2 | `_hr` implies `IsTotallyRamified K L` (R07) |
| P3 | `#print axioms`: two consumed aliases use `sorryAx`; `hilbertProductFormula` and the conductor corollary do not (R06) |
| P4 | `#synth ValuativeRel ℚ_[2]` gives `Padic.instValuativeRel`, the carrier of `algebraMap_vle_…` |
| T1 | The `principalIdele` abbreviation is `rfl`-equal to the current definition (R08) |
| T2 | The statement without `_htr` implies the current one (R07) |
| T3 | The pruned copy without the 47 aliases elaborates, with 6 `sorry` warnings (R05) |

**Names checked at the pin.**
- I checked 669 backticked README tokens against declarations at the pinned Mathlib and Tau Ceti and against `Suggested.lean`. Every name attributed to Tau Ceti or Mathlib exists.
- The rest are other roadmaps' names, resolved below, or are not identifiers.
- All 80 names of the Layer 1–4 inventory are in Tau Ceti's `NumberTheory/ClassFieldTheory/Formation/`, structure fields included.
- The items the generated STATUS lists as remaining are all present at the pin:
  - `localClassFieldCorrespondencePrimeToResidueCharacteristic` (`LocalExistence/Correspondence.lean:238`);
  - `exists_br_of_sum_eq_zero` (`Global/Brauer/Exactness.lean:98`);
  - `globalArtinMap_local` (`Global/LocalArtin/Compatibility.lean:178`);
  - `globalArtinMap_isArithFrobAt` and `globalArtinMap_ideal` (`Global/LocalArtin/Frobenius.lean:150,170`);
  - `globalAbelianExistence` (`GlobalExistence/Existence.lean:213`);
  - `globalClassFieldCorrespondence` (`GlobalExistence/Correspondence.lean:118`);
  - `rayClassArtinMap` (`Global/AdmissibleModulus/Reciprocity.lean:128`);
  - `narrowHilbertClassField` (`ClassFields/RayClassField.lean:246`);
  - `kroneckerWeber` (`ClassFields/KroneckerWeber.lean:178`).
- The two claims made only in prose are also implemented:
  - `isLeast_absNorm_abelianConductor_finitePart` (`ClassFields/CyclotomicLevel.lean:72`);
  - `profiniteCompletionArtinEquiv` (`LocalExistence/ArtinMap.lean:129`).

**Library declarations opened at the pin.** Tau Ceti:
- the ring class field and the Hilbert class field:
  - `ker_ringClassIdeleQuotient_maximalNumberFieldOrder` (`ClassFields/RingClass/Quotient.lean:144`);
  - `ringClassNormSubgroup` and `ringClassField` (`RingClass/Field.lean:98,111`);
  - `rayNormSubgroup`, `rayClassField` and `hilbertClassField` (`RayClassField.lean:104,123,241`);
- the conductor–discriminant carriers:
  - `relDiscr` (`RingTheory/DedekindDomain/Discriminant/Basic.lean:33`), which is `Ideal.relNorm` of the different;
  - `abelianConductor` (`Global/AdmissibleModulus/Basic.lean:193`);
- the ramification groups:
  - `upperRamificationGroup` with `_of_coe_le_zero`, `_antitone` and `_natCast` (`LocalField/Herbrand/Basic.lean:421,444,449,652`);
  - `lowerRamificationGroup_zero_eq_top_iff` and `lowerRamificationGroupReal_intCast` (`LocalField/RamificationGroup.lean:163,295`);
- the norm and conductor theorems:
  - `map_normUnits_unitFiltration_psiNat_eq_of_upperRamificationGroup_eq_bot`, for every finite Galois `L/K` (`LocalField/Norm/Surjectivity.lean:223`);
  - `unitFiltration_le_normGroup_iff_upperRamificationGroup_eq_bot` and `conductorExponent_le_iff_upperRamificationGroup_eq_bot` (`Local/Conductor/UpperNumbering.lean:64,121`). The first gives only the inclusion `Art(U^n) ⊆ G^n`, so `map_unitFiltration_normResidue` is open.
- the local symbol laws, whose hypotheses match lines 1050–1062:
  - `localSymbol_kummerClass_mul`, `…_eq_zero_of_add_eq_one` and `localSymbol_antisymm` (`Local/Symbol.lean:339,355,364`);
  - `localSymbol_eq_zero_iff_mem_normGroup` (`Local/CyclicClass.lean:293`);
  - `forall_localSymbol_kummerClass_eq_zero_iff` (`Local/HilbertPairing.lean:61`).
- the valuations:
  - `AlgHom.valuativeExtension` (`LocalField/AlgebraicExtension/Basic.lean:314`) assumes `ValuativeExtension K M`, so it does not settle `algebraMap_vle_…`;
  - `FinitePadicExtension` (`LocalField/AbsoluteRamificationIndex.lean:64`);
- the rest:
  - `ClassFormation.groundInclusion_mem_normSubgroup_of_range_eq_commutator` (`Formation/PrincipalIdeal.lean:67`);
  - `finiteHilbertInvariantAt` (`Global/Hilbert/Invariant.lean:93`);
  - `cyclicHasseNorm` (`Global/HasseNorm/Basic.lean:154`).

Mathlib:
- `IdeleGroup.unitEmbedding` (`NumberTheory/NumberField/AdeleRing.lean:110`);
- `IsGalois.normalBasis` and `normalBasis_apply` (`FieldTheory/Galois/NormalBasis.lean:121,128`);
- `groupCohomology.H1ofAutOnUnitsUnique` (`RepresentationTheory/Homological/GroupCohomology/Hilbert90.lean:107`);
- `IsNonarchimedeanLocalField` (`NumberTheory/LocalField/Basic.lean:46`), which includes `ValuativeRel.IsNontrivial`.

**Cross-roadmap citations resolved.**
- **ProfiniteCohomology on main:**
  - `H1ConjInvariants`, Layer 5 (line 1008);
  - `longExact_exact`, `corestriction_comp_res`, `corestriction_mackey` and `shapiroIso`, Layer 10 (lines 1583, 1647, 1649, 1604);
  - `cd_p_le_of_isClosed`, `cd_p_le_scd_p` and `strictCohomologicalDimensionAt_le_iff_forall_openSubgroup`, Layer 11 (lines 1839–1884);
  - `cup_gradedComm` and `cup_coeffMap`, Layer 12 (lines 2130, 2133);
  - `degreeCast` and `cup_add_left`: see R13.
- **ProfiniteProPGroups** (Completed): `cd_p_eq_of_isProPSylow` and `cd_p_le_iff_elementaryAbelian_of_isProP`.
- **ModularInduction:** `modRepK0`, the three lattice-defect laws and `modularArtin_exists_nsmul_mem_indCyclicCoprime`, at the layers cited.
- **RamificationOfCompleteDiscretelyValuedFields §4a.1 at #1410's head** (README 747–790; `Suggested.lean` 177, 198, 216):
  - the group `absoluteUpperRamificationGroup K O u`;
  - `_zero` against Mathlib's `ValuationSubring.inertiaSubgroup`;
  - `map_restrictNormalHom_…` under the complete-DVR-with-perfect-residue-field hypotheses;
  - the fourth bullet's local-field agreement, which is what `_habs` encodes.
- **The three `citations.md` leads** are ProfiniteCohomology and ProfiniteProPGroups names on main.
- **AnalyticNumberTheoryPartI §2.2a** (open, #1126) owns the Artin-conductor form of the conductor–discriminant formula. It cites ClassFieldTheory Layer 13 for the abelian form (its lines 111 and 1758), so it is not a second owner.

**Sources checked at their locators** (cached texts):
- **`milne-cft`, Chapter III, §2:**
  - Lemma 2.3 (line 4716), a normal-basis lattice with trivial cohomology;
  - Lemma 2.4 (line 4731), proved there in characteristic 0 only, with characteristic `p` referred to Serre;
  - Lemma 2.5 (line 4742), `h(U_L) = 1` and `h(Lˣ) = n`;
  - Lemma 2.6 (line 4751), order `n` by divisibility and solvable induction.

  These support "Local units and the `H²` bound" as written. The README's characteristic-free `1 + A` argument goes beyond Milne's Lemma 2.4 and cites Serre in Cassels–Fröhlich for it.
- **`milne-cft`, Chapters V and VII:**
  - VII Proposition 2.7 (line 9379), Proposition 3.1 (9470), Lemmas 4.1–4.2 (9574, 9583), Theorem 4.3 (9603) and Corollary 4.4 (9619), on printed pp. 206–211, as Layer 10 cites;
  - VII Theorem 5.1 (9665), Proposition 7.2 (9996), Lemma 7.3 (10007), Theorem 8.1 (10042) and Example 8.2 (10059);
  - VII Lemmas 9.1, 9.3 and 9.4 and Theorem 9.5 (10189, 10218, 10279, 10287);
  - V Example 3.11 (line 7121, p. 159), the conductor `(4)·∞` of `ℚ(i)`;
  - V Example 5.4 (line 8142, p. 179), the Hilbert product formula.
- **`milne-cft`, Chapter VIII:** §4, the lcm `n₀` of the local degrees (lines 10902–10915), Lemma 4.1 (10915) and Theorem 4.7 (11011).
- **`milne-adt`:** I Theorem 2.8 (line 1227), `χ(G, M) = (R : mR)⁻¹`, which is the README's `p^{[F:ℚ_p] v_p(#A)}` factor; Lemmas 2.10 and 2.12 (lines 1266, 1350).
- **`kopp-lagarias`:** Theorems 1.1, 1.2 and 1.3 (lines 128, 160, 174), for every order and level datum.

**Adversarial table.** Rows cover the sampled targets, the headlines and every target a finding touches.

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| Layer 1 "Implemented in Tau Ceti" | `G = Ẑ`, `A = ℤ`, `V = mnẐ ≤ U = nẐ`; `V = U`; `G/V ≅ S₃` | `Γ = ℤ/m`, norm `·m`, quotient `ℤ/m = Γ^ab`; trivial; `S₃^ab = C₂`, so the maximal abelian sublayer has index 2 | sound | none |
| Layer 2 "Implemented in Tau Ceti" | unramified degree 6 with `E` of degree 2; corestriction from index 3 | `inv = 1/6`, restriction `2·(1/6) = 1/3` of order 3; `1/2 = 3·(1/6)`; the reversed index `1/3` is not an integer | sound | none |
| Exit criterion, Layer 0 | the four names in `Suggested.lean` | abbreviations of Tau Ceti's at lines 393, 426, 446 and 452 | met; rewording needed after R05 | R05 |
| Exit criterion, Layer 3 / Example | `C₂` on `ℂˣ`; `C₂` trivially on `ℤ/2` | `H¹ = 0`, `#H² = #ℝˣ/ℝ_{>0} = 2 = #Ĥ⁻²`; `H¹ = ℤ/2 ≠ 0`, so the first hypothesis excludes it | sound | R04 (form) |
| "The coefficient objects" | `μ_3` over `ℚ_7`; `μ_3` over `ℚ_2` | `3 ∣ 6`, so the action is trivial; Frobenius acts by `2 ≡ −1`, nontrivially | sound | none |
| "Local units and the `H²` bound" | `L = K`; cyclic of degree `m`; an infinite group | `#H² = 1`; `= m`; `Nat.card = 0`, and `0 ∤ m` | sound | none |
| "The coordinates of `H²(F, μ_n)`" | `ℚ_7`, `n = 3`; `T = 0` | the class of invariant `1/3` has coordinate 1; `H²(F, 0) = 0 ≇ ℤ/p` | sound | none |
| "The Hilbert symbol" | `ℚ_7`, `n = 3`, cyclic algebra (unramified, Frobenius, 7); `ℚ_2` with `(−1,−1)`; `ℚ_p` (odd `p`) with units | invariant `1/3`, coordinate 1 or 2 when negated; 1, since `x²+y² = −1` has no solution; 0 | sound | none |
| "The Tate dual" | `A = μ_3` over `ℚ_2` | `(Frob·φ)(a) = (−1)·φ(−a) = φ(a)`, so `A' = ℤ/3` is trivial | sound | none |
| "The `p`-adic valuation on a finite extension of `ℚ_p`" | `F = ℚ_p`; `F = ℚ_p(√p)`; trivial valuation | `p <ᵥ 1` on both sides; `v_F(p) = 2v_F(√p) > 0`; the trivial valuation is excluded by `IsNontrivial`; independent henselian valuations would make `F` separably closed (F. K. Schmidt) | sound | none |
| "Local duality and the Euler characteristic" | `ℚ_p` (odd `p`), `A = 𝔽_p`; `ℚ_2`, `A = 𝔽_2`; `ℚ_2`, `A = μ_3` | `2 = 1+0+1`; `3 = 1+1+1`; `#H¹ = 3 = 1·3·1` | sound | none |
| The duality Check at lines 1159–1161 | `M = μ_3` over `ℚ_2` | `#H⁰(M) = 1` and `#H⁰(M') = 3`, against the README's "3 and 1" | reversed | R11 |
| Exit criteria, Layers 5 and 7 | the state at the pin | met, while `algebraMap_vle_…` and the three Layer 7 targets are open | incomplete | R12 |
| `map_unitFiltration_normResidue` | `L = K`; unramified; `ℚ_2(√2)` at `n = 2, 3`; `𝔽_p((t))` with `y^p − y = t⁻¹` at `n = 1, 2`; `ℚ_p(ζ_p)` at `n = 0, 1`; `ℚ_2(ζ_8)` at `n = 0..3` | 1; 1; break 2, since `v_L(2√2) = 3`: `G`, 1; break 1: `G`, 1; `G`, 1; `G`, `G`, `{1,σ₅}`, 1 | sound | none |
| Wrong models for the same | lower numbering at `ℚ_2(ζ_8)`, `n = 3`; `U^n ↦ G^{n−1}` at `ℚ_p(ζ_p)`, `n = 1` | `G_3 = {1,σ₅}`, but the image is 1; `G^0 = G`, but the image is 1 | both excluded | none |
| Layer 7 proof route | `H = G^n`, `M = L^H`, `s = ψ_{M/K}(n)` | `(G/H)^n = G^nH/H = 1`; `H^s = G_{ψ_{L/K}(n)} ∩ H = H`; `Art(U_K^n) = Art_{L/M}(U_M^s) = H` | sound | none |
| `sup_norm_unitFiltration_eq_of_upper_eq_top` | `ℚ_2(√2)` at `r = 2` and `r = 3`; `L = K` | norms of units are `±1 mod 8`, `U^(2)` is `{1, 5} mod 8`, together every unit; `G^3 = 1 ≠ G`, so `r = 3` is excluded; `N(U_K) = U_K` | sound, `_htr` redundant | R07 |
| `closure_map_artinMap_unitFiltration` | `n = 0`; the `ℚ_2(ζ_8)` quotient; `_habs` | both sides closed with images `G_0` in every finite quotient; images `G`, `G`, `{1,σ₅}`, 1; `_habs` is an iff, so exactly one subgroup satisfies it | sound | none |
| Filtered-norm Check | `ℚ_2(∛2, ζ_3)` | `e = 3`, `f = 2`, `G_1 = 1`, `φ(u) = u/3`, `ψ(1) = 3`: `N(U_L^(3)) = U^(1)` | sound | none |
| `conductorExponent_eq_sInf…` | unramified; `ℚ_5(ζ_5)`; `ℚ_2(√2)`; `ℚ_2(ζ_8)` | 0, 1, 3, 3 on both sides | sound, padding | R05 |
| `isPrincipal_map_hilbertClassField` | `ℚ` with `(6)`; `ℚ(√−5)` with `I = (2, 1+√−5)`; `I = 0` | `H = ℚ`, principal; `I² = (2)` and `2 = −i(1+i)²`, so `I𝒪_H = (1+i)`; `0` | sound | none |
| The principal ideal theorem's proof route | `H′`, the Hilbert class field of `H` | the maximal abelian subextension of `H′/K` is unramified, so it lies in `H`; hence `Gal(H′/H)` is the commutator subgroup, and the transfer to it is trivial | sound | none |
| `relDiscr_eq_finprod_abelianConductor` | `L = K`; `ℚ(i)`; `ℚ(ζ_5)`; `ℚ(i, √5)` | `⊤ = ⊤`; `(4) = 1·(4)`; `5³ = 1·5·5·5`; `400 = 1·4·5·20 = (−4)(5)(−20)` | sound | none |
| `ringClassField_maximal` | probe P1 | closes with one `exact` | padding | R05 |
| Layer 13 ring-class Checks | `ℚ(√3)`; `ℚ(ζ_7+ζ_7⁻¹)` | `N(2+√3) = 1`, `h = 1`, `h⁺ = 2`; Minkowski bound `(3!/27)·7 = 14/9 < 2` | sound | none |
| Layer 10 Herbrand Check | `ℚ(i)`, `S = {∞, 2}` | `2·2 = 4`; `h(U) = 4/2 = 2`; `h(C) = 4/2 = 2 = [L:K]` | sound | none |
| Layer 10 lifting Checks | `ℚ(√13, √17)`; `ℚ(√2, √3)` | `(17/13) = (4/13) = 1`, 2 inert in one and split in the other, lcm `2 < 4`; 2, 3 and 6 are nonsquares in `ℚ_2`, lcm 4 | sound | none |
| Layer 12 meet formula | two `D₄` extensions sharing a biquadratic `B` | `[G, G]` of `D₄ ×_{V₄} D₄` is the diagonal `C₂`, so `#G^ab = 8 > 4 = [B:K]` | sound | none |
| Layer 12 admissibility | `ℚ(i)` at `(4)`, `(4)·∞` and `1` | ray class group mod `(4)` trivial (use `±a`); mod `(4)·∞` of order 2; 3 is inert, so `Art(3) ≠ 1` | sound | none |
| Layer 14 Checks and `hilbertProductFormula` | `ℚ` with `(−1,−1)`, `(5,5)`, `(3,7)` | `1+1 = 0`; all 0 (`ε(5) = 2`, `(−1/5) = 1`); nonzero exactly at 2 and 7 | sound | R08 |
| Quadratic reciprocity Example | `p = 3`, `q = 7` | `(7/3) = 1`, `(3/7) = −1`, `(−1)^{2·6/4} = −1` | sound | none |
| `cyclotomicCharacter_artinMap_padic` | `ℚ_2`: `u = −1` on `μ_4`; `u = −3` on `μ_16` | `i ↦ −i`; `(−3)⁻¹ ≡ 5 mod 16`, against 13 without the inverse | sound, but `sorryAx` in the general form | R06 |
| `cyclicHasseNorm`, `card_ideleClassNormQuotient` | `ℚ(i)`, `x = 3` and `x = 5` | 3 is no global norm and no local norm at 3 (`v_3` odd, unramified); `5 = N(2+i)`; index 2 | sound | none |
| Layer 6 normalization | `ℚ_2(ζ_5)`; `K = L = ℚ_2` with `m = 2` | `Art(2)`: `ζ₅ ↦ ζ₅²`, and 3 if geometric; the excluded formula would send `−1` to 1 | sound | none |
| Layer 8 conductor Examples | `ℚ_2` with `U^(1)·⟨2⟩`; `ℚ_p(ζ_p)` | `U^(0) = U^(1)`, the trivial extension, conductor 0; `N(1−ζ_p) = p`, index `p − 1`, conductor 1 | sound | none |
| Layer 9 degree | unramified of degree `d` | `deg_K = f·deg_L`: a degree-one element maps to degree `d` | sound | none |

**Ownership against open work.**
- I searched by object over main, the board's packages and the open heads, using the sibling checkouts and `roadmaps grep`/`show` over the 466 open heads. The objects were unit-filtration reciprocity, the principal ideal theorem, the conductor–discriminant formula and the valuation-uniqueness lemma.
- The only second owner found is #1474 (R02).
- PadicPeriodRings (#940), ArithmeticGaloisRepresentations (#856), FilteredLocalGaloisGroups (#1795) and LocalAnabelianGeometry (#1811) consume unit-filtration reciprocity from here.

## Not verifiable

- **Serre, *Local Fields*** (`serre-local-fields`, uncertified, paywalled). Not readable: XV §2 Theorem 2 and Corollary 3 to Theorem 1, V §§3 and 6, VI §3, IV §4, and IX §§3–5.
- **Artin–Tate** (`artin-tate`, waived): XIII §4, the principal ideal theorem; XIV; and Preliminaries §2, Theorem A.
- **Neukirch, Schmidt and Wingberg** (`nsw`, uncertified): (3.3.4), (7.1.8), (7.2.5) and (7.3.1)–(7.3.4).
- **Neukirch, *ANT*** (`neukirch-ant`, uncertified): VII §11.
- **Not in the manifest and not in the sources cache** (publisher pages are paywalled):
  - Engler–Prestel §4.4, F. K. Schmidt's theorem; its mathematical content is checked in the table;
  - Tate 1952 and Nakayama 1957;
  - Rim 1959, Brown, and Lang;
  - Cox, Proposition 7.22;
  - Tate's Corvallis article and Weil 1951;
  - Serre's *Galois Cohomology* and *A Course in Arithmetic*;
  - Serre's and Tate's chapters in Cassels–Fröhlich.

## Source issues

- none
