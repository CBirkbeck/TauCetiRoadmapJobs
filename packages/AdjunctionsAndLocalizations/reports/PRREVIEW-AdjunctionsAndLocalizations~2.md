# Review of AdjunctionsAndLocalizations (pull request #2270 at 7e04598)
Folder: `TauCetiRoadmap/InfinityCategoryTheory/AdjunctionsAndLocalizations/`
**Verdict:** needs changes

Incremental re-review of the 128 lines changed since `04df60e`.

## R01 (P1) — `Suggested.lean` does not build at the pinned Tau Ceti

**Location:** `TauCetiRoadmap/InfinityCategoryTheory/AdjunctionsAndLocalizations/Suggested.lean` lines 10–13 and 15: `public import TauCeti.AlgebraicTopology.Quasicategory.FullyFaithful` … `InitialVertex` … `Limit` … `TerminalVertex` … `SimplicialSet.Fiber`.
**Claim:** The five modules exist at the pin and the file elaborates with `sorry` as the only warning.
**Witness:** Pin `2fd255d` (`lake-manifest.json`): `TauCeti/AlgebraicTopology/Quasicategory/` holds only `Cartesian`, `Core`, `FullSubcategory`, `LocallySmall`, `RightMappingSpace`; no `SimplicialSet/Fiber.lean`. Gate at this head: `imports=5`, `build=11`.
**Repair:** Unchanged from the previous review: rebase onto a main whose Tau Ceti pin contains the five modules and re-run the gate; or, to merge at `2fd255d`, delete the five imports and every declaration using `coslice.IsColimit`, `slice.IsLimit`, `coslice.map`, `IsInitialVertex`, `IsTerminalVertex`, `IsFullyFaithful` or `fiber`, and name each such headline in the module docstring as not statable with its missing carrier.

## R02 (P1) — supplier contracts cite Tau Ceti declarations that are absent at the pin, and the change adds one

**Location:** `README.md` lines 161–168 (`SSet.coslice.map`, `SSet.coslice.IsColimit`, `SSet.slice.IsLimit`, `SSet.IsInitialVertex`, `SSet.IsTerminalVertex`, `SSet.IsFullyFaithful`, `SSet.LeftFibration`, `SSet.RightFibration`), `SSet.fiber`; new at line 300: "Tau Ceti `TauCeti.MarkedSSet.markedAnodyneExtensions` (HTT, Def. 3.1.1.1)".
**Claim:** These are pinned Tau Ceti declarations.
**Witness:** At `2fd255d` none of the ten names occurs in `TauCeti/`; `SimplicialSet/Marked/` holds `Basic.lean`, `Limits.lean`, `MappingSpace.lean` only, and the string `arkedAnodyne` occurs in no file of the pinned Tau Ceti or Mathlib.
**Repair:** As R01 for the nine earlier names. For line 300, at `2fd255d` cite the owner again: "Part CartesianFibrations §5.2 (HTT, Def. 3.1.1.1, marked anodyne maps)"; after a pin bump, confirm the name with `#check` and add it to `### From Tau Ceti`, which does not list it.

## R03 (P2) — objects already owned by BordismFormalGroups on main are planned again without citation

