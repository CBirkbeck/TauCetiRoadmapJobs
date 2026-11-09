# Review of ClassFieldTheory (pull request #617 at de94f01)

**Verdict:** needs changes

This is a full review of `TauCetiRoadmap/ClassFieldTheory/README.md` (1094 lines) and `TauCetiRoadmap/ClassFieldTheory/Suggested.lean` (713 lines, 70 declarations), checked against the pins in `lake-manifest.json` (Tau Ceti `2fd255d`, Mathlib `1b1ccf4`). The folder is byte-identical to the head of the previous review of this pull request (`e2fb851`). Every passage was re-read and every result below was recomputed for this review.

There are eight findings: one P2 and seven P3. The gate fails on `outside-folder` (R02), so the folder cannot be accepted.

## R01 (P2) — `isEquiv_of_henselian` plans a step that LocalFieldsRamificationPartII §4.1 owns, and this roadmap cannot cite it

**Location:** `TauCetiRoadmap/ClassFieldTheory/README.md:513–514`: "continuity of roots over a henselian valued field, which Mathlib proves for complete fields (`IsKrasner.of_completeSpace`) and which this target extends to henselian ones." The target also appears at README:15, 28–31, 501–520 and 536–540, and at `Suggested.lean:40–41` and `:362–373`.

**Claim:** The route of `isEquiv_of_henselian` builds Krasner's lemma and continuity of roots over a henselian rank-one field. LocalFieldsRamificationPartII (a board package in the merge order) owns exactly this in §4.1. That is two owners for one object.

The usual fix, a *Needs:* citation from here, is not available, because it would close a cycle:
- SchemeAndStackFoundations consumes this roadmap.
- LocalFieldsRamificationPartII consumes SchemeAndStackFoundations.

Nothing in this roadmap uses the theorem either. README:536–540 says the route of `valuativeExtension_of_finite` "does not need it", and no roadmap on main or at an open head cites the name. The theorem also sits outside this roadmap's own boundary: README:76 assigns valuations to the LocalFieldsRamification line.

**Witness:**
- LocalFieldsRamificationPartII `README.md:997–1000`: "every normal algebraic extension of a henselian rank-one normed field … satisfies `IsKrasner` without completeness of the base".
- `TauCetiRoadmap/SchemeAndStackFoundations/README.md:424` (main): "From ClassFieldTheory Layers 5 and 10".
- LocalFieldsRamificationPartII `README.md:204–210`: consumes SchemeAndStackFoundations §0.12–§0.13.

**Repair:** either option removes the double owner.
- **Preferred: move the theorem.**
  1. Under *Explicitly outside this roadmap*, add: "F. K. Schmidt's theorem for rank-one henselian valuations, with the henselian Krasner lemma it uses: LocalFieldsRamificationPartII, Layer 4 (beside §4.1)".
  2. Delete `isEquiv_of_henselian` from `Suggested.lean`, from §1 item 1, from the Summary (README:15), from the module docstring (`Suggested.lean:40–41`), from the Layer 5 open targets (README:501–520) and from the alternative-route sentence (README:536–540).

  `valuativeExtension_of_finite` keeps its discreteness route, which uses Hensel's lemma on `𝒪[K]` and no Krasner step.
- **Alternative: keep the theorem here.** State the henselian Krasner lemma as a Layer 5 target of its own, with its locator. LocalFieldsRamificationPartII §4.1 then cites it, which is the allowed direction because that roadmap comes later.

After either repair, ClassFieldTheory has no edge to LocalFieldsRamificationPartII, and the dependency check stays at 0 problems.

## R02 (P3) — Gate `outside-folder`: four `Completed/` files, one of them forced by this folder

**Location:** The gate lists:
- `Completed/LocalFieldsRamification/COMPLETION.md`
- `Completed/LocalFieldsRamification/README.md`
- `Completed/LocalFieldsRamification/Suggested.lean`
- `Completed/LocalGaloisGroups/README.md`

`Completed/LocalGaloisGroups/Suggested.lean` is also edited, at lines 324–326 and 485.

**Claim:**
- The brief names ClassFieldTheory, IntegralLattices and QuadraticFormInvariants as this pull request's folders. These files lie outside all three.
- The `LocalGaloisGroups/Suggested.lean` hunks are forced by this folder. Main declares `h2MuEquivZMod_mixed` as a `Nonempty` theorem and `h2FpEquivZMod_of_mu` with `(ζ) (hζ) (T) (Nonempty (muNRep p F ≅ T))`; this head makes both data.
- That file imports this module and `Completed.LocalFieldsRamification.Suggested`, which is rewritten here, yet the targeted build does not elaborate it.

