# Review of DerivedInfinityCategories (pull request #2270 at 7e04598)
Folder: `TauCetiRoadmap/InfinityCategoryTheory/DerivedInfinityCategories/`
**Verdict:** needs changes

Incremental re-review of the 131 lines changed since `04df60e`.

## R01 (P1) — `Suggested.lean` still does not build at the pins

**Location** `TauCetiRoadmap/InfinityCategoryTheory/DerivedInfinityCategories/Suggested.lean` lines 10, 13, 14, 15, 16: `public import TauCeti.AlgebraicTopology.Quasicategory.CategoricalEquivalence` (and `…FullyFaithful`, `…InitialVertex`, `…Limit`, `…SimplicialSet.InternalHom`).
**Claim** Every imported `TauCeti.*` module exists at the pinned Tau Ceti and the targeted build passes.
**Witness** `lake-manifest.json` at this head still pins Tau Ceti `2fd255d9`; its `TauCeti/AlgebraicTopology/Quasicategory/` holds only `Cartesian`, `Core`, `FullSubcategory`, `LocallySmall`, `RightMappingSpace`. Gate: `imports=5`, `build=11`.
**Repair** Merge a main whose manifest pins a Tau Ceti commit containing the five modules (the description names `8b9f13d993`), then rerun the gate; until then, remove the declarations that need them and name them in the module docstring as not statable at the pin.

## R02 (P2) — Five objects already owned by EnhancedDerivedSheaves on main

**Location** `README.md` §1.2.2, §2.4.1–§2.4.3, §6.2.1, §6.5.1–§6.5.3, §6.6.2, §6.8.1; `## Scope and ownership` (lines 34–44) does not name EnhancedDerivedSheaves.
**Claim** This Part owns the equivalence θ, stability of dg nerves of complexes with the triangulated comparison, the injective model structure, `D(A)` with its homotopy category and localization, and presentability of `D(A)`.
**Witness** Main (`8a42212`) `TauCetiRoadmap/EnhancedDerivedSheaves/README.md`: line 336 `dgNerve_coherentNerveEquivalence`; 348 `dgNerve_shift_cone_comparison`; 538 `replacementDGComparison`; 553–555 `enhancedDerived`, `enhancedDerived.homotopyCategory`; 567 `enhancedDerived_isPresentable`.
**Repair** Add to `## Scope and ownership`: "EnhancedDerivedSheaves owns the comparison `θ : N(C_Δ) → N_dg(C)` (E0.6), stability of the dg nerve of a dg category of complexes closed under zero, shifts and cones, with suspension the shift, cofibers the cones and the comparison with Mathlib's triangulation (E0.6), the injective model structure on unbounded complexes of a Grothendieck abelian category (E1.2), and `D(A)` with its homotopy category, its localization at quasi-isomorphisms, its stability and its presentability (E1.3); this Part cites them." Then delete §1.2.2, §2.4.1, §2.4.3, §6.5.2, §6.5.3, §6.6.2 and §6.8.1 as targets and cite E0.6, E1.2, E1.3 in the `*Needs:*` lines that used them; keep §2.4.2 and §6.2.1 only for what main does not state (the explicit `CommShift` isomorphism at 1; left properness and the two small generating classes), each opening with that clause. Drop `isStable_dgNerve_cochainComplex`, `exists_isPushoutSquare_mappingCone`, `isStable_derivedInfty`, `nonempty_homotopyCategory_derivedInfty_equiv` and `exists_isLocalizationAt_quasiIso_derivedInfty` from `Suggested.lean`, or move ownership in a revision of EnhancedDerivedSheaves that the description names.

## R03 (P2) — Contracts list Tau Ceti declarations that the pin does not have