**Location:** `README.md` lines 32–50 (`## Scope and ownership`), which name no roadmap outside the two families; targets §1.1.1, §2.4.1–§2.4.5, §2.7.1, §2.7.3.
**Claim:** This Part is the sole owner of ∞-categorical adjunctions, the localization `C[W⁻¹]` with its universal property, the localization criterion, and derived functors as absolute right Kan extensions.
**Witness:** Main, `TauCetiRoadmap/BordismFormalGroups/README.md` F6.5: line 2064 (enriched Dwyer–Kan localization), 2114 (the localization criterion of HTT 5.2.7.4), 2164 (absolute right Kan extensions for derived functors). The README at this head contains neither "BordismFormalGroups" nor "F6.5".
**Repair:** Unchanged: add to `## Scope and ownership` a bullet "Stated by BordismFormalGroups F6.5" listing the four objects, and for each either cite F6.5 and delete the target, or keep it with one clause saying how it differs (for instance: §1.1.1 is the bicategorical definition, F6.5's is by a mapping-space pairing, compared in §1.3.2). A transfer of ownership to this family instead needs a revision of BordismFormalGroups and EnhancedDerivedSheaves, named in this README's scope.

## R04 (P3) — the module docstring still announces the three deleted definitions

**Location:** `Suggested.lean` lines 33–34: "the definitions of reflective localization, colocalization, localization functor and retract (§2.1)".
**Claim:** The file states definitions of reflective localization, colocalization and retract.
**Witness:** The change deleted `IsReflectiveLocalization`, `IsColocalization` and `IsRetract`; the only §2.1 declaration left is `IsLocalizationFunctor` (line 206).
**Repair:** Replace the clause by "the definition of localization functor (§2.1)".

## R05 (P3) — `exists_leftAdjoint_restrict` is weaker than §1.8.2 and the headline

**Location:** `Suggested.lean` lines 195–198: "`∃ L : funQCat K D ⟶ funQCat K' D, Nonempty (Bicategory.Adjunction L (restrict δ D))`"; `README.md` line 24, "Kan extension along any map is left adjoint to restriction".
**Claim:** The Lean statement has the generality of HTT, Prop. 4.3.3.7.
**Witness:** The conclusion never mentions `IsLeftKanExtensionAlong`: nothing relates `L` to the extensions the hypothesis `h` provides, whereas the source's left adjoint is the functor of left Kan extension along `δ` (HTT, p. 306).
**Repair:** Unchanged: add to the conclusion that for every `F : mappingCylinder δ ⟶ D.obj` with `IsLeftKanExtensionAlong δ F`, the vertex `mappingCylinder.ι₁ δ ≫ F` of `Fun(K′, D)` is joined by an edge with `Edge.IsEquivalence` to the image under `L.hom` of the vertex `mappingCylinder.ι₀ δ ≫ F`. Otherwise say at README line 24 and in the docstring that the headline is stated in its existence form only.

## R06 (P3) — fifteen Lean declarations are not named in the README

**Location:** `Suggested.lean`: `sectionFiberVertex`, `IsCategoricalEquivalence`, `subcomplexOver`, `subcomplexOverCocone`, `IsLeftKanExtensionAt`, `IsLeftKanExtension`, `cylinderAt`, `mappingCylinder` (with `.π`, `.ι₀`, `.ι₁`), `IsLeftKanExtensionAlong`, `funQCat`, `restrict`, `fullSubcategory`, `fullSubcategoryι`, `essImage`, `corestrict`.
**Claim:** Every Lean name appears in the README.
**Witness:** Each of the fifteen names still has 0 backticked occurrences of its own in `README.md` at this head (`fullSubcategoryι` and `corestrict` occur only inside the theorem names at lines 712 and 860).
**Repair:** Unchanged: name `sectionFiberVertex` in §1.6.2; the repeated definitions, the mapping-cylinder declarations, `funQCat` and `restrict` in §1.8.2, one sentence each saying what is repeated from Part InfinityCategoryFoundations §2.1 and Part LimitsAndKanExtensions §7.1; `fullSubcategory`, `fullSubcategoryι`, `essImage`, `corestrict` in §2.3.1.

## R07 (P3) — colocalizations are attributed to a definition that does not contain them

**Location:** `README.md` lines 631–633: "a colocalization when it has a fully faithful left adjoint (HTT, Def. 5.2.7.2, p. 383, where a reflective localization is called a localization)".
**Claim:** HTT, Def. 5.2.7.2 defines colocalizations.
**Witness:** The definition covers only functors with a fully faithful right adjoint; the word "colocalization" does not occur in HTT (previous review, HTT line 17338). The sentence is unchanged at this head.
**Repair:** "… when it has a fully faithful right adjoint (HTT, Def. 5.2.7.2, p. 383, where it is called a localization), and a colocalization when it has a fully faithful left adjoint (the dual notion; HTT does not name it)."

## R08 (P3) — four changed `*Needs:*` lines leave section ids without their Part

**Location:** `README.md` lines 300–302: "Tau Ceti `TauCeti.MarkedSSet.markedAnodyneExtensions` (HTT, Def. 3.1.1.1), §5.3.2 … §6.1.1 … §6.3.1 … and §4.1.1"; lines 452–454: "… (HTT, Prop. 1.2.9.2), §4.2.1 … §4.3.1 … §4.3.2 … §5.4.1 … and §7.6.1"; lines 950 and 990: "… and §5.2.1".
**Claim:** These ids resolve.
**Witness:** `README.md` lines 56–58 (added by this change): a bare `§X.Y.Z` is a target of this Part, which has Layers 1 and 2 only. The ids are Part CartesianFibrations §5.3.2, §6.1.1, §6.3.1, §4.1.1 and Part InfinityCategoryFoundations §4.2.1, §4.3.1, §4.3.2, §5.4.1, §7.6.1, §5.2.1.
**Repair:** Line 300: "…; Part CartesianFibrations §5.3.2 (…), §6.1.1 (…), §6.3.1 (…) and §4.1.1 (…)". Line 452: "Tau Ceti `SSet.slice.homEquiv`, `SSet.coslice.homEquiv` (HTT, Prop. 1.2.9.2); Part InfinityCategoryFoundations §4.2.1 (…), …". Lines 950 and 990: "…; Part InfinityCategoryFoundations §5.2.1 (…)". Also drop the second "Tau Ceti `TauCeti.MarkedSSet`" in the bullet at lines 297–298 and the one at line 830, which repeat line 826.

## R09 (P3) — Cor. 4.3.2.16 is cited at Part LimitsAndKanExtensions §7.4.5, which does not state it

**Location:** `README.md` line 559: "Part LimitsAndKanExtensions §7.4.5 (HTT, Lemma 4.3.2.12, Cor. 4.3.2.16)".
**Claim:** §7.4.5 of that Part states both results.
**Witness:** `TauCetiRoadmap/InfinityCategoryTheory/LimitsAndKanExtensions/README.md` line 877: §7.4.5 is HTT, Lemma 4.3.2.12 only; line 880: Cor. 4.3.2.16 (the section `i_!`) is in §7.4.6, with Prop. 4.3.2.15.
**Repair:** "Part LimitsAndKanExtensions §7.4.5 (HTT, Lemma 4.3.2.12) and §7.4.6 (HTT, Cor. 4.3.2.16)".

## R10 (P3) — `NOTES.md` is not a roadmap file

**Location:** `TauCetiRoadmap/InfinityCategoryTheory/AdjunctionsAndLocalizations/NOTES.md` (63 lines, added since `04df60e`), headed "Notes: Part AdjunctionsAndLocalizations (private)".
**Claim:** The folder holds only roadmap files.
**Witness:** Gate, `stray-files=1`: "NOTES.md: not a roadmap file". Its sections ("Sim-firm review (2026-11-12)", "Needs Tau Ceti pin bump", "README names changed") are process notes.
**Repair:** Delete it; sources are the README's references.

## Previous findings

- R01 — not repaired: `Suggested.lean` lines 10–13, 15 still import the five modules absent at `2fd255d`; gate `imports=5`, `build=11`.
- R02 — not repaired: `README.md` lines 161–168 unchanged; line 300 adds `TauCeti.MarkedSSet.markedAnodyneExtensions`, also absent at the pin.
- R03 — not repaired: `## Scope and ownership` (lines 32–50) names no roadmap outside the two families; "BordismFormalGroups" occurs nowhere in the README.
- R04 — partly repaired: the three declarations and the README clauses are gone; `Suggested.lean` lines 33–34 still read "the definitions of reflective localization, colocalization, localization functor and retract (§2.1)".
- R05 — not repaired: `Suggested.lean` line 198, "`∃ L : funQCat K D ⟶ funQCat K' D, Nonempty (Bicategory.Adjunction L (restrict δ D))`"; README line 24 unchanged.
- R06 — not repaired: none of the fifteen names is backticked in `README.md`.
- R07 — not repaired: lines 631–633, "a colocalization when it has a fully faithful left adjoint (HTT, Def. 5.2.7.2, p. 383, …)".
- R08 — repaired: lines 452, 950, 990 cite "Tau Ceti `SSet.slice.homEquiv`, `SSet.coslice.homEquiv` (HTT, Prop. 1.2.9.2)", both at the pin; the rewording dropped the Part of the ids that follow (this report's R08).

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| `IsLocalizationFunctor` (§2.1.1), after the deletion of `IsReflectiveLocalization` | `L = const₁`, `const₀`, `id` on `N[1]` | `const₁`: `D = Δ[0]`, `g = 1` fully faithful, `f ≫ g = const₁`: true. `const₀`: `g = 0` needs `Map(1,0) = ∅ ≃ pt`: false. `id`: true | body is self-contained; used at lines 263, 287 | none |
| `exists_leftAdjoint_restrict` (§1.8.2) | `K = ∅`, `K′ = Δ[0]`; `∂Δ[1] ⊆ Δ[1]` | `K = ∅`: hypothesis is "`D` has an initial object", conclusion "`D ⟶ Δ[0]` has a left adjoint": equal. `∂Δ[1]`: `(x, y) ↦ (x ⟶ x ⊔ y)` | true; `L` not tied to the extensions | R05 |
| §1.8.1 `*Needs:*`, Part LimitsAndKanExtensions §7.4.5 | sibling lines 877, 880 | §7.4.5: Lemma 4.3.2.12, p. 297. §7.4.6: Prop. 4.3.2.15 and Cor. 4.3.2.16, p. 302 | lemma resolves, corollary misplaced | R09 |
| §2.4.4 `*Needs:*`, Part LimitsAndKanExtensions §7.4.6 | sibling line 880 | §7.4.6 states HTT, Prop. 4.3.2.15 (restriction `K ⟶ K⁰` a trivial fibration) | resolves | none |
| §1.5.1, §2.5.1, §2.5.3 `*Needs:*`, slice universal property | pin `2fd255d` | `SSet.slice.homEquiv`, `Slice.lean:271`: `(X ⟶ slice p) ≃ {τ : join X K ⟶ C // join.inr X K ≫ τ = p}`; `SSet.coslice.homEquiv`, `Coslice.lean:119` | both exist, state HTT 1.2.9.2 | R08 (ids after them) |
| §1.2.1, §2.4.2, §2.6.1 `*Needs:*`, marked simplicial sets | pin `2fd255d`; sibling line 767 | `structure MarkedSSet`, `Marked/Basic.lean:49`, exists; Part CartesianFibrations §5.1.1 now defines cofibrations, so the repointing is right; `markedAnodyneExtensions` absent | one name absent | R02 |

The rows for the untouched statements stand as in the previous review, of `04df60e`.

- Source locators in the changed passages: 6 (HTT, Def. 3.1.0.1, Def. 3.1.1.1, Prop. 1.2.9.2, Lemma 4.3.2.12, Cor. 4.3.2.16, Prop. 4.3.2.15); none was changed by the diff; each was compared with the sibling section now cited.
- Library declarations opened at the pin: 4 in Tau Ceti (`Slice.lean:271`, `Coslice.lean:119`, `Marked/Basic.lean:49`, the listing of `Quasicategory/`); 10 names absent (R02).
- Cross-roadmap citations resolved at the head: Part LimitsAndKanExtensions §7.4.5, §7.4.6; Part CartesianFibrations §5.1.1, §5.2.1, §5.3.2, §6.1.1, §6.3.1, §4.1.1; Part InfinityCategoryFoundations §4.1.1, §4.2.1, §4.3.1, §4.3.2, §5.4.1, §5.2.1, §7.6.1; all exist, one misplaced (R09), ten written without their Part (R08).
- Dependency check: `depcheck: 244 roadmaps, 2197 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Gate: FAIL (`imports=5`, `stray-files=1`, `build=11`; every other check 0). Elaboration stops at line 5 on the missing object file of `TauCeti.AlgebraicTopology.Quasicategory.FullyFaithful`; the `#check` comparison of signatures and the tactic probe could not run. The diff changes no theorem: it deletes three definitions, none used by a remaining declaration.
- Pull request text: the description's 13.5k words for this README (13,522 counted), the pin `2fd255d`, "marked anodyne maps" among the modules newer than the pin, and the named supplier agree with the head; the removed definitions were not named in it.
- Overlap check: read KanQuillen, SimplicialCategories, EnrichedLocalization, ModelCategories (open), BordismFormalGroups, EnhancedDerivedSheaves (main); localization of simplicial categories: EnrichedLocalization (cited); adjunctions, `C[W⁻¹]`, the localization criterion, derived functors as absolute Kan extensions: BordismFormalGroups F6.5 (R03). The diff adds no object.
- Source independence: changed passages only: 9 changed passages (the Conventions sentence on labels, seven `*Needs:*` lines, the Layer 2 dependencies paragraph) compared with 1 source (HTT), none shared: they are citations and the roadmap's own conventions; largest share HTT, 270 of 302 locators as before; the diff adds, removes or reorders no layer, so the contents were not compared again.

## Not verifiable

- Elaboration of `Suggested.lean`, its elaborated signatures and the tactic probe by machine: the imports do not exist at the pin.
- The description's sentence that every file elaborates against Tau Ceti `8b9f13d993`: that commit is not in the pinned checkout.
- The HTT text was not reopened for this round (no text in the sources cache); the six locators in the changed lines are those the previous review read.
- Ownership against pull request #1807 (GeneralizedCohomology G2.1, G2.11): its files were not read.

## Source issues

- none

## For the human reviewers

- **Ownership.** The description asks the maintainers to choose the owner of the generic ∞-categorical material among this family, BordismFormalGroups F6.5 with EnhancedDerivedSheaves (main), and pull request #1807; R03 applies the standing rule in the meantime.
- **Pin.** The folder cannot pass the gate until the repository's Tau Ceti pin moves past `2fd255d`; the description names `8b9f13d993`. The bump is outside the folder.
- **Licence.** Kerodon (kerodon.net, tags 02EK and 02FX) is an online, unrefereed text on its author's site; it was read as an author's page, with no licence statement checked.
- **Arrangement.** `README.md` §1.2–§1.7 run in the order of HTT §5.2.1–§5.2.4, and 270 of 302 locators are to HTT; judged independent in the previous review because of the dependency chain and the sections drawn from elsewhere.