**Witness:**
- The worker's gate: `outside-folder=4 … FAIL`, every other count 0.
- My rerun: the same four paths, plus the five files of the two sibling folders.
- Main `TauCetiRoadmap/ClassFieldTheory/Suggested.lean:1131–1143` has the old `Nonempty` signatures.

**Repair:** Do one of the following, and in either case add `Completed.LocalGaloisGroups.Suggested` to the targeted build:
- Register `Completed/LocalFieldsRamification` and `Completed/LocalGaloisGroups` as folders of this pull request, each with its own review. The pull request's title makes LocalFieldsRamification its subject.
- Move the LocalFieldsRamification rewrite to a pull request of its own, and keep here only the forced `LocalGaloisGroups` hunks, with that folder registered.

## R03 (P3) — `Suggested.lean` is an API catalogue, and its consumer claim is false

**Location:**
- `Suggested.lean:56–61` and README:94–95: "`LocalGaloisGroups`, `QuadraticFormInvariants` and `GlobalQuadraticForms` import `Suggested.lean` and cite the following names as this roadmap's."
- README:85–87, which says QuadraticFormInvariants compares with "the cohomological `localSymbol` exported here".
- README:1015–1022.

**Claim:**
- **The file is mostly re-exports.** 62 of its 70 declarations re-export Tau Ceti, with no headline needing them: 25 `abbrev`, 8 `def` (one private), 3 `instance`, and 26 theorems each closed by one Tau Ceti term, sometimes after a `rw` of a local definition.
- **The consumer list is false.** At this head, QuadraticFormInvariants imports only Mathlib and Tau Ceti (`TauCetiRoadmap/QuadraticFormInvariants/Suggested.lean:1–13`) and cites `TauCeti.ClassFieldTheory.localSymbol` (its README:336–346).
- **About half the re-exports have no Lean consumer.** In Lean, LocalGaloisGroups uses 19 of the re-exports, plus two of the theorems closed from the comparison, and GlobalQuadraticForms uses 10. That leaves 33 re-exports with no Lean consumer. Seven names have no consumer at all, in Lean or in prose, on main or at any open head: `muNRepCoeffDictionary`, `muNRepCoeffDictionary_continuous`, `muNRepCoeffDictionary_equivariant`, `kummerClass`, `kummerClass_eq_kummerCocycleClass`, `kummerEquiv_mixed_mk` and `iota_restrictAbsolute_apply`.
- **Some copies have drifted from Tau Ceti.**
  - `finite_H` (`:395`) and `scd_p_absoluteGaloisGroup_eq_two` (`:489`) add a finite `ℚ_p`-algebra structure that their own docstrings say Tau Ceti does not need.
  - `cyclotomicCharacter_artinMap_padic_uniformizer` (`:561`) and `cyclotomicCharacter_artinMap_padic` (`:571`) carry `[IsNonarchimedeanLocalField ℚ_[p]]`, which Mathlib already provides as an instance.

**Witness:**
- At `F = 𝔽₃((t))`, `n = 2`: Tau Ceti's `finite_H` applies, since `(2 : F) ≠ 0`. The re-export does not, since there is no `ℚ₃`-algebra.
- Mathlib `NumberTheory/Padics/LocalField.lean:28` is the instance. A scratch `example` without the binder elaborates.

**Repair:** Two options.
- **Preferred: delete the re-exports.** Delete the 62 re-exports and keep the five targets and the three theorems closed from `valuativeExtension_of_finite`. Then:
  - Move `Completed/LocalGaloisGroups/Suggested.lean` and its supplier table (`Completed/LocalGaloisGroups/README.md:171–181`) to the Tau Ceti names given in each docstring. This pull request already edits both files.
  - For GlobalQuadraticForms, state that #1200 merges first, since its head `40494aa` imports no roadmap module, or move its ten uses as well.
  - Rewrite §1's table and §6 to list Tau Ceti names.
- **Minimum.**
  - Drop QuadraticFormInvariants from README:94 and `Suggested.lean:56–57`.
  - Replace "exported here" at README:87 with Tau Ceti's `TauCeti.ClassFieldTheory.localSymbol`.
  - Delete the seven names that have no consumer, together with their rows in §1.
  - Drop the redundant `ℚ_[p]` binder at `:561` and `:571`.

On the refuting instance, QuadraticFormInvariants already builds without this module: GlobalQuadraticForms imports both modules, and the targeted build passed.

## R04 (P3) — Layer 13 routes: one step of each is not at the pin and is not named