**Location** `README.md` lines 116–124: "At the pinned Tau Ceti: … `CategoryTheory.EnrichedFunctor.mapDGNerve`, `TauCeti.DGFullSubcategory.dgNerveIso` …"; line 40: "its reduction to a small set of monomorphic quasi-isomorphisms".
**Claim** The eleven names are declarations of the pinned Tau Ceti.
**Witness** No occurrence in `TauCeti/` at `2fd255d9` of `mapDGNerve`, `dgNerveIso`, `isInitialVertex_cochainComplex_of_isZero`, `isTerminalVertex_cochainComplex_of_isZero`, `rightMappingSpaceIsoCochainToSSet`, `rightMappingSpacePiAddEquivHomology`, `ihomObj₀Equiv`, `IsFullyFaithful`, `IsCategoricalEquivalence`, `monoQuasiIsoOfCardinalLT`, `exists_rlp_monoQuasiIsoOfCardinalLT_eq`.
**Repair** With the pin bump of R01 the list stands as written. Without it, move the eleven facts out of `### From Tau Ceti` and state each as a target of the layer that first uses it (§1.1.3, §2.1.1, §2.4.1, §6.2.1), and strike the clause of line 40.

## R04 (P3) — §4.5.2 and §6.5.3 now claim a triangulated equivalence with neither a route, a locator nor `*Needs:*` items for it

**Location** `README.md` line 434: "equivalent to Mathlib's `DerivedCategory.Minus A` as a triangulated category: the equivalence commutes with the shifts … (HA, Remark 1.3.2.9, p. 89)"; line 629 likewise; `*Needs:*` lines 436 and 631.
**Claim** The stated route, locator and `*Needs:*` items cover the commutation with shifts and the preservation of distinguished triangles.
**Witness** Lines 436 and 631 are unchanged from `04df60e`: no §2.4.2, §2.4.3, §4.4.1, §6.5.2, nor Part StableInfinityCategories §1.7. HA lines 3404–3407 (Remark 1.3.2.9) identify the homotopy category only; no shift or triangle is mentioned.
**Repair** Line 434, after "construction (∗) of §4.5.1 (HA, Remark 1.3.2.9, p. 89)", add: "No source states the triangulated compatibility; it restricts Φ of §2.4.2 and §2.4.3 to the stable subcategory `D⁻(A)` of §4.4.1, on which Mathlib's localization functor to the derived category is triangulated." Line 436, append: "; for the triangulated compatibility, §2.4.2, §2.4.3, §4.4.1 (HA, Cor. 1.3.2.18); Part StableInfinityCategories §1.7 (HA, Thm. 1.1.2.14); Mathlib `CategoryTheory.Functor.IsTriangulated`, `CategoryTheory.Functor.CommShift`". Line 629 and line 631: the same with §6.5.2 (HA, Prop. 1.3.5.9) in place of §4.4.1.

## R05 (P3) — Supplier contracts lack three items that `*Needs:*` lines cite

**Location** `README.md` lines 304, 308, 315, 339: "Tau Ceti `TauCeti.MarkedSSet` (HTT, Def. 3.1.0.1)"; line 413: "Mathlib `CochainComplex.IsKProjective`, `CochainComplex.isKProjective_of_projective`"; line 504: "Part KanQuillen §1.3.3 (Whitehead's theorem)".
**Claim** `## Exact supplier contracts` names every declaration and section consumed.
**Witness** `### From Tau Ceti` (lines 114–124) has no `MarkedSSet`; `### From Mathlib` (lines 93–110) no `IsKProjective`; line 150, Part KanQuillen: "(§3.1, §3.2, HTT, §A.2.7), its properness (§3.4); Postnikov towers … (§5.1–§5.3)", no §1.3.
**Repair** `### From Tau Ceti`, add: "- marked simplicial sets `TauCeti.MarkedSSet` (`TauCeti/AlgebraicTopology/SimplicialSet/Marked/Basic.lean`; HTT, Def. 3.1.0.1);". `### From Mathlib`, add: "- K-projective complexes: `CochainComplex.IsKProjective` and `CochainComplex.isKProjective_of_projective`, a bounded-above complex of projectives is K-projective (`Algebra/Homology/HomotopyCategory/KProjective.lean`);". Line 150, after "(§3.4);" add "Whitehead's theorem (§1.3);".

## R06 (P3) — Thirteen `Suggested.lean` definitions are not named in the README