**Location:**
- README:811–815: "translated to ideals through `hilbertClassArtinEquiv` for `K` and for `H`".
- README:821–826: "Route: the local formula at each prime and the character dictionary between local and global conductors. *Needs:* …".
- README:884–886 (Layer 13 *Dependencies*) and README:1047.

**Claim:**
- **Principal ideal theorem.** Tau Ceti's class-formation form gives a statement about idele classes. Getting to ideals needs two things:
  - Artin's square: extending ideals `Cl(K) → Cl(H)` corresponds to the transfer `Gal(H′/K)^ab → Gal(H′/H)^ab`;
  - the facts that `H′/K` is normal and that `H` is its maximal abelian subextension.

  No pinned declaration relates `Ideal.map` to idele classes or to `ClassGroup`.
- **Conductor–discriminant formula.** The route needs the global conductor exponent at `v` to equal the local conductor exponent of the completion. The pin has only `≤`.
  - The *Needs:* line also omits two pinned inputs the route uses: the localization of `relDiscr` and the dictionary between the Artin conductor and the conductor of class field theory.
  - The route cites the Layer 8 declaration `conductorExponent_localClassField_le_iff`, but Layer 13's dependencies (README:886, 1047) omit Layer 8, and Layer 8 is not reached transitively.

**Witness:**
- milne-cft lines 7271–7302 (V §3, p. 162): Artin's square. Lines 7305–7309: normality and maximality.
- `…/AdmissibleModulus/Ramification.lean:116` bounds the local conductor one way only.
- No statement under `TauCeti/NumberTheory/ClassFieldTheory/` mentions `Ideal.map`.

**Repair:**
1. **Principal ideal theorem.** State the square and the two field facts as steps of `isPrincipal_map_hilbertClassField`, with "milne-cft V §3, pp. 162–163". Add to its *Needs:*:
   - `TauCeti.ClassFieldTheory.ClassFormation.artinMap_groundInclusion`;
   - `TauCeti.ClassFieldTheory.hilbertClassArtinEquiv_mk` (`ClassFields/RayClassField.lean:277`).
2. **Conductor–discriminant formula.** Add to its *Needs:*:
   - `TauCeti.multiplicity_relDiscr` (`RingTheory/DedekindDomain/Discriminant/Valuation.lean:52`);
   - `TauCeti.ClassFieldTheory.conductorExponent_fixedField_ker` (`Local/Conductor/UpperNumbering.lean:130`);
   - `TauCeti.ClassFieldTheory.IsAdmissibleModulus.conductorExponent_le_exponent`.

   State the reverse inequality as a step, with its route: the modulus with the local conductor exponents and the ramified real places is admissible, because its congruence ideles are local norms everywhere, by `conductorExponent_le_iff` and `conductorExponent_eq_zero_iff`, hence idele norms, by `TauCeti.GlobalNumberFields.mem_range_ideleNormMap_iff`.
3. Add Layer 8 to Layer 13's *Dependencies* and to §7.

Check on `ℚ(ζ₅)/ℚ`: `ℚ₅(ζ₅)/ℚ₅` is tame and totally ramified, so its local conductor exponent is `1`. That equals the exponent of `5` in the conductor `5·∞`, and the formula gives `1·5·5² = 125`.

## R05 (P3) — The Hilbert-class-field splitting criterion follows in ten lines; by §1's own rule it is a Check

**Location:**
- README:39–40 and 827–845;
- the Summary (README:18–19);
- `Suggested.lean:44–46` and `:665–672`.

**Claim:** README:42–45 makes the ray-class splitting criterion a Check because it "follow[s] in a few lines from Tau Ceti's theorems". `ncard_primesOver_hilbertClassField_eq_finrank_iff` is that criterion at the modulus `1`, followed by the generator dictionary. It closes just as quickly, so the roadmap disagrees with itself in calling it an open target.

**Witness:** A ten-line scratch proof elaborates at the pins with no error and no warning. It is the statement exactly as `Suggested.lean:668–672` writes it, proved by:
- `ncard_primesOver_eq_finrank_iff_rayClassArtinMap_idealClass_eq_one`;
- `isAdmissibleModulus_rayClassField`;
- `rayClassArtinEquiv_apply`;
- `idealClass_eq_one_iff` and `isCongrOne_one`;
- Mathlib's `IsFractionRing.coeSubmodule_isPrincipal` and `FractionalIdeal.isPrincipal_iff`.