**Location** `Suggested.lean` lines 106–176 and 529: `IsLimitDiagram`, `spanCoord₁`, `spanCoord₂`, `cospanCoord₁`, `cospanCoord₂`, `coconeShape`, `coneShape`, `IsPushoutSquare`, `IsPullbackSquare`, `IsZeroObject`, `IsPointed`, `corner`, `IsSubcategoryLocalization`.
**Claim** Every Lean name appears in the README.
**Witness** `grep` of each name in backticks in `README.md` at this head: 0 hits for each of the thirteen; line 245 names only `IsStable`, line 635 only `IsReflectiveSubcategory`.
**Repair** Line 245, append: "together with its helpers `IsLimitDiagram`, `spanCoord₁`, `spanCoord₂`, `cospanCoord₁`, `cospanCoord₂`, `coconeShape`, `coneShape`, `IsPushoutSquare`, `IsPullbackSquare`, `IsZeroObject`, `IsPointed` and `corner`, of Parts InfinityCategoryFoundations §1.2 and StableInfinityCategories §1.1". Line 635, after `IsReflectiveSubcategory`, append: "and `IsSubcategoryLocalization`".

## R07 (P3) — `NOTES.md` is not a roadmap file

**Location** `TauCetiRoadmap/InfinityCategoryTheory/DerivedInfinityCategories/NOTES.md` (51 lines, new at this head): "# Notes on the DerivedInfinityCategories draft (Linear-Firm, position 13)".
**Claim** The folder holds only roadmap files.
**Witness** Gate `stray-files=1`: "NOTES.md: not a roadmap file". The file is process narrative (dated polish passes, plan label lists, a review round).
**Repair** Delete it; sources are the README's references.

## Previous findings

- R01 — not repaired: the manifest pins Tau Ceti `2fd255d9`; lines 10, 13–16 of `Suggested.lean` import five modules absent there (R01).
- R02 — not repaired: `## Scope and ownership` does not name EnhancedDerivedSheaves; §1.2.2, §2.4, §6.2.1, §6.5, §6.6.2, §6.8.1 stand as targets (R02).
- R03 — not repaired: "At the pinned Tau Ceti: …" still lists the eleven names (R03).
- R04 — partly repaired: §4.3.1 "A route: P is K-projective by Mathlib's `CochainComplex.isKProjective_of_projective` …", `*Needs:*` updated; `### From Mathlib` does not list the two declarations (R05).
- R05 — repaired: "a homotopy inverse as functorial fibrant replacement in B, then the right adjoint, then functorial cofibrant replacement in A".
- R06 — partly repaired: "the Bergner model structure (§5.4, §5.8, …)"; the KanQuillen line still lacks Whitehead's theorem (§1.3) (R05).
- R07 — repaired: "Part InfinityTopoi §12.2.1 (Postnikov sections are truncations) and §12.2.2 (HTT, Lemma 6.5.1.2)".
- R08 — repaired: "(not stated in the sources; from HA, …)" and "(no source states this; …)" at lines 249, 261, 341, 571; no "manual" remains.
- R09 — not repaired: none of the thirteen names occurs in the README (R06).
- R10 — repaired: the description lists "E0.6's comparison `θ` … and the stability of the dg nerve with its triangulated comparison", "E1.2's injective model structure … and E1.3's `D(A)` …".

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §4.3.1, new route (HA Lemma 1.3.2.20, p. 92) | P = ℤ[0], Q = (ℤ →2 ℤ), Q' = ℤ/2[0]; P = ℤ/2[0] | Map(P, Q) = Q, H_0 = ℤ/2 = Map(P, Q'); for ℤ/2: Hom(ℤ/2, Q) = 0 against ℤ/2, fails without projectivity | route sound; Mathlib `IsStrictlyLE d` = "`P_n = 0` for n ≪ 0" | R05 (contract) |
| §3.4.1, new route (HA Lemma 1.3.4.21, pp. 117–118) | HA line 4432 | HA: fibrant replacement Q, then G, then cofibrant replacement P; README now the same order | agrees | none |
| §4.5.2 (HA Remark 1.3.2.9, p. 89) | Mathlib right side; HA lines 3404–3407 | `t.minus.IsTriangulated` (`TStructure/TruncLTGE.lean:638`), `Pretriangulated P.FullSubcategory` (`Triangulated/Subcategory.lean:667`): right side triangulated; HA: categories only | statement meaningful, route and Needs short | R04 |
| §6.5.3 (HA Props. 1.3.5.14, 1.3.5.15, p. 127) | HA lines 4793–4822 | HA gives the underlying ∞-category statement; no shift or triangle; Needs line 631 has no §2.4.3, §6.5.2 | as §4.5.2 | R04 |
| §6.8.4 dictionary under §6.5.3 | ℤ in HA degree 1 | cochain degree −1, lies in HA `D(A)_{≥1}` and Mathlib `le (−1)`, not `le (−2)` | agrees | none |
| Line 196, Part InfinityCategoryFoundations §2.7.1 (HTT, Prop. 1.2.4.1) | sibling line 928 | §2.7.1 is the characterization of equivalences in a locally Kan simplicial category, simplicial analogue of HTT Prop. 1.2.4.1 | agrees | none |
| §2.1.1 → `TauCeti.linearHomComplexEnrichedCategory` in ten `*Needs:*` lines | pin | instance at `TauCeti/Algebra/Homology/LinearHomComplex/Enrichment.lean:122`; `DGSimplicialCategory` at `CategoryTheory/DG/Simplicial.lean:51` | exist at `2fd255d9` | none |
| Part CartesianFibrations §5.1.1 → `TauCeti.MarkedSSet` | pin; sibling line 767 | structure at `…/SimplicialSet/Marked/Basic.lean:49`; sibling §5.1.1 now defines cofibrations, not marked simplicial sets | repoint correct | R05 (contract) |
| §7.4.3 → §7.4.6, §7.1.1 → §7.1.4, §1.1.1 → §1.1 | sibling lines 880, 1443, 472–476 | LimitsAndKanExtensions §7.4.6 is HTT Prop. 4.3.2.15; AccessibleInfinityCategories §7.1.4 is HTT Prop. 5.4.6.6; size is the prose of InfinityCategoryFoundations §1.1 | agree | none |

The rows for untouched statements stand as in the previous review, of `04df60e`.

- Source locators checked against the text: 4 (HA Remark 1.3.2.9, Lemma 1.3.2.20, Lemma 1.3.4.21, Prop. 1.3.5.15), in the author's PDF; of the seeded sample, §4.3 and §4.5 fall in the changed passages.
- Library declarations opened at the pins: 7 (`CochainComplex.isKProjective_of_projective` at `Mathlib/Algebra/Homology/HomotopyCategory/KProjective.lean:114`, `IsKProjective` at line 42, `DerivedCategory.Minus` at `…/DerivedCategory/TStructure.lean:198`, and the four of the table).
- Cross-roadmap citations resolved: 7 changed ones in five sibling Parts at this head; all resolve.
- Dependency check: `depcheck: 244 roadmaps, 2197 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Gate: FAIL (`imports=5`, `build=11`, `stray-files=1`); every other counter 0. Elaboration, the `#check` comparison and the one-tactic probe could not be run (R01). The diff changes no Lean statement, only the module docstring.
- Pull request text: the word count (20.0k), "adds only the new family folder" (no file changed outside it) and the supplier list agree with this head.
- Overlap check: read EnhancedDerivedSheaves (main, lines 336–567) again; θ, the stable sign comparison, the injective model structure, `D(A)` with its homotopy category and its presentability: owner EnhancedDerivedSheaves (R02); EnrichedLocalization, SimplicialCategories, KanQuillen, ModelCategories, BordismFormalGroups stand as read at `04df60e`, nothing shared.
- Source independence: 6 changed passages compared with 1 source (changed passages only), none shared beyond four consecutive words; largest share HA, 429 of 688 locators at `04df60e`; no layer added, removed or reordered, so the contents were not compared again.

## Not verifiable

- The five imported modules and the eleven names of R03 at Tau Ceti `8b9f13d993`: no checkout of that commit is among the pinned libraries.
- Elaborated signatures of the 53 declarations, and the one-tactic probe: the file does not elaborate at the pin.

## Source issues

- none

## For the human reviewers

- **Ownership.** The description asks maintainers to choose the owner of material shared with EnhancedDerivedSheaves, BordismFormalGroups §F6.5 and #1807; R02 applies the main-first rule to this folder and would change if ownership moves.
- **Scope.** 429 of 688 locators are to HA §1.3, an author's PDF (version of 18 September 2017) that has no publisher's edition; HTT, the second source, is published.
- **Licence.** HA and SAG are read from the author's page at the Institute for Advanced Study; no licence is stated there.
- **Not tested.** `Suggested.lean` was not elaborated at any commit: the pin lacks five imported modules and the commit the description names is not available to the review.