**Repair:**
1. Delete the theorem from `Suggested.lean`, from §1 item 2, from the Summary and from the module docstring.
2. Restate it as a Layer 13 Check next to the ray-class criterion (README:856–870), naming the declarations above.
3. Keep the `ℚ(√-5)` values: `𝔭₂` and `𝔭₃` each have one prime above them, and `(3 + 2√-5)` has two.

## R06 (P3) — No stated order with #1215 and #1411, and RamificationOfCompleteDiscretelyValuedFields hands Layer 7 an object this head does not own

**Location:**
- The description's merge-order paragraph, which names only #1410.
- README Layer 7 (lines 613–655), which has no absolute upper filtration and no unit-filtration reciprocity.

**Claim:**
- **The other revisions.** #1215 (head `47ea955`) and #1411 (head `15207f6`, draft) also rewrite this README and `Suggested.lean`, and their heads conflict with this one. Both own the absolute upper filtration on a nonarchimedean local field in Layer 7. No head states which pull request rebases on which.
- **The hand-off.** RamificationOfCompleteDiscretelyValuedFields (#1410), which this description says merges first, assigns that filtration to "ClassFieldTheory Layer 7". Merged in that order with this head, its citation would point at nothing.

**Witness:**
- RamificationOfCompleteDiscretelyValuedFields README:19 and 125 (head `8917bb8`): the absolute upper filtration "is ClassFieldTheory Layer 7's".
- #1411 ClassFieldTheory README:137–139 and #1215 README:193 own it.
- `grep -i upper` on this README finds nothing.

**Repair:**
1. State in the description the order of #617, #1215 and #1411.
2. Either adopt the absolute upper filtration (and the unit-filtration reciprocity that comes with it) as a Layer 7 target, as both other heads do, or list it under *Explicitly outside this roadmap* with its owner named, so that RamificationOfCompleteDiscretelyValuedFields can repoint its citation.

## R07 (P3) — The pull request drops "Layer 0, item 4", which another roadmap cites, with no old → new numbering

**Location:** README Layer 0 (lines 327–361), which no longer numbers its items. On main, item 4 of Layer 0 was the generic Tate-cohomology supplier list, ending with Tate's criterion and its Tate–Nakayama generalization.

**Claim:** After this merge, EndoscopicTransferAndUnitaryTraceComparison's citation of "ClassFieldTheory Layer 0, item 4" resolves to nothing.

**Witness:** EndoscopicTransferAndUnitaryTraceComparison README:90, 209 and 217 (head `7205732`) all cite "`TauCetiRoadmap.ClassFieldTheory` §2.4 and Layer 0, item 4 (Tate–Nakayama …)".

**Repair:** Add an old → new line to the README:

> Layer 0, item 4 (generic Tate-cohomology suppliers, Tate's criterion and Tate–Nakayama) → Layer 0, first paragraph, and §2.4.

The content is still there: README:333–335 states that Tau Ceti proves Tate–Nakayama (`cup_bijective_of_forall_isPGroup_of_lTensor_injective`, §3 Layer 0).

## R08 (P3) — README shape: no `## Downstream consumers` section; the definitions are given as a field-list table

**Location:**
- §1 *Consumers, and the names they import* (README:92–110);
- the *Definitions made here* table (README:123–131);
- §6 *Policy for `Suggested.lean`* (README:1010–1030).

**Claim:**
- **No consumer section.** The house shape ends with `## Downstream consumers`. Here consumers appear only as a table of Lean importers. Roadmaps on main that cite Layers 5–7, 10, 13 and 14 by anchor are not listed, among them ClassicalArithmeticCompletion, SchemeAndStackFoundations, ReductiveGroupsPartII and ImaginaryQuadraticClassNumber.
- **A field-list table.** The definitions are a `Definition | API | Checks` table, not prose API bullets with a **Checks.** list. One of its Checks names a Lean declaration ("gives `h2MuEquivZMod_mixed p F p`").
- **A meta section.** §6 restates the house rules for the Lean file, which is not mathematics.

**Witness:** `TauCetiRoadmap/AsymptoticExpansions/README.md` and `TauCetiRoadmap/AffineMorseLefschetz/README.md` (main) end with `## Downstream consumers` and `## References`. README:128 is the Check that names a Lean declaration.

**Repair:**
1. Add `## Downstream consumers`, listing each citing roadmap with the layers it uses.
2. Turn the table into one bullet per definition: its API in prose, then a **Checks.** list with no Lean names. If R03's preferred repair is taken, the definitions and the table go entirely.
3. Fold §6 into one sentence of §4.

## Verified sound

**Gate and dependency check.**
- The worker's gate: every count 0 except `outside-folder=4` (R02), with `build=0`.
- My rerun gives the same four `Completed/` paths. It also lists the five files of the two sibling folders, which are this pull request's own.
- `gate --depcheck … --movable` prints `depcheck: 236 roadmaps, 2306 edges, 0 problem(s)`, with no UPWARD or CYCLE line.
- The suppliers are Mathlib, Tau Ceti and GlobalNumberFields, which is completed and on main. Its Layers 2, 6, 8 and 11 match §3 (`Completed/GlobalNumberFields/README.md:279, 439, 476, 571`).

**Elaboration and signatures.**
- `lake env lean` on `Suggested.lean` exits 0 in 11 s. The only warnings are five `sorry` warnings, at lines 368, 385, 661, 668 and 679.
- The file imports `Mathlib` and 25 existing `TauCeti.*` modules, has no `set_option`, no sorry'd data, and no roadmap import.
- `#check @` on all 68 public declarations, in one scratch file, gives types that match the README. Each declaration carries its binders. For example:
  - `valuativeExtension_of_finite` has `[ValuativeRel] [TopologicalSpace] [IsNonarchimedeanLocalField]` on both `K` and `F`, plus `[Algebra K F] [Module.Finite K F]`;
  - `isEquiv_of_henselian` has `[vᵢ.RankOne]` and `[HenselianLocalRing vᵢ.valuationSubring]`;
  - `isPrincipal_map_hilbertClassField` does not pick up the section's `L`;
  - `relDiscr_eq_finprod_abelianConductor` has `[IsAbelianGalois K L]`.

  Nothing changed.
- **One-tactic probe.** `first | infer_instance | rfl | decide | simp | aesop` fails on `isEquiv_of_henselian`, `valuativeExtension_of_finite`, `isPrincipal_map_hilbertClassField` and `relDiscr_eq_finprod_abelianConductor`. A ten-line proof closes the fifth target (R05).

**Seeded sample of sources.**
- **The comparison of valuations.** jahnke-koenigsmann line 113 (Theorem 2.1, printed p. 3, page marker at line 96; arXiv v4 at line 5) states F. K. Schmidt's theorem for two independent nontrivial henselian valuations. Line 115 proves it by citing Engler–Prestel 4.4.1. In rank one, inequivalent valuations are independent, so the README reading is right. The discreteness route of `valuativeExtension_of_finite` was checked step by step (table below).
- **The cyclotomic normalization.** milne-cft lines 10059–10076 (VII Example 8.2, PDF p. 230 = printed p. 221) give `φ_l(u l^s) = [u⁻¹]` at the totally ramified prime. Lines 10085–10109 (p. 222) give the product check. Milne CFT is v4.03 (line 7).
- **Layer 13 open targets.**
  - V Theorem 3.17, line 7252, p. 161;
  - V Theorem 3.27, line 7423, and Remark 3.28, line 7436, p. 165;
  - V §1, line 6865, p. 154 (complete splitting ⇔ trivial Frobenius);
  - V Theorem 3.6, line 7051, p. 158;
  - V Example 3.9, line 7092, p. 159 (Hilbert class field of `ℚ(√-5)` is `ℚ(√-5, √-1)`).
- **Also checked.**
  - milne-cft II Theorem 3.11, line 3911, p. 84;
  - milne-adt I Corollary 2.3, line 1138, p. 28;
  - milne-adt I Theorem 2.8, line 1227, p. 31;
  - kopp-lagarias Theorems 1.1–1.3, lines 128–168, pp. 3–4, arXiv v3.
- The README flags no locator as unverified.

**Library declarations opened at the pin.**
- **Mathlib:**
  - `RingTheory/Valuation/ValuativeRel/Basic.lean:1252` (`ValuativeExtension.vle_iff_vle`);
  - `NumberTheory/LocalField/Basic.lean:46` (extends `IsValuativeTopology`, `LocallyCompactSpace` and `ValuativeRel.IsNontrivial`) and `:142` (`Finite 𝓀[K]`);
  - `RingTheory/Valuation/RankOne.lean:56` (`RankOne` extends `IsNontrivial`);
  - `NumberTheory/Padics/LocalField.lean:28`;
  - `Analysis/AbsoluteValue/Equivalence.lean:413`;
  - `Analysis/Normed/Field/Krasner.lean:117`.
- **Tau Ceti, under `TauCeti/`:**
  - `NumberTheory/LocalField/AbsoluteRamificationIndex.lean:64` (`FinitePadicExtension` bundles `ValuativeExtension ℚ_[p] K`);
  - `NumberTheory/LocalField/AlgebraicExtension/Basic.lean:130, 254, 314`: `algebraicExtensionValuation_isEquiv` assumes compatibility on `K`, so the comparison is genuinely open;
  - `NumberTheory/LocalField/NormalizedValuation.lean:114`;
  - `NumberTheory/LocalField/Henselian.lean:41`;
  - `NumberTheory/LocalField/FiniteExtension/Basic.lean:54`;
  - `NumberTheory/ClassFieldTheory/Local/EulerCharacteristic/Theorem.lean:98, 110`;
  - `NumberTheory/ClassFieldTheory/Local/ExplicitCyclotomicSymbol/ArtinMap.lean:294, 311`;
  - `NumberTheory/ClassFieldTheory/Formation/PrincipalIdeal.lean:67`;
  - `NumberTheory/ClassFieldTheory/ClassFields/RayClassField.lean:241, 262, 277, 362`;
  - `NumberTheory/ClassFieldTheory/Global/AdmissibleModulus/Basic.lean:161, 193, 214`;
  - `NumberTheory/ClassFieldTheory/Global/AdmissibleModulus/Ramification.lean:116`;
  - `NumberTheory/ClassFieldTheory/Global/AdmissibleModulus/Reciprocity.lean:257`;
  - `NumberTheory/ClassFieldTheory/Global/Formation.lean:162`;
  - `NumberTheory/ClassFieldTheory/Local/Conductor/UpperNumbering.lean:121, 130`;
  - `NumberTheory/LocalField/Discriminant/Conductor.lean:58`;
  - `RingTheory/DedekindDomain/Discriminant/Basic.lean`: `relDiscr` is the relative norm of the different, and `relDiscr_self = ⊤`;
  - `RingTheory/DedekindDomain/Discriminant/Valuation.lean:52`;
  - `NumberTheory/NumberField/Discriminant/FixedField.lean:109`;
  - `NumberTheory/NumberField/Global/RayClass/Modulus.lean:100` (`finitePart : Ideal (𝓞 K)`).
- A scan of every theorem and definition statement under `TauCeti/NumberTheory/ClassFieldTheory/` for `Ideal.map`, `ClassGroup.map` and `IsPrincipal` finds only `ringClassArtinMap_eq_one_iff` (`ClassFields/RingClass/Field.lean:276`). That theorem is about principality in an order, not about extending ideals (R04).
- A mechanical pass over the 528 backticked tokens of the README resolves every Lean name by its last component at the pins. The 15 that do not resolve are roadmap names and words.

**Citations, ownership and overlaps.**
- `roadmaps resolve` reports nothing unresolved.
- I searched main, the 465 open heads and the board's packages by object:
  - `valuativeExtension_of_finite`, the automatic `ValuativeExtension`, has no other owner.
  - F. K. Schmidt's theorem is stated nowhere else. HigherLocalClassFieldTheory (#1813, `Suggested.lean:100`) uses it in a route without stating it. The Krasner step is R01.
- The overlap file's two conflicting pull requests are confirmed (R06), and so are its "None" lines for ids cited by this README. Its "None" for ids this pull request drops misses Layer 0 item 4 (R07). Anchor citations of Layers 5–7, 10, 13 and 14 from main roadmaps still resolve, since the heading texts are unchanged.
- Every `LocalFieldsRamification.*` name that `Completed/LocalGaloisGroups/Suggested.lean` uses is still declared in the rewritten `Completed/LocalFieldsRamification/Suggested.lean`. This is a static check.

**Adversarial table.** It covers the sampled targets, the headline theorems and every target a finding touches.

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| `isEquiv_of_henselian` | `ℚ`, `v₂` and `v₃` | `X²−X+2 ≡ X(X+1) mod 2`, discriminant `−7` not a rational square; `X²−7 ≡ (X−1)(X+1) mod 3`, `√7 ∉ ℚ` | neither ring is henselian, so hypothesis needed; Check correct | none |
| same | `ℚ̄`, extensions of `v₂` and `v₃` | henselian (algebraically closed), value group `ℚ`, residue characteristics `2 ≠ 3` | `¬IsSepClosed` needed; Check correct | none |
| same | `𝔽_q`; `ℚ₂(i)` with its own valuation and `algebraicExtensionValuativeRel` | `𝔽_q` has only the trivial valuation, so `RankOne` (`⊇ IsNontrivial`) is empty; on `ℚ₂(i)` both give `w(1+i) = 1/2`, `w(2) = 1` | vacuous; equivalent | R01 (ownership only) |
| `valuativeExtension_of_finite`, unit step | `ℚ₃`, `u = 2`, `ℓ = 2`; `ℚ₂`, `u = −3`, `ℓ = 3` | `q−1 = 2`, `u² = 4 ≡ 1 mod 3`, derivative `2^k` a unit in `ℤ₃`; `q−1 = 1`, `−3 ∈ 1+4ℤ₂ ≅ ℤ₂`, divisible by `3^k` | `w(u) = 0` | none |
| same, `ℓ = p` | `ℚ₂`, `u = 3`, `ℓ = 2` | unit squares are `≡ 1 mod 8`, `3 ≢ 1` | `ℓ ≠ p` needed; Check correct | none |
| same, ramified | `ℚ₂(i)/ℚ₂` | `w(2) = 2`, `v(2) = 1` | `2 <ᵥ 1` on both sides: a relation, not a normalization | none |
| same, inseparable | `t ↦ t^p` on `𝔽_p((t))` | degree `p`, `w(t^p) = p > 0` | separability not needed; Check correct | none |
| same, minimal-polynomial step | `w ≡ 0` on `Kˣ`, `α ∈ Fˣ` | `w(α) < 0`: `n·w(α) < i·w(α)` for `i < n`; `w(α) > 0`: `w(c₀) = 0 <` the other terms | contradiction, so `w(ϖ) > 0` | none |
| same, trivial relation on `F` | `1 ≤ᵥ algebraMap ϖ` | holds in `F`, fails in `K` | excluded by `IsNontrivial` in `IsNonarchimedeanLocalField` | none |
| `eulerCharacteristic_mixed` | `ℚ_p` with `ℤ/p`, `p` odd; `ℚ₂` with `ℤ/2`; `ℚ_p` with `ℤ/ℓ`, `ℓ ∤ p(p−1)` | `p² = p·1·p`; `8 = 2·2·2`; `ℓ = ℓ·1·1` | true | none |
| `eulerCharacteristic_finrank_fp` | `ℚ₂`, `𝔽₂`; `ℚ₂(i)`, `𝔽₂`; `ℚ₃`, `𝔽₃` | `3 = 1+1+1`; `#F×/F×² = 2^{2+2}`, so `4 = 1+1+2`; `#ℚ₃×/ℚ₃×³ = 9`, so `2 = 1+0+1` | true | none |
| `cyclotomicCharacter_artinMap` | `ℚ₂`, `u = −3` and `u = −1` on `μ₁₆`; `ℚ₂(i)`, `u = i`; `u = 1+i` | `13·5 = 65 ≡ 1`, so `5` (with no inverse, `13`); `−1`; `N(i) = i·(−i) = 1`; `|1+i| = 2^{−1/2}` | inverse required; non-units excluded by `hu` | none |
| `cyclotomicCharacter_artinMap_padic_uniformizer` | `ℚ_l`, `a = l` (`u = 1`, `s = 1`) | milne-cft line 10075: `φ_l(l) = [1]` | `χ = 1` | R03 (binder) |
| `isPrincipal_map_hilbertClassField` | `ℚ(√−5)`: `𝔭₂`, `𝔭₃`; `I = ⊥`; `K = ℚ` | `𝔭₂² = (2) = (−i(1+i)²)`, so `𝔭₂𝒪_H = (1+i)`; `N(1+√−5) = 6`, `𝔭₂𝔭₃ = (1+√−5)`, so `𝔭₃𝒪_H = ((1+√−5)/(1+i))`; `⊥ ↦ ⊥`; `H = ℚ` | true | R04 (route) |
| `ncard_primesOver_hilbertClassField_eq_finrank_iff` | `ℚ(√−5)`: `𝔭₃`, `(3+2√−5)`; `K = ℚ` | `3 ≠ a²+5b²`, so not principal and inert: ncard `1 ≠ 2`; norm `29 = 9+20`, `(−5/29) = (−1/29)(29/5) = 1`, ncard `2`; `1 = 1` | the iff holds in both directions; ten-line proof | R05 |
| `relDiscr_eq_finprod_abelianConductor` | `ℚ(ζ₅)`; `ℚ(ζ₈)`; `ℚ(√−3)`; cubic subfield of `ℚ(ζ₇)`; `L = K` | `1·5·5² = 125`; `1·4·8·8 = 256 = 2⁸`, the `V₄` top field excluded; `1·3`; `7^{φ(3)} = 49`; `⊤ = ⊤` | true | R04 (route) |
| `hilbertProductFormula` | `(3,7)`; `(−1,−1)` over `ℚ` | `(3,7)₂ = (−1)^{1·3} = −1`, `(7/3) = 1`, `(3/7) = −1`, `∞: +`, giving `1,0,1,0`, sum `0`; `(−1,−1)`: `1` at `2` and `∞` | true | R03 (re-export) |
| `finite_H` (re-export) | `F = 𝔽₃((t))`, `n = 2` | `(2 : F) ≠ 0`, so Tau Ceti's applies; no `ℚ₃`-algebra, so the re-export does not | narrower than Tau Ceti | R03 |
| `kummerClass`, `kummerEquiv_mixed` Checks | `ℚ₂`, `n = 2`; `ℚ₃` | `−7 ≡ 1 mod 8` is a square; `#ℚ₂×/ℚ₂×² = 8`; `#ℚ₃×/ℚ₃×² = 4` | correct | R03 |
| `kummerCupPairing` Check | `ℚ₇`, `n = 3` | `7 ≡ 1 mod 3`; `(ζ²)² = ζ⁴ = ζ`, so `log_{ζ²}ζ = 2` | the root is data | R03 |
| Layer 2 example | `[U:V] = 4`, `[U:U′] = 2`, `[V:V′] = 3` | `res`: `2·¼ = ½ = 1/[U′:V]`; `cor`: `½ = 2·¼`; `inf`: `¼ = 3·(1/12)` | correct | none |
| Layer 5 example | `ℚ₂`, `A = ℤ/3` twisted | Frobenius acts on `μ₃` by `x ↦ x² = x⁻¹`, so `A ≅ μ₃`; `#H⁰(A) = 1`, `#H⁰(Aᴰ) = 3` | duality `#H² = #H⁰(dual)` holds | none |
| Layer 10 example | `ℚ(√13, √17)` | at `2`: `13 ≡ 5 mod 8` inert, `17 ≡ 1 mod 8` split; `(17/13) = (4/13) = 1`, `(13/17) = 1`; all decomposition groups have order `≤ 2` | `H²(I_L)` killed by `2`, `H²(C_L)` of order `4` | none |
| Layer 12 example | two `D₄` fields over one `V₄` | `D₄` has class two, so `[(a,b),(c,d)] = ([a,c],[b,d])` lies on the diagonal of `Z×Z`; `[G,G]` has order `2`, `|G^{ab}| = 16/2 = 8 > 4` | correct | none |
| Layer 13 examples | `25` in `ℚ(√13, √17)`; ray modulus `4∞` against `4` | every local degree `≤ 2` and `25 = 5²`; `(ℤ/4)ˣ`, `5 = (2+i)(2−i)`; at `4`, `−3 ≡ 1`, trivial group | correct | none |
| §5.6 transfer | `C₄ = ⟨g⟩ → ⟨g²⟩`; `V₄ → C₂` | `V(g) = (g·g⁻¹)(g²·1) = g²`; abelian of index 2, so `V(g) = g² = 1` | correct | none |
| §5.7 | narrow Hilbert class field of `ℚ(√3)`; orders `ℤ[√−3]`, `ℤ[2i]` | `N(2+√3) = 1`, narrow class number `2`; `ℚ(√3,i) = ℚ(√3,√−3)`, unramified over `ℚ(√3)` at `2` and `3`; `h = 1·2·(3/2)/3 = 1`, `h = 1·2·1/2 = 1` | correct | none |

## Not verifiable

- **Engler–Prestel, *Valued Fields*, Theorem 4.4.1.** Uncertified (paywalled), cited by locator only. Its only corroboration is jahnke-koenigsmann line 115.
- **NSW (7.1.8), (7.2.5); Serre, *Local Fields*; Neukirch, *Algebraic Number Theory*.** Uncertified. Artin–Tate is waived. Each is cited by locator only, for material Tau Ceti proves at the pin.
- **Works the README cites that are not in the manifest, and were not read:**
  - Tate (1952) and Nakayama (1957);
  - Brown, *Cohomology of Groups*;
  - Rim (1959);
  - Lang, *Algebra*;
  - Cox, *Primes of the Form x² + ny²*;
  - Weil (1951);
  - Tate, *Corvallis*;
  - Serre, *Galois Cohomology*.

  All of them back statements that Tau Ceti proves at the pin.
- **Elaboration of `Completed/LocalGaloisGroups/Suggested.lean`.** Its imports have no object files here: the ProfiniteCohomology, ProfiniteProPGroups and LocalFieldsRamification `Suggested` modules. Building roadmap modules is outside the commands this review may run, so only the static name check above was done (R02).

## Source issues

- none
